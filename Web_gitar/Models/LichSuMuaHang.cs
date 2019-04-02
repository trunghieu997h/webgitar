using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GuitarShop.Models
{
    public class LichSuMuaHang
    {
        public DateTime? NgayDat { get; set; }
        public DateTime? NgayGiao { get; set; }
        public string TenDan { get; set; }
        public int? SL_Mua { get; set; }
        public decimal? DonGia { get; set; }
    }
}