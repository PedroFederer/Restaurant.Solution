using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class OrderVm
	{
		public int Id { get; set; }

		public string MemberName { get; set; }
		public DateTime ReservationTime { get; set; }

		public int Diners { get; set; }

		public int TotalPrice { get; set; }
		public string PhoneNumber { get; set; }
		public virtual ICollection<OrderItemVm> OrderItems { get; set; }
	}
}