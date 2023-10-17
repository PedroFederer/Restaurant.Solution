using Restaurant.Models.EFModels;
using Restaurant.Models.ViewModels;
using Restaurant.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.Services
{
	public class CartService
	{
		public CartVm GetOrCreateCart(string account)
		{

			var cart = new CartRepository().GetOrCreateCart(account);

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

		public CartItem GetEditCartItem(int cartItemId)
		{

			var cartItem = new CartRepository().GetEditCartItem(cartItemId);
			return cartItem;
		}


		public void EditCartItem(CartItemVm vm)
		{
			var cartitem = new CartItem
			{

				Id = vm.Id,
				CartId = vm.CartId,
				CartItemDetails = vm.CartItemDetails.Select(d => new CartItemDetail
				{
					CartItemId = d.CartItemId,
					Meal = new Meal
					{
						Name = d.MealName
					},
					Qty = d.Qty,

				}).ToList()

			};
			new CartRepository().EditCartItem(cartitem);
		}
	}
}