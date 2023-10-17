using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class CartItemVm
	{
		public int Id { get; set; }

		public int CartId { get; set; }

		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
		public List<CartItemDetailVm> CartItemDetails { get; set; }
	}
}