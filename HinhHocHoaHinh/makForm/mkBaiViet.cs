using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HinhHocHoaHinh.Config;
using System.Data;

namespace HinhHocHoaHinh.makForm
{
    public class mkBaiViet
    {
        public string baiviet(string id)
        {
            DataTable dbBV = Connection.GetDataTable("select bv.ten, bv.tomtat, bv.noidung, bv.ngaydang from tbl_baiviet bv where id = '" + id + "'");
            if (dbBV.Rows.Count == 0)
            {
                return "Không có bài viết nào phù hợp";
            }
            else
            {
                return "<div class='art-layout-wrapper'>" +
                       "<div class='art-content-layout'>" +
                        "<div class='art-content-layout-row'>" +
                        "<div class='art-layout-cell art-content'>" +
                        "<article class='art-post art-article'>" +
                        "<h1 class='art-postheader'>" + dbBV.Rows[0][0].ToString() + "</h1>" +
                        "<i><p style='color:gray;font-size:80%;'>Viết ngày : " + dbBV.Rows[0][3].ToString() + "</p></i>" +
                        "<div class='art-postcontent art-postcontent-0 clearfix'>" +
                        "<p><strong>" + dbBV.Rows[0][1].ToString() + "</strong></p>" +
                        "" + dbBV.Rows[0][2].ToString() + "" +
                        "</div></article></div></div></div></div>";
            }
        }
    }
}