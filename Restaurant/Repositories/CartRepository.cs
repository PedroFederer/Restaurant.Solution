using Restaurant.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Repositories
{
	public class CartRepository
	{
		public Cart GetOrCreateCart(string account)
		{
			var db = new AppDbContext();
			var cart = db.Carts.FirstOrDefault(c => c.MemberAccount == account);
			if (cart == null)
			{
				cart = new Cart { MemberAccount = account };
				db.Carts.Add(cart);
				db.SaveChanges();

			}

			return cart;
		}


		public CartItem GetEditCartItem(int cartItemId)
		{
			var db = new AppDbContext();
			var cartItem = db.CartItems.FirstOrDefault(ci => ci.Id == cartItemId);
			return cartItem;
		}

		public void EditCartItem(CartItem cartitem)
		{
			var db = new AppDbContext();
			var details = db.CartItemDetails.Where(d => d.CartItem.Id == cartitem.Id).ToList();
			foreach (var item in details)
			{
				// details.Remove(item);
				db.CartItemDetails.Remove(item);
			}

			var cartItem = db.CartItems
				//.Include(ci => ci.CartItemDetails)
				.FirstOrDefault(ci => ci.Id == cartitem.Id);

			if (cartItem != null)
			{

				// cartItem.CartItemDetails.Clear();

				var newCartItemDetails = cartitem.CartItemDetails;
				foreach (var newItemDetail in newCartItemDetails)
				{
					var meal = db.Meals.FirstOrDefault(m => m.Name == newItemDetail.Meal.Name);
					if (meal != null)
					{
						var newDetail = new CartItemDetail
						{
							CartItem = cartItem,
							CartItemId = cartitem.Id,
							Meal = meal,
							MealId = meal.Id,
							Qty = newItemDetail.Qty
						};
						cartItem.CartItemDetails.Add(newDetail);
					}
				}
				db.SaveChanges();
			}


		}
		public bool HasOrder(string account)
		{
			var db = new AppDbContext();
			var order = db.Orders.FirstOrDefault(o => o.IsCancel == false && o.ReservationTime.Year >= DateTime.Now.Year && o.ReservationTime.Month >= DateTime.Now.Month && o.ReservationTime.Day >= DateTime.Now.Day);


			if (order != null)
			{
				return true;
			}
			else
			{ return false; }

		}


	}
}