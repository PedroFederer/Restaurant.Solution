using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class CartItemDetailVm
	{
		public int Id { get; set; }

		public int CartItemId { get; set; }

		public int MealId { get; set; }

		public int MealPrice { get; set; }
		public string MealName { get; set; }
		public int Qty { get; set; }
	}
}