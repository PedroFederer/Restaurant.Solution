using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Restaurant.Models.EFModels;
using Restaurant.Models.Infra;
using Restaurant.Models.Services;
using Restaurant.Models.ViewModels;

namespace Restaurant.Controllers.ApiControllers
{


    [System.Web.Http.Authorize]
    public class OrderApiController : ApiController
    {
		
		[System.Web.Http.HttpPost]
		public IHttpActionResult Checkout(string phoneNumber, int people, int reserv)
		{

			var db = new AppDbContext();
			var account = User.Identity.Name;

			var cantorder = new CartHelper().HaveOrderunDone(account);
			if (cantorder == true)
			{
				return Ok();
			}

			var cart = GetOrCreateCart(account);

			if (people > 4)
			{
				people = 4;
			}
			if (people < 1)
			{
				people = 1;
			}
			if (reserv > 9 || reserv < 1)
			{
				reserv = 1;
			}
			// 检查购物车是否为空
			if (cart.CartItems.Count() < 1)
			{
				ModelState.AddModelError("", "購物車是空的，無法進行結帳");
			}

			var cantRes = new OrderUse().GetCantRes();

			// 检查是否选择的时间已满
			if (people <= 2)
			{
				foreach (var num in cantRes[2])
				{
					if (reserv == num)
					{
						ModelState.AddModelError("", "很抱歉，該時間訂位已滿，請重新選擇預約時間");
					}
				}
			}
			else
			{
				foreach (var num in cantRes[4])
				{
					if (reserv == num)
					{
						ModelState.AddModelError("", "很抱歉，該時間訂位已滿，請重新選擇預約時間");
					}
				}
			}

			// 检查是否有错误信息
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			ProcessCheckout(cart, phoneNumber, people, reserv);

			return Ok();
		}
		private void ProcessCheckout(CartVm cart, string phoneNumber, int people, int reserv)
		{
			//建立訂單主檔明細檔
			CreateOrder(cart, phoneNumber, people, reserv);
			//清空購物車
			var account = cart.MemberAccount;
			EmptyCart(account);
		}

		private void CreateOrder(CartVm cart, string phoneNumber, int people, int reserv)
		{
			var db = new AppDbContext();
			var restime = GetReservTime(reserv);
			int tablenum;
			var memberId = db.Members.FirstOrDefault(m => m.Account == cart.MemberAccount).Id;
			int total = 0;
			if (people > 2)
			{
				tablenum = 4;
			}
			else
			{
				tablenum = 2;
			}
			var order = new Order
			{
				MemberId = memberId,
				PhoneNumber = phoneNumber,
				Diners = people,
				ReservationTime = restime,
				IsCancel = false,
				IsRefund = false,
				TableNums = tablenum,
				OrderItems = new List<OrderItem>(),

				OrderTime = DateTime.Now
			};
			foreach (var item in cart.CartItems)
			{
				var subprice = 0;
				var orderItem = new OrderItem
				{
					OrderItemDetails = new List<OrderItemDetail>()
				};
				foreach (var detail in item.CartItemDetails)
				{
					var orderItemdetail = new OrderItemDetail
					{
						MealId = detail.MealId,
						Qty = detail.Qty,
						MealPrice = db.Meals.FirstOrDefault(m => m.Id == detail.MealId).Price,
						MealName = db.Meals.FirstOrDefault(m => m.Id == detail.MealId).Name,
					};
					subprice += orderItemdetail.MealPrice * orderItemdetail.Qty;
					orderItem.OrderItemDetails.Add(orderItemdetail);
				}
				total += subprice;
				order.OrderItems.Add(orderItem);

			}

			order.TotalPrice = total;
			order.AdvancePayment = total / 10;
			db.Orders.Add(order);

			db.SaveChanges();
		}
		private void EmptyCart(string account)
		{
			var db = new AppDbContext();
			var cart = db.Carts.FirstOrDefault(c => c.MemberAccount == account);
			if (cart == null)
				return;
			db.Carts.Remove(cart);
			db.SaveChanges();
		}
		private DateTime GetReservTime(int reservationVulValue)
		{

			int[] timeSpanArr = { 11, 13, 18 };
			var now = DateTime.Now;
			DateTime targetDate;

			if (reservationVulValue >= 1 && reservationVulValue <= 3)
			{
				targetDate = now.AddDays(1).Date;
			}
			else if (reservationVulValue >= 4 && reservationVulValue <= 6)
			{
				targetDate = now.AddDays(2).Date;
				reservationVulValue -= 3; // 4, 5, 6 映射到 1, 2, 3
			}
			else
			{
				targetDate = now.AddDays(3).Date;
				reservationVulValue -= 6; // 7, 8, 9 映射到 1, 2, 3
			}

			int hoursToAdd = timeSpanArr[reservationVulValue - 1]; // 陣列索引從0開始
			return targetDate.AddHours(hoursToAdd);
		}
		private CartVm GetOrCreateCart(string account)
		{
			var db = new AppDbContext();
			var cart = db.Carts.FirstOrDefault(c => c.MemberAccount == account);
			if (cart == null)
			{
				cart = new Cart { MemberAccount = account };
				db.Carts.Add(cart);
				db.SaveChanges();

			}

			return new CartVm
			{
				Id = cart.Id,
				MemberAccount = cart.MemberAccount,
				CartItems = cart.CartItems.Select(ci => new CartItemVm
				{
					Id = ci.Id,
					CartId = ci.CartId,
					CartItemDetails = ci.CartItemDetails.Select(cid => new CartItemDetailVm
					{

						Id = cid.Id,
						CartItemId = cid.CartItemId,
						MealId = cid.MealId,
						MealName = cid.Meal.Name,
						MealPrice = cid.Meal.Price,
						Qty = cid.Qty,
					}).ToList(),

				}).ToList()

			};
		}
	}
}
