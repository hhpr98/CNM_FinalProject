using AFakeProductIdentificationSystem.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI;

namespace AFakeProductIdentificationSystem.Controllers
{
    public class AddProductController : Controller
    {
        // GET: AddProduct
        public ActionResult Index()
        {
            //Index sẽ là nơi vào đầu tiên
            if (!HomeController.isLoaded) // chưa được load (!false => true)
            {
                HomeController.Load();
                HomeController.isLoaded = true;
            }

            return View();
        }

        [HttpPost]
        public ActionResult Submit(string productName, string productBranch, string productType, string productLocation, string productPrice)
        {
            //Index sẽ là nơi vào đầu tiên
            if (!HomeController.isLoaded) // chưa được load (!false => true)
            {
                HomeController.Load();
                HomeController.isLoaded = true;
            }

            string prId = "";

            using (var db = new FakeRealProductSystemEntities())
            {
                var productId = db.Products.ToList().Count; // ex: 10 -> last is PR010
                prId = getPRIdCode(productId + 1); // 11 => PR011

                Product pr = new Product();
                pr.pr_id = prId;
                pr.pr_name = productName;
                pr.pr_branch = productBranch;
                pr.pr_type = productType;
                pr.pr_origin = productLocation;
                pr.pr_price = Double.Parse(productPrice);
                db.Products.Add(pr);
                db.SaveChanges();

            }

            HomeController.blockChain.MineBlock(HomeController.minerAddress, prId);


            //Debug.WriteLine(productName);

            ViewBag.Message = "Thêm sản phẩm thành công!";

            return View("Index");
        }

        public string getPRIdCode(int IntID)
        {
            if (IntID < 10)
            {
                return "PR00" + IntID.ToString();
            }    
            else if (IntID < 100)
            {
                return "PR0" + IntID.ToString();
            }
            else
            {
                return "PR" + IntID.ToString();
            }    


            //return Guid.NewGuid().ToString(); // randomID
        }
    }
}