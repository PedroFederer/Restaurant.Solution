using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class OrderItemDetailVm
	{
		public int Id { get; set; }

		public int OrderItemId { get; set; }

		public int MealId { get; set; }

		[Required]
		[StringLength(50)]
		public string MealName { get; set; }

		public int MealPrice { get; set; }

		public int Qty { get; set; }
	}
}