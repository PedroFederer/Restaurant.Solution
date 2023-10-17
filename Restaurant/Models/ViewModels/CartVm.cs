using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Restaurant.Models.ViewModels
{
	public class CartVm
	{
		public int Id { get; set; }
		[Display(Name = "會員帳號")]
		[Required]
		[StringLength(50)]
		public string MemberAccount { get; set; }

		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
		public virtual ICollection<CartItemVm> CartItems { get; set; }
	}
}