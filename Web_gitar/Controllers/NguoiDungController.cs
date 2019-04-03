using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GuitarShop.Models;



namespace GuitarShop.Controllers
{
    public class NguoiDungController : Controller
    {
        // GET: NguoiDung
        DataClasses1DataContext data = new DataClasses1DataContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DangKi()
        {
            return View();
        }
        //POST :Hàm DangKi nhận dữ liệu từ trang DangKi và tạo mới dữ liệu
        [HttpPost]
        public ActionResult DangKi(FormCollection collection, KhachHang KH)
        {
            // Gán các giá trị đã nhập
            var hoten = collection["HoTenKH"];
            var taikhoan = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            //var nhaplaimatkhau = collection["NhapLaiMatKhau"];
            var email = collection["Email"];
            var diachi = collection["DiaChi"];
            var dienthoai = collection["DienThoai"];
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "* Bắt buộc";
            }
            else if (String.IsNullOrEmpty(taikhoan))
            {
                ViewData["Loi2"] = "* Bắt buộc";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "* Bắt buộc";
            }
         
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "* Bắt buộc";
            }
            else if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi6"] = "* Bắt buộc";
            }
            else if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi7"] = "* Chúng tôi sẽ liên hệ với bạn";
            }
            else
            {
               try {
                    KH.HoTen = hoten;
                    KH.TaiKhoan = taikhoan;
                    KH.MatKhau = matkhau;                   
                    KH.Email = email;                    
                    KH.DiaChi_KH = diachi;
                    KH.DienThoai_KH = dienthoai;                                     
                    data.KhachHangs.InsertOnSubmit(KH);
                    data.SubmitChanges();
                    return RedirectToAction("DangNhap");
                }
                catch { ViewBag.ThongBao = "Vui lòng kiểm tra lại thông tin đăng kí !"; ViewBag.Trung = "Dữ liệu đã được người khác sử dụng !"; }


            }
            return this.DangKi();
        }
        public ActionResult DangNhap(FormCollection collection)
        {
            var taikhoan = collection["TaiKhoan"];
            var matkhau = collection["MatKhau"];
            if (String.IsNullOrEmpty(taikhoan))
            {
                ViewData["Loi1"] = "* Bắt buộc";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "* Bắt buộc";
            }
            else
            {
                KhachHang KH = data.KhachHangs.SingleOrDefault(n => n.TaiKhoan == taikhoan && n.MatKhau == matkhau);
                if (KH != null)
                {
                    Session["TaiKhoan"] = KH;
                    Session["HoTen"] = KH.HoTen;
                    Session["MaKH"] = KH.MaKH;
                    return RedirectToAction("GioHang", "GioHang");
                }
                else
                {
                    ViewBag.ThongBao = "Tài Khoản hoặc Mật khẩu không đúng";
                }
            }
            return View();
        }
        // đăng xuất
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index", "GuitarShop");
        }
        // tạo partipal view de hien thi lên màn hình chính
        public ActionResult NguoiDungPartial(FormCollection collection)
        {
            return PartialView();
        }
        public List<LichSuMuaHang> listLichSuMuaHang(int id)
        {
            var listLichSuMuaHang = from ddh in data.DonDatHangs
                                    from ctdh in data.ChiTietDonHangs
                                    from kh in data.KhachHangs
                                    from ctd in data.ChiTietDans
                                    where ddh.MaDonHang == ctdh.MaDonHang && kh.MaKH == ddh.MaKH && ctdh.MaDan == ctd.MaDan && kh.MaKH == id
                                    select new LichSuMuaHang()
                                    {
                                        NgayDat = ddh.NgayDat,
                                        NgayGiao = ddh.NgayGiao,
                                        TenDan = ctd.TenDan,
                                        SL_Mua = ctdh.SlMua,
                                        DonGia = ctdh.DonGia
                                    };
            return listLichSuMuaHang.OrderBy(a => a.NgayDat).ToList();
        }
        public ActionResult HienThiLichSuMuaHang(int id)
        {
            if (Session["HoTen"] == null || Session["HoTen"].ToString() == "")
            {
                return RedirectToAction("DangNhap", "NguoiDung");
            }
            var laylichsumuahang = listLichSuMuaHang(id);
            return View(laylichsumuahang);
        }
    }
}