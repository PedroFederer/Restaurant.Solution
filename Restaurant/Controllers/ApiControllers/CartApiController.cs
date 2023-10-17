using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using Restaurant.Models.EFModels;
using Restaurant.Models.Infra;
using Restaurant.Models.Services;
using Restaurant.Models.ViewModels;

namespace Restaurant.Controllers.ApiControllers
{


    [System.Web.Http.Authorize]
    public class CartApiController : ApiController
    {

		//用抓取素材遍歷所有菜單選項
		[System.Web.Http.HttpGet]
		public IHttpActionResult AddMeals()
		{
			List<CategoryVm> categories = new CartApiHelper().GetCategoriesAndMeals().ToList();
			return Ok(categories);
		}



		//套餐的加入購物車
		[System.Web.Http.HttpPost]
		public IHttpActionResult AddCart(int[] mealIds)
		{
			string account = User.Identity.Name;
			int qty = 1;


			using (var db = new AppDbContext())
			{
				new CartApiHelper().AddToCart(db, account, mealIds, qty);
				CartVm cart = new CartApiHelper().GetOrCreateCart(account);
				return Ok(cart);
			}


		}


        [System.Web.Http.Authorize]
        //加點的加入購物車
        [System.Web.Http.HttpPost]
		public IHttpActionResult AddSecCart(string mealName, int qty)
		{
			string account =  User.Identity.Name;


			using (var db = new AppDbContext())
			{
				new CartApiHelper().AddSecToCart(db, account, mealName, qty);
				CartVm cart = new CartApiHelper().GetOrCreateCart(account);
				return Ok(cart);
			}


		}




        [System.Web.Http.Authorize]
        //刪除購物明細
        [System.Web.Http.HttpDelete]
		public IHttpActionResult DeleteCartItem(int cartItemId)
		{

			using (var db = new AppDbContext())
			{
				var cartItem = db.CartItems.FirstOrDefault(c => c.Id == cartItemId);
				if (cartItem != null)
				{
					db.CartItems.Remove(cartItem);
					db.SaveChanges();
				}

				//db.Dispose();
			}

			string account =  User.Identity.Name;

			CartVm cart = new CartApiHelper().GetOrCreateCart(account);

			return Ok(cart);
		}


	}
}
