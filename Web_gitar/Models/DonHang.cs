using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuitarShop.Models
{
    public class DonHang
    {
        public int MaDonHang { get; set; }
        public string TenDan { get; set; }
        public string Ten_KH { get; set; }
        public string Email_KH { get; set; }
        public string DiaChi_KH { get; set; }
        public string DienThoai_KH { get; set; }
        public int? SL_Mua { get; set; }
        public DateTime? NgayDat { get; set; }
        public DateTime? NgayGiao { get; set; }
    }
}