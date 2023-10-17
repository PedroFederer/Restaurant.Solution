using Restaurant.Models.ViewModels;
using Restaurant.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Restaurant.Controllers.Meals
{
	public class MealsApiController : ApiController
	{
		// GET api/<controller>
		[HttpGet]
		public IHttpActionResult Get()
		{
			var vms = new MealsRepository().GetMeals();
			List<MealGroupVm> result = new List<MealGroupVm>();
			for(int i = 0; i < vms.Count; i += 2)
            {
				if (i + 1 < vms.Count)
				{
					result.Add(new MealGroupVm(vms[i], vms[i + 1]));
				}
				else
				{
					result.Add(new MealGroupVm(vms[i], null));
				}
			}
			return Ok(result);
		}
	}

	public class MealGroupVm //將資料兩兩一組
	{

		public string Name1 { get; set; }
		public string Name2 { get; set; }
		public string Description1 { get; set; }
		public string Description2 { get; set; }
		public string MealsImage1 { get; set; }
		public string MealsImage2 { get; set; }
		public string CategoryName1 { get; set; }
		public string CategoryName2 { get; set; }
		public int Price1 { get; set; }
		public int Price2 { get; set; }

		public MealGroupVm(MealIndexVm vm1, MealIndexVm vm2)
		{
			// 這裡要把 vm1, vm2 的資料填入
			Name1 = vm1.Name;
			Name2 = vm2.Name;
			Description1 = vm1.Description;
			Description2 = vm2.Description;
			MealsImage1 = vm1.MealsImage;
			MealsImage2 = vm2.MealsImage;
			CategoryName1 = vm1.CategoryName;
			CategoryName2 = vm2.CategoryName;
			Price1 = vm1.Price;
			Price2 = vm2.Price;
		}
	}
}
