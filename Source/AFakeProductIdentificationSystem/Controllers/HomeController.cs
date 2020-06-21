using AFakeProductIdentificationSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static AFakeProductIdentificationSystem.Models.Transaction;

namespace AFakeProductIdentificationSystem.Controllers
{
    public class HomeController : Controller
    {
        // public varible
        const string minerAddress = "miner1";
        const string adminAddress = "admin";
        const string user1Address = "user1";
        const string user2Address = "user2";

        // dùng tạm các biến static này để chứa dữ liệu
        // không dùng static thì mỗi khi gọi actionResult biến blockChain sẽ bị reset về chain rỗng (1 block gốc)
        private static BlockChain blockChain = new BlockChain(proofOfWorkDifficulty: 2, miningReward: 10);
        private static bool isLoaded = false; // chưa load -> nếu bằng true thì không load lại
        private static List<string> walletList = new List<string>() { adminAddress, user1Address, user2Address }; // khởi đầu với 3 ví
        private static List<string> passwordList = new List<string>() { "admin", "user1", "user2" };
        private static string acc = ""; // tên ví, rỗng là chưa đăng nhập

        // Load , lúc đầu block chỉ có 1 khối, thêm 1 khối giao dịch (cho user1 và user2)
        private void Load()
        {
            using (var ProductDB = new FakeRealProductSystemEntities())
            {
                var _product = ProductDB.Products.ToList();
                foreach (var item in _product)
                {
                    //blockChain.CreateTransaction(new Transactions(adminAddress, user1Address, 10));
                    blockChain.MineBlock(minerAddress, item.pr_id);
                }
            }
        }

        public ActionResult Index()
        {
            //Index sẽ là nơi vào đầu tiên
            if (!isLoaded) // chưa được load (!false => true)
            {
                this.Load();
                isLoaded = true;
            }

            ViewBag.AllChainContent = blockChain.GetHomeInfor();
            ViewBag.V = blockChain.IsValidChain();

            return View("Index");
        }

        public ActionResult About()
        {
            ViewBag.Message = "A Fake Product Identification System - AFPIS";

            //using (var ProductDB = new FakeRealProductSystemEntities())
            //{
            //    var _product = ProductDB.Products.ToList();
            //    ViewBag.ListProduct = _product;
            //}   

            return View("About");
        }
    }
}