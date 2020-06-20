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
        public ActionResult Index()
        {
            using (var ProductDB = new FakeRealProductSystemEntities())
            {
                var _product = ProductDB.Products.ToList();
                ViewBag.ListProduct = _product;
            }
            return View("Index");
        }
    }
}