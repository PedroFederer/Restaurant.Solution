using Restaurant.Models.EFModels;
using Restaurant.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.Infra
{
	public static class SelectListHelper
	{
		public static List<MealVm> GetMealVms(this List<Meal> meals, int mealId)
		{
			var db = new AppDbContext();
			var meal = db.Meals.FirstOrDefault(m => m.Id == mealId);
			var categoryId = meal.CategoryId;
			var vms = new List<MealVm>();
			foreach (var item in meals)
			{
				if (item.CategoryId == categoryId)
				{
					var vm = new MealVm
					{
						Name = item.Name,
						Price = item.Price,
						Id = item.Id
					};
					vms.Add(vm);
				}
			}
			return vms;
		}
	}
}