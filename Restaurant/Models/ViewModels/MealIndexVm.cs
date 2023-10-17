using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class MealIndexVm
	{
		public int Id { get; set; }


		[Display(Name = "餐點名稱")]
		public string Name { get; set; }

		[Display(Name = "分類名稱")]
		public string CategoryName { get; set; }

		[Display(Name = "售價")]
		public int Price { get; set; }

		[Display(Name = "餐點圖片")]
		public string MealsImage { get; set; }

		[Display(Name = "餐點描述")]
		public string Description { get; set; }

	}
}