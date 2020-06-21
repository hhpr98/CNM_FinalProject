using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AFakeProductIdentificationSystem.Models;


namespace AFakeProductIdentificationSystem.Controllers
{
    public class CheckQRController : Controller
    {
        // GET: CheckQR
        public ActionResult Index(string id)
        {
            //Index sẽ là nơi vào đầu tiên
            if (!HomeController.isLoaded) // chưa được load (!false => true)
            {
                HomeController.Load();
                HomeController.isLoaded = true;
            }

            using (var context = new FakeRealProductSystemEntities())
            {
                var _product = (from p in context.Products where (p.pr_id == id) select p).ToList();
                ViewBag.ListProduct = _product;
            }
                return View("Index");
        }


    }
}