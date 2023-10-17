namespace Restaurant.Models.EFModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderItemDetail")]
    public partial class OrderItemDetail
    {
        public int Id { get; set; }

        public int OrderItemId { get; set; }

        public int MealId { get; set; }

        [Required]
        [StringLength(50)]
        public string MealName { get; set; }

        public int MealPrice { get; set; }

        public int Qty { get; set; }

        public virtual Meal Meal { get; set; }

        public virtual OrderItem OrderItem { get; set; }
    }
}
