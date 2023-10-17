using Restaurant.Models.EFModels;
using Restaurant.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Restaurant.Models.Infra
{
	public class CartApiHelper
	{
		public IEnumerable<CategoryVm> GetCategoriesAndMeals()
		{
			using (var db = new AppDbContext())
			{
				var categories = db.Categories.ToList();
				var categoryDictionary = new List<CategoryVm>();

				foreach (var category in categories)
				{
					var newCategory = new CategoryVm
					{
						Id = category.Id,
						Name = category.Name,
						Meals = category.Meals.Select(meal => new MealVm
						{
							Id = meal.Id,
							Name = meal.Name,
							MealsImage = meal.MealsImage,
							Price = meal.Price,
							CategoryId = category.Id,
						}).ToList()
					};

					categoryDictionary.Add(newCategory);
				}

				return categoryDictionary;
			}
		}

		public void AddToCart(AppDbContext db, string account, int[] mealIds, int qty)
		{
			// 取得目前購物車主檔，若沒有，就立刻新增一筆並傳回
			var cart = db.Carts.FirstOrDefault(c => c.MemberAccount == account);
			if (cart == null)
			{
				return;
			}
			var cartItem = new CartItem { CartId = cart.Id };
			var items = new List<CartItemDetail>();
			foreach (var mealId in mealIds)
			{
				var item = new CartItemDetail
				{
					MealId = mealId,
					Qty = qty,
				};
				items.Add(item);
			}
			db.CartItems.Add(cartItem);
			db.SaveChanges();

			AddCartItem(db, items, cartItem);

		}


		private void AddCartItem(AppDbContext db, List<CartItemDetail> items, CartItem cartItem)
		{
			var cartItemDetail = db.CartItemDetails.FirstOrDefault(x => x.CartItemId == cartItem.Id);

			if (cartItemDetail == null)
			{
				foreach (var item in items)
				{
					var meal = db.Meals.FirstOrDefault(m => m.Id == item.MealId);

					if (meal != null)
					{
						cartItemDetail = new CartItemDetail
						{
							CartItemId = cartItem.Id,
							MealId = item.MealId,
							Qty = item.Qty
						};


						db.CartItemDetails.Add(cartItemDetail);
					}
					else
					{
						cartItemDetail.Qty += item.Qty;
					}
				}

			}


			db.SaveChanges();
		}

		public void AddSecToCart(AppDbContext db, string account, string mealName, int qty)
		{
			// 取得目前購物車主檔，若沒有，就立刻新增一筆並傳回
			var cart = db.Carts.FirstOrDefault(c => c.MemberAccount == account);
			var mealId = db.Meals.FirstOrDefault(m => m.Name == mealName).Id;
			var cartitems = cart.CartItems;
			CartItem seCartitem = null;
			var haveDetail = false;
			foreach (var cartitem in cartitems)
			{
				if (cartitem.CartItemDetails.FirstOrDefault().Meal.Category.Name != "主菜")
				{
					seCartitem = cartitem;
					foreach (var detail in seCartitem.CartItemDetails)
					{
						if (mealId == detail.MealId)
						{
							detail.Qty += qty;
							haveDetail = true;
						}
					}
					if (haveDetail == false)
					{

						var newDetail = new CartItemDetail
						{
							MealId = mealId,
							Qty = qty,
						};
						seCartitem.CartItemDetails.Add(newDetail);
					}

				}

			}
			if (seCartitem == null)
			{
				var newSeCartitem = new CartItem
				{
					CartId = cart.Id,
					CartItemDetails = new List<CartItemDetail>()

				};
				var item = new CartItemDetail
				{
					MealId = mealId,
					Qty = qty,
				};
				newSeCartitem.CartItemDetails.Add(item);
				db.CartItems.Add(newSeCartitem);
			}
			db.SaveChanges();

		}


		public CartVm GetOrCreateCart(string account)
		{
			Cart cart = null;

			var db = new AppDbContext();

			cart = db.Carts.AsNoTracking()
				.Include(c => c.CartItems)
				.Include(c => c.CartItems.Select(ci => ci.CartItemDetails))
				.FirstOrDefault(c => c.MemberAccount == account);


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