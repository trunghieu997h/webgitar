using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using GuitarShop.Models;

namespace GuitarShop.Models
{
    public class GioHang
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        public int iMaDan { set; get; }
        public String sTenDan { set; get; }
        public String sAnhBia { set; get; }
        public decimal dGiaBan { set; get; }
        public int iSlMua { set; get; }
        public decimal dThanhTien
        {
            get { return iSlMua * dGiaBan; }
        }
        // khỏi tạo giỏ hàng theo MAsach được truyền vào với sl mặc định là 1
        public GioHang(int MaDan)
        {
            iMaDan = MaDan;
            ChiTietDan dan = data.ChiTietDans.Single(n => n.MaDan == iMaDan);
            sTenDan = dan.TenDan;
            sAnhBia = dan.AnhBia;
            dGiaBan = decimal.Parse(dan.GiaBan.ToString());
            iSlMua = 1;
        }
    }
}