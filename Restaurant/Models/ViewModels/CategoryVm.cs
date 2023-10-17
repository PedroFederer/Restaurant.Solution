using Restaurant.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class CategoryVm
	{
		public int Id { get; set; }

		[Required]
		[StringLength(50)]
		public string Name { get; set; }

		public int DisplayOrder { get; set; }


		public List<MealVm> Meals { get; set; }
	}
}