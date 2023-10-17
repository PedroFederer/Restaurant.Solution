using Dapper;
using Restaurant.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Restaurant.Repositories
{
	public class MealsRepository
	{
		public List<MealIndexVm> GetMeals()
		{
			using (var conn = new SqlConnection("data source=.\\sql2022;initial catalog=FDB09;user id=sa5;password=sa5;MultipleActiveResultSets=True"))
			{
				var sql = @"WITH 
					RankMeals AS(SELECT m.*, C.Name as CategoryName,ROW_NUMBER() OVER(PARTITION BY m.CategoryId ORDER BY m.Id) 
					as rank 
					FROM Meals M 
					INNER JOIN Categories C ON C.Id = M.CategoryId)
					SELECT * FROM RankMeals 
					WHERE rank<=2";
				var meals = conn
					.Query<MealIndexVm>(sql)
					.ToList();
				return meals;
			}
		}
	}
}