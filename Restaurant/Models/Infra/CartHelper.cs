using Restaurant.Models.EFModels;
using Restaurant.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Restaurant.Models.Infra
{
	public class CartHelper
	{
		//用帳號得到會員
		public Member GetMember(string account)
		{
			var db = new AppDbContext();
			var member = db.Members.FirstOrDefault(m => m.Account == account);
			return member;
		}


		//得到所有主菜
		public List<Meal> GetMainMeals()
		{
			var db = new AppDbContext();
			var mainMeals = db.Meals.Where(m => m.Category.Name == "主菜");
			return mainMeals.ToList();
		}


		//得到可訂位日期
		public string[] GetDateStringArr()
		{
			var culture = new CultureInfo("zh-TW");
			var result = new string[3];
			var now = DateTime.Now.Date;
			var tomorrow = now.AddDays(1);
			var theDayAftertomorrow = now.AddDays(2);
			var afterThreedays = now.AddDays(3);
			result[0] = tomorrow.ToString("yyyy年MM月dd日") + " (" + culture.DateTimeFormat.GetDayName(tomorrow.DayOfWeek) + ")";
			result[1] = theDayAftertomorrow.ToString("yyyy年MM月dd日") + " (" + culture.DateTimeFormat.GetDayName(theDayAftertomorrow.DayOfWeek) + ")";
			result[2] = afterThreedays.ToString("yyyy年MM月dd日") + " (" + culture.DateTimeFormat.GetDayName(afterThreedays.DayOfWeek) + ")";
			return result;
		}


		//得到是否有訂單
		public bool HaveOrderunDone(string account)
		{
			var db = new AppDbContext();
			var memberId = db.Members.FirstOrDefault(m => m.Account == account).Id;
			DateTime nowAfter2 = DateTime.Now.AddHours(2);
			var newOrder = db.Orders.Where(o => o.ReservationTime >= nowAfter2 && o.MemberId == memberId && o.IsCancel == false).FirstOrDefault();
			if (newOrder == null)
			{
				//沒有未完成訂單
				return false;
			}
			else
			{
				//有訂單未完成
				return true;
			}
		}

		//得到可訂為日期包含時段
		public DateTime GetReservTime(int reservationVulValue)
		{
			if (reservationVulValue > 9 || reservationVulValue < 1)
			{
				reservationVulValue = 1;
			}
			int[] timeSpanArr = { 11, 13, 18 };
			var now = DateTime.Now;
			DateTime targetDate;

			if (reservationVulValue >= 1 && reservationVulValue <= 3)
			{
				targetDate = now.AddDays(1).Date;
			}
			else if (reservationVulValue >= 4 && reservationVulValue <= 6)
			{
				targetDate = now.AddDays(2).Date;
				reservationVulValue -= 3; // 4, 5, 6 映射到 1, 2, 3
			}
			else
			{
				targetDate = now.AddDays(3).Date;
				reservationVulValue -= 6; // 7, 8, 9 映射到 1, 2, 3
			}

			int hoursToAdd = timeSpanArr[reservationVulValue - 1]; // 陣列索引從0開始
			return targetDate.AddHours(hoursToAdd);
		}



		//得到是否退訂金
		public bool IsRefund(Order order)
		{
			var now = DateTime.Now;
			TimeSpan timeDifference = order.ReservationTime - now;
			if (timeDifference.TotalHours >= 24)
			{
				return true;
			}
			else
			{
				return false;
			}
		}



		//得到能加點的下拉式選單
		public Dictionary<int, List<Meal>> GetCanSecOrders()
		{
			var db = new AppDbContext();
			var meals = db.Meals;
			Dictionary<int, List<Meal>> canSecOrders = new Dictionary<int, List<Meal>>();
			var sides = meals.Where(m => m.Category.Name == "配菜");
			var drinks = meals.Where(m => m.Category.Name == "飲料");
			var wines = meals.Where(m => m.Category.Name == "酒精");
			canSecOrders.Add(1, sides.ToList());
			canSecOrders.Add(2, drinks.ToList());
			canSecOrders.Add(3, wines.ToList());
			return canSecOrders;
		}



		//得到套餐的下拉式選單
		public Dictionary<int, List<MealVm>> GetSetSelectMealVm(CartItemVm vm)
		{
			var dictionary = new Dictionary<int, List<MealVm>>();
			var db = new AppDbContext();
			foreach (var item in vm.CartItemDetails)
			{
				List<Meal> mealList = db.Meals.ToList();

				// 调用扩展方法并存储结果在变量中
				List<MealVm> mealVms = mealList.GetMealVms(item.MealId);
				dictionary.Add(item.MealId, mealVms);
			}
			return dictionary;

		}
	}
}