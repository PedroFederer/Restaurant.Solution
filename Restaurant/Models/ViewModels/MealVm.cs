using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class MealVm
	{
		public int Id { get; set; }

		[Required]
		[StringLength(50)]
		public string Name { get; set; }

		public int CategoryId { get; set; }

		public int Price { get; set; }

		public bool Status { get; set; }

		[StringLength(3000)]
		public string Description { get; set; }

		[Required]
		[StringLength(50)]
		public string MealsImage { get; set; }
	}
}