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
            using (var context = new FakeRealProductSystemEntities())
            {
                var _product = (from p in context.Products where (p.pr_id == id) select p).ToList();
                ViewBag.ListProduct = _product;
            }
         
            return View("Index");
        }


    }
}