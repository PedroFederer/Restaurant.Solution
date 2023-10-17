using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Restaurant.Models.EFModels
{
	public partial class AppDbContext : DbContext
	{
		public AppDbContext()
			: base("name=AppDbContext")
		{
		}

		public virtual DbSet<CartItemDetail> CartItemDetails { get; set; }
		public virtual DbSet<CartItem> CartItems { get; set; }
		public virtual DbSet<Cart> Carts { get; set; }
		public virtual DbSet<Category> Categories { get; set; }
		public virtual DbSet<Meal> Meals { get; set; }
		public virtual DbSet<Member> Members { get; set; }
		public virtual DbSet<OrderItemDetail> OrderItemDetails { get; set; }
		public virtual DbSet<OrderItem> OrderItems { get; set; }
		public virtual DbSet<Order> Orders { get; set; }
		public virtual DbSet<Table> Tables { get; set; }
		public virtual DbSet<User> Users { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Category>()
				.HasMany(e => e.Meals)
				.WithRequired(e => e.Category)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Meal>()
				.HasMany(e => e.CartItemDetails)
				.WithRequired(e => e.Meal)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Meal>()
				.HasMany(e => e.OrderItemDetails)
				.WithRequired(e => e.Meal)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Member>()
				.Property(e => e.PhoneNumber)
				.IsFixedLength();

			modelBuilder.Entity<Member>()
				.Property(e => e.ConfirmCode)
				.IsUnicode(false);

			modelBuilder.Entity<Member>()
				.HasMany(e => e.Orders)
				.WithRequired(e => e.Member)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<OrderItem>()
				.HasMany(e => e.OrderItemDetails)
				.WithRequired(e => e.OrderItem)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Order>()
				.Property(e => e.PhoneNumber)
				.IsFixedLength();

			modelBuilder.Entity<Order>()
				.HasMany(e => e.OrderItems)
				.WithRequired(e => e.Order)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<User>()
				.Property(e => e.Password)
				.IsUnicode(false);
		}
	}
}
