using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GuitarShop.Models;
using PagedList;
using PagedList.Mvc;
namespace GuitarShop.Controllers
{
    public class GuitarShopController : Controller
    {
        // GET: GuitarShop
        // tạo 1 đối tượng chứa toàn bộ đàn
        DataClasses1DataContext data = new DataClasses1DataContext();
        private List<ChiTietDan> Laydanmoi(int count)
        {
            // sắp xếp giảm dần theo ngày cập nhật, lấy count dòng đầu
            return data.ChiTietDans.OrderByDescending(a => a.NgayCapNhat).Take(count).ToList();
        }
        public int DemSanPham()
        {
            int countDan = 0;                                    
            countDan = data.ChiTietDans.Count();            
            return countDan;
        }
        public ActionResult countDanPartial()
        {
            ViewBag.countDan = DemSanPham();           
            return PartialView();
        }
        public ActionResult Index(int? page)
        {
            // tạo bien quy dinh so san phẩm trên 1 trang
            int pageSize = 9;
            // tạo biến số trang
            int pageNum = (page ?? 1);
            // lấy  top  6 bán chạy nhất
            var danmoi = Laydanmoi(100);
            return View(danmoi.ToPagedList(pageNum, pageSize));           
        }
        public ActionResult TheLoaiDan()
        {
            var theloaidan = from theloai in data.TheLoaiDans select theloai;
            return PartialView(theloaidan);
        }
        public ActionResult ThuongHieu()
        {
            var thuonghieudan = from thuonghieu in data.ThuongHieuDans select thuonghieu;
            return PartialView(thuonghieudan);
        }
        public ActionResult SP_TheoTheLoai(int id,int ?page)
        {            
            int pageSize = 9;           
            int pageNum = (page ?? 1);
            // lấy  top  6 bán chạy nhất
            var theloai = from s in data.ChiTietDans where s.MaTheLoai == id select s;
            return View(theloai.ToPagedList(pageNum, pageSize));                       
        }
        public int DemTheLoai(int id)
        {
            var theloai = from s in data.ChiTietDans where s.MaTheLoai == id select s;
            int countTheLoai = 0;
            countTheLoai = theloai.Count();
            return countTheLoai;
        }
        public ActionResult countTheLoaiPartial(int id)
        {
            ViewBag.countTheLoai = DemTheLoai(id);
            return PartialView();
        }
        public ActionResult SP_TheoThuongHieu(int id, int? page)
        {
            int pageSize = 9;
            int pageNum = (page ?? 1);
            var thuonghieu = from s in data.ChiTietDans where s.MaThuongHieu == id select s;
            return View(thuonghieu.ToPagedList(pageNum, pageSize));
        }
        public int DemThuongHieu(int id)
        {
            var thuonghieu = from s in data.ChiTietDans where s.MaThuongHieu == id select s;
            int countThuongHieu = 0;
            countThuongHieu = thuonghieu.Count();
            return countThuongHieu;
        }
        public ActionResult countThuongHieuPartial(int id)
        {
            ViewBag.countThuongHieu = DemThuongHieu(id);
            return PartialView();
        }
        public ActionResult ChiTietDan(int id)
        {
            var chitiet = from l in data.ChiTietDans where l.MaDan == id select l;
            return View(chitiet.Single());
        }
        public ActionResult LienHe()
        {            
            return View();
        }
        private List<ChiTietDan> Gia_Cao_Thap(int count)
        {
            // sắp xếp giảm dần theo ngày cập nhật, lấy count dòng đầu
            return data.ChiTietDans.OrderByDescending(a => a.GiaBan).Take(count).ToList();
        }
        public ActionResult Index_Gia_Cao_Thap(int? page)
        {
            // tạo bien quy dinh so san phẩm trên 1 trang
            int pageSize = 9;
            // tạo biến số trang
            int pageNum = (page ?? 1);
            // lấy  top  6 bán chạy nhất
            var giacaothap = Gia_Cao_Thap(100);
            return View(giacaothap.ToPagedList(pageNum, pageSize));            
        }
        private List<ChiTietDan> Gia_Thap_Cao(int count)
        {
            // sắp xếp giảm dần theo ngày cập nhật, lấy count dòng đầu
            return data.ChiTietDans.OrderBy(a => a.GiaBan).Take(count).ToList();
        }
        public ActionResult Index_Gia_Thap_Cao(int? page)
        {
            // tạo bien quy dinh so san phẩm trên 1 trang
            int pageSize = 9;
            // tạo biến số trang
            int pageNum = (page ?? 1);
            // lấy  top  6 bán chạy nhất
            var giathapcao = Gia_Thap_Cao(100);
            return View(giathapcao.ToPagedList(pageNum, pageSize));            
        }
        public ActionResult TinTuc()
        {
            return View();
        }
       
    }
}