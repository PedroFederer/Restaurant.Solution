using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Restaurant.Models.EFModels;
using Restaurant.Models.Services;

namespace Restaurant.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Reservation()
        {
            var datenow=DateTime.Now.Date;
            var datetomorrow=datenow.AddDays(1);
            var dateTheDayAfterTomorrow = datenow.AddDays(2);
            var dateAfterThreeDays = datenow.AddDays(3);
            ViewBag.datetomorrow= datetomorrow;
            ViewBag.dateTheDayAfterTomorrow = dateTheDayAfterTomorrow;
            ViewBag.dateAfterThreeDays = dateAfterThreeDays;
            ViewBag.cantRes = new OrderUse().GetCantRes();
            return View();
        }

        
    }
    
}