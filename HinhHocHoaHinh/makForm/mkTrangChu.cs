using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using HinhHocHoaHinh.Config;
using System.Data;

namespace HinhHocHoaHinh.makForm
{
    public class mkTrangChu
    {
        private string head = "<div class='art-layout-wrapper'><div class='art-content-layout'><div class='art-content-layout-row'><div class='art-layout-cell art-content'><article class='art-post art-article'><div class='art-postcontent art-postcontent-0 clearfix'><div class='art-content-layout'><div class='art-content-layout-row'><div class='art-layout-cell layout-item-0' style='width: 100%'><h3>Striving For Excellence</h3></div></div></div>";
        private string foodter = "</ul></div></div></div></div></article></div></div></div></div>";
        private string headAnnouncements = "<div class='art-content-layout'><div class='art-content-layout-row'><div class='art-layout-cell layout-item-0' style='width: 50%'><h3>Announcements</h3><ul>";
        private string headAssignments = "</ul></div><div class='art-layout-cell layout-item-0' style='width: 50%'><h3>Assignments</h3><ul>";

        public string trangchu()
        {
            DataTable dbHots = Connection.GetDataTable("select h.announcements, b.ten, b.tomtat ,b.imgthumb,b.id from tbl_baiviethot h join tbl_baiviet b on h.id_baiviet = b.id order by h.id_baiviet desc");
            string Announcements = "";
            string Assignments = "";
            string dvHead = "";
            for (int i = 0; i < dbHots.Rows.Count; i++)
            {
                if (i == 0)
                {
                    dvHead = baivietchinh(dbHots.Rows[i][1].ToString(), dbHots.Rows[i][2].ToString(), dbHots.Rows[i][3].ToString(), dbHots.Rows[i][4].ToString());
                }
                else
                {
                    if (dbHots.Rows[i][0].ToString() == "1")
                    {
                        Announcements += baiviet(dbHots.Rows[i][1].ToString(), dbHots.Rows[i][2].ToString(), dbHots.Rows[i][3].ToString(), dbHots.Rows[i][4].ToString());
                    }
                    else
                    {
                        Assignments += baiviet(dbHots.Rows[i][1].ToString(), dbHots.Rows[i][2].ToString(), dbHots.Rows[i][3].ToString(), dbHots.Rows[i][4].ToString());
                    }
                }
            }
            return head + dvHead + headAnnouncements + Announcements + headAssignments + Assignments + foodter;
        }
        private string baivietchinh(string title, string description, string thumb, string id)
        {
            thumb = thumb.Trim();
            if (thumb == "" || thumb == null || thumb.Equals(""))
            {
                thumb = "../images/imgthumb.jpg";
            }
            return "<div class='art-content-layout'>" +
                "<div class='art-content-layout-row'>" +
                "<div class='art-layout-cell layout-item-0' style='width: 50%'><br>" +
                "<a href='frm_BaiViet.aspx?id=" + id + "'>" +
                "<img alt='' width='350' height='233' src='../" + thumb + "' style='float: left;' class=''></a>" +
                "</div>" +
                "<div class='art-layout-cell layout-item-0' style='width: 50%'>" +
                "<p>" +
                "<a href='frm_BaiViet.aspx?id=" + id + "'>" +
                "<span style='font-weight: bold;'>" + title + "</span></a><br/>" + description + "</p>" +
                "</div></div></div>";
        }
        private string baiviet(string title, string description, string thumb, string id)
        {
            thumb = thumb.Trim();
            if (thumb == "" || thumb == null || thumb.Equals(""))
            {
                return "<li><span style='color: rgb(53, 52, 19);'>" +
                "<a href='frm_BaiViet.aspx?id=" + id + "'><span style='font-weight: bold;'>" + title + "</span></a>" +
                "<br>" + description + "<br><br>" +
                "</span></li>";
            }
            else
            {
                return "<li><div class='art-content-layout'>" +
                "<div class='art-content-layout-row'>" +
                "<div class='art-layout-cell layout-item-0' style='width: 30%'>" +
                "<br><a href='frm_BaiViet.aspx?id=" + id + "'>" +
                "<img alt='' width='80' height='80' src='../" + thumb + "' style='float: left;' class=''>" +
                "</a></div><div class='art-layout-cell layout-item-0' style='width: 70%'>" +
                "<p><span style='color: rgb(53, 52, 19);'>" +
                "<a href='frm_BaiViet.aspx?id=" + id + "'><span style='font-weight: bold;'>" + title + "</span></a><br>" + description + "<br><br></span>" +
                "</div></div></div></li>";
            }

        }
    }
}