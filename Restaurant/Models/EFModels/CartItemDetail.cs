namespace Restaurant.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CartItemDetail")]
    public partial class CartItemDetail
    {
        public int Id { get; set; }

        public int CartItemId { get; set; }

        public int MealId { get; set; }

        public int Qty { get; set; }

        public virtual CartItem CartItem { get; set; }

        public virtual Meal Meal { get; set; }
    }
}
