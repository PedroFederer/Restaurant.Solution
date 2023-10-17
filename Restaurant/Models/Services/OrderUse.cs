using Restaurant.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Restaurant.Models.Services
{
	public class OrderUse
	{
		public Dictionary<int, List<int>> GetCantRes()
		{
			var dictionary = new Dictionary<int, List<int>>();
			var result1 = GetCantResforTable(2);
			dictionary.Add(2, result1);
			var result2 = GetCantResforTable(4);
			dictionary.Add(4, result2);
			return dictionary;

		}
		private List<int> GetCantResforTable(int table)
		{
			var result = new List<int>();
			var db = new AppDbContext();
			var tomorrow = DateTime.Now.Date.AddDays(1); // 使用Date属性以忽略时间部分


			var ordersTomorrow11Count = db.Orders
				.Where(o => o.ReservationTime.Year == tomorrow.Year
				&& o.ReservationTime.Month == tomorrow.Month
				&& o.ReservationTime.Day == tomorrow.Day
				&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 11)
				.Count();

			if (ordersTomorrow11Count >= 10)
			{
				result.Add(1);
			}
			var ordersTomorrow13Count = db.Orders
				 .Where(o => o.ReservationTime.Year == tomorrow.Year
				 && o.ReservationTime.Month == tomorrow.Month
				 && o.ReservationTime.Day == tomorrow.Day
				 && o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 13)
				 .Count();
			if (ordersTomorrow13Count >= 10)
			{
				result.Add(2);
			}
			var ordersTomorrow18Count = db.Orders
				.Where(o => o.ReservationTime.Year == tomorrow.Year
				&& o.ReservationTime.Month == tomorrow.Month
				&& o.ReservationTime.Day == tomorrow.Day
				&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 18)
				.Count();
			if (ordersTomorrow18Count >= 10)
			{
				result.Add(3);
			}
			var TheDayAfterTomorrow = DateTime.Now.AddDays(2);
			var ordersTheDayAfterTomorrow11 = db.Orders
				.Where(o => o.ReservationTime.Year == TheDayAfterTomorrow.Year
				&& o.ReservationTime.Month == TheDayAfterTomorrow.Month
				&& o.ReservationTime.Day == TheDayAfterTomorrow.Day
				&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 11)
				.Count();
			if (ordersTheDayAfterTomorrow11 >= 10)
			{
				result.Add(4);
			}
			var ordersTheDayAfterTomorrow13 = db.Orders
				.Where(o => o.ReservationTime.Year == TheDayAfterTomorrow.Year
				&& o.ReservationTime.Month == TheDayAfterTomorrow.Month
				&& o.ReservationTime.Day == TheDayAfterTomorrow.Day
				&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 13)
				.Count();
			if (ordersTheDayAfterTomorrow13 >= 10)
			{
				result.Add(5);
			}
			var ordersTheDayAfterTomorrow18 = db.Orders
				.Where(o => o.ReservationTime.Year == TheDayAfterTomorrow.Year
				&& o.ReservationTime.Month == TheDayAfterTomorrow.Month
				&& o.ReservationTime.Day == TheDayAfterTomorrow.Day
				&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 18)
				.Count();
			if (ordersTheDayAfterTomorrow18 >= 10)
			{
				result.Add(6);
			}
			var AfterThreedays = DateTime.Now.AddDays(3);
			var ordersAfterThreedays11 = db.Orders
				 .Where(o => o.ReservationTime.Year == AfterThreedays.Year
				 && o.ReservationTime.Month == AfterThreedays.Month
				 && o.ReservationTime.Day == AfterThreedays.Day
				 && o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 11)
				 .Count();
			if (ordersAfterThreedays11 >= 10)
			{
				result.Add(7);
			}
			var ordersAfterThreedays13 = db.Orders
				 .Where(o => o.ReservationTime.Year == AfterThreedays.Year
				 && o.ReservationTime.Month == AfterThreedays.Month
				 && o.ReservationTime.Day == AfterThreedays.Day
				 && o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 13)
				 .Count();
			if (ordersAfterThreedays13 >= 10)
			{
				result.Add(8);
			}
			var ordersAfterThreedays18 = db.Orders
							.Where(o => o.ReservationTime.Year == AfterThreedays.Year
							&& o.ReservationTime.Month == AfterThreedays.Month
							&& o.ReservationTime.Day == AfterThreedays.Day
							&& o.TableNums == table && o.IsCancel == false && o.ReservationTime.Hour == 18)
							.Count();
			if (ordersAfterThreedays18 >= 10)
			{
				result.Add(9);
			}
			return result;
		}
	}
}