using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Globalization;
using Restaurant.Models.EFModels;
using Restaurant.Models.ViewModels;
using Restaurant.Models.Services;
using Restaurant.Models.Infra;

namespace WebApplication1.Controllers
{
	public class CartController : Controller
	{
        // GET: Cart

        [Authorize]
        public ActionResult Cart(int? people, int? reservationVul)
		{
			string account =  User.Identity.Name;
			var member = new CartHelper().GetMember(account);
			ViewBag.Member = member;//會員裝袋
			CartVm cart = new CartService().GetOrCreateCart(account);

			int peopleValue = people ?? 0; // 如果 people 為 null，則設置為 0
			int reservationVulValue = reservationVul ?? 0; // 如果 reservationVul 為 null，則設置為 0
			ViewBag.people = peopleValue;
			if (reservationVulValue != 0)
			{

				var culture = new CultureInfo("zh-Tw");

				var reservationtime = new CartHelper().GetReservTime(reservationVulValue);
				var reservationtimeString = reservationtime.ToString("yyyy/MM/dd") + "(" + culture.DateTimeFormat.GetDayName(reservationtime.DayOfWeek) + ") " + reservationtime.Hour + ":00 -" + (reservationtime.Hour + 2) + ":00";
				ViewBag.reservationtime = reservationtimeString;
			}
			ViewBag.reservationVul = reservationVul;
			Session["people"] = ViewBag.people;
			Session["reservationtime"] = reservationVul;
			// 繼續處理你的 Cart 方法
			//放入要用的選擇日期 字串陣列到ViewBag
			ViewBag.resSelectUseArr = new CartHelper().GetDateStringArr();
			ViewBag.cantRes = new OrderUse().GetCantRes();

			var mainMeals = new CartHelper().GetMainMeals();
			ViewBag.mainMeals = mainMeals;
			var cantorder = new CartHelper().HaveOrderunDone(account);
			if (cantorder == true)
			{
				return RedirectToAction("ConfirmCheckout", new { haveRes = "haveRes" });
			}
			else
			{
				return View(cart);

			}

		}

        //編輯套餐

        [Authorize]
        public ActionResult EditCartItem(int cartItemId)
		{


			var cartItem = new CartService().GetEditCartItem(cartItemId);
			var vm = new CartItemVm
			{
				Id = cartItemId,
				CartId = cartItem.CartId,
				CartItemDetails = cartItem.CartItemDetails.Select(cid => new CartItemDetailVm
				{

					Id = cid.Id,
					CartItemId = cid.CartItemId,
					MealId = cid.MealId,
					MealName = cid.Meal.Name,
					MealPrice = cid.Meal.Price,
					Qty = cid.Qty,
				}).ToList()

			};
			//套餐下拉式選單
			var dictionary = new CartHelper().GetSetSelectMealVm(vm);

			ViewBag.dictionary = dictionary;


			return View(vm);
		}

        [Authorize]
        [HttpPost]
		public ActionResult EditCartItem(CartItemVm vm)
		{
			new CartService().EditCartItem(vm);

			return RedirectToAction("Cart", new { people = Session["people"], reservationVul = Session["reservationtime"] });
		}


        //編輯加點

        [Authorize]
        public ActionResult EditCartSecItem(int cartItemId)
		{
			var db = new AppDbContext();
			var cartItem = db.CartItems.FirstOrDefault(c => c.Id == cartItemId);
			var cartItemVm = new CartItemVm
			{
				Id = cartItemId,
				CartId = cartItem.CartId,
				CartItemDetails = cartItem.CartItemDetails.Select(d => new CartItemDetailVm
				{
					MealId = d.MealId,
					Qty = d.Qty,
					MealName = d.Meal.Name,
					MealPrice = d.Meal.Price,
					CartItemId = d.CartItemId,

				}).ToList(),
			};
			var CanSecOrders = new CartHelper().GetCanSecOrders();
			ViewBag.CanSecOrders = CanSecOrders;
			ViewBag.people = Session["people"];
			ViewBag.reservationtime = Session["reservationtime"];
			return View(cartItemVm);
		}


        [Authorize]
        [HttpPost]
		public ActionResult EditCartSecItem(CartItemVm vm)
		{
			var db = new AppDbContext();
			var cartItem = db.CartItems.FirstOrDefault(ci => ci.Id == vm.Id);
			if (vm.CartItemDetails == null)
			{
				db.CartItems.Remove(cartItem);
				db.SaveChanges();
				return null;
			}
			var details = db.CartItemDetails.Where(d => d.CartItem.Id == vm.Id).ToList();
			foreach (var item in details)
			{
				// details.Remove(item);
				db.CartItemDetails.Remove(item);
			}
			// db.SaveChanges();



			if (cartItem != null)
			{

				// cartItem.CartItemDetails.Clear();

				var newCartItemDetails = vm.CartItemDetails;
				foreach (var newItemDetail in newCartItemDetails)
				{
					var meal = db.Meals.FirstOrDefault(m => m.Id == newItemDetail.MealId);
					if (meal != null)
					{
						var newDetail = new CartItemDetail
						{
							CartItem = cartItem,
							CartItemId = vm.Id,
							Meal = meal,
							MealId = meal.Id,
							Qty = newItemDetail.Qty,

						};
						cartItem.CartItemDetails.Add(newDetail);
					}
				}
				db.SaveChanges();
			}
			return null;
		}





        [Authorize]
        //訂單明細頁
        public ActionResult ConfirmCheckout(string haveRes)
		{
			if (string.IsNullOrEmpty(haveRes) == false)
			{
				ViewBag.haveRes = haveRes;
			}
			var account =  User.Identity.Name;
			var db = new AppDbContext();
			var memberId = db.Members.FirstOrDefault(m => m.Account == account).Id;
			var cantorder = new CartHelper().HaveOrderunDone(account);
			var order = db.Orders.FirstOrDefault(o => o.MemberId == memberId && o.IsCancel == false && cantorder == true&&o.ReservationTime>=DateTime.Now);
			var ordervm = new OrderVm
			{
				Id = order.Id,
				ReservationTime = order.ReservationTime,
				Diners = order.Diners,
				TotalPrice = order.TotalPrice,
				MemberName = db.Members.FirstOrDefault(m => m.Id == memberId).Name,
				PhoneNumber = order.PhoneNumber,
				OrderItems = order.OrderItems.Select(oi => new OrderItemVm
				{
					Id = oi.Id,
					OrderId = oi.OrderId,
					OrderItemDetails = oi.OrderItemDetails.Select(oid => new OrderItemDetailVm
					{
						Id = oid.Id,
						OrderItemId = oid.OrderItemId,
						MealId = oid.MealId,
						MealName = oid.MealName,
						MealPrice = oid.MealPrice,
						Qty = oid.Qty

					}).ToList()
				}).ToList()

			};
			ViewBag.mainMeal = new CartHelper().GetMainMeals();
			if (order != null)
			{
				return View(ordervm);
			}
			else
			{
				return RedirectToAction("Home/Reservation");
			}
		}


        [Authorize]
        //取消訂單
        public ActionResult CancelOrder()
		{
			var db = new AppDbContext();
			var account =  User.Identity.Name;
			var cantorder = new CartHelper().HaveOrderunDone(account);
			var memberId = db.Members.FirstOrDefault(m => m.Account == account).Id;
			var order = db.Orders.FirstOrDefault(o => o.MemberId == memberId && cantorder == true && o.IsCancel == false);
			order.IsCancel = true;
			var isRefund = new CartHelper().IsRefund(order);
			if (isRefund == true)
			{
				order.IsRefund = true;
			}
			db.SaveChanges();
			return null;
		}
	}
}