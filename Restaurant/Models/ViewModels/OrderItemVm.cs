using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class OrderItemVm
	{
		public int Id { get; set; }

		public int OrderId { get; set; }
		public virtual ICollection<OrderItemDetailVm> OrderItemDetails { get; set; }
	}
}