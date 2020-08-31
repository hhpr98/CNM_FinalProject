using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QRCoder;
using System.IO;
using System.Drawing;
using System.Threading.Tasks;
using AFakeProductIdentificationSystem.Models;

namespace AFakeProductIdentificationSystem.Controllers
{
    public class GenerateQRController : Controller
    {
        // GET: GenerateQR
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
        public ActionResult Index(string qrText)
        {
            //Index sẽ là nơi vào đầu tiên
            if (!HomeController.isLoaded) // chưa được load (!false => true)
            {
                HomeController.Load();
                HomeController.isLoaded = true;
            }

            string link = "https://localhost:44308/CheckQR/Index/";
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(link + qrText, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);

            ViewBag.Message = "Tạo mã QR thành công!";

            return View(BitmapToBytes(qrCodeImage));
        }

        private static Byte[] BitmapToBytes(Bitmap img)
        {
            using (MemoryStream stream = new MemoryStream())
            {
                img.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                return stream.ToArray();
            }
        }

        //public ActionResult GenerateFile()
        //{
        //    return View();
        //}

        //[HttpPost]
        //public ActionResult GenerateFile(string qrText)
        //{
        //    QRCodeGenerator qrGenerator = new QRCodeGenerator();
        //    QRCodeData qrCodeData = qrGenerator.CreateQrCode(qrText, QRCodeGenerator.ECCLevel.Q);
        //    string fileGuid = Guid.NewGuid().ToString().Substring(0, 4);
        //    qrCodeData.SaveRawData("wwwroot/qrr/file-" + fileGuid + ".qrr", QRCodeData.Compression.Uncompressed);

        //    QRCodeData qrCodeData1 = new QRCodeData("wwwroot/qrr/file-" + fileGuid + ".qrr", QRCodeData.Compression.Uncompressed);
        //    QRCode qrCode = new QRCode(qrCodeData1);
        //    Bitmap qrCodeImage = qrCode.GetGraphic(20);
        //    return View(BitmapToBytes(qrCodeImage));
        //}

    }
}