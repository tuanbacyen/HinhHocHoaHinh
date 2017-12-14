using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HinhHocHoaHinh.Config;
using System.Text;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmDanhSachBaiViet : System.Web.UI.Page
    {
        StringBuilder sbTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            DisplayOnTable();
            getTrang();
            if (drlTrang.SelectedValue != "" && drlLoai.SelectedItem == null)
                getLoai();

        }

        private void getTrang()
        {
            List<ListItem> items = new List<ListItem>();
            DataTable dbTrang = Connection.GetDataTable("select * from tbl_trang");
            items.Clear();
            items.Add(new ListItem("Chọn trang", ""));
            if (drlTrang.SelectedItem == null)
            {
                if (dbTrang.Rows.Count > 0)
                {
                    for (int i = 0; i < dbTrang.Rows.Count; i++)
                    {
                        drlTrang.Items.Clear();
                        items.Add(new ListItem(dbTrang.Rows[i][1].ToString(), dbTrang.Rows[i][0].ToString()));
                    }
                }
                drlTrang.Items.AddRange(items.ToArray());
            }
        }

        private void getLoai()
        {
            List<ListItem> items = new List<ListItem>();
            items.Clear();
            items.Add(new ListItem("Chọn Loại Bài Viết", ""));
            string sql = "";
            if (drlTrang.SelectedValue == "")
            {
                sql = "select * from tbl_loaibaiviet";
            }
            else
            {
                sql = "select * from tbl_loaibaiviet where id_trang = '" + drlTrang.SelectedValue + "'";
            }
            DataTable dbLoai = Connection.GetDataTable(sql);
            if (dbLoai.Rows.Count > 0)
            {
                for (int i = 0; i < dbLoai.Rows.Count; i++)
                {
                    items.Add(new ListItem(dbLoai.Rows[i][1].ToString(), dbLoai.Rows[i][0].ToString()));
                }
            }
            drlLoai.Items.Clear();
            drlLoai.Items.AddRange(items.ToArray());
        }

        private void DisplayOnTable()
        {
            string sql = "select b.id, b.ten, b.tomtat, b.imgthumb, b.ngaydang, l.tenloai, t.tentrang from tbl_baiviet b join tbl_loaibaiviet l on b.maloai = l.maloai join tbl_trang t on l.id_trang = t.id_trang ";
            if(drlLoai.SelectedValue != "")
            {
                sql = sql + " where l.maloai = '"+drlLoai.SelectedValue+"'";
            }else if(drlTrang.SelectedValue != "")
            {
                sql = sql + " where t.id_trang = '" + drlTrang.SelectedValue + "'";
            }
            DataTable dbbv = Connection.GetDataTable(sql);
            sbTable.Clear();
            tbl_BaiViet.Controls.Clear();
            sbTable.Append("<thead>" +
                "<tr class='headings'>" +
                "<th style='width: 120px; text-align: center;' class='column-title'>Tùy Chỉnh</th>" +
                "<th style='width: 60px; text-align: center' class='column-title'>ID</th>" +
                "<th class='column-title'>Tên bài viết</th>" +
                "<th class='column-title'>Tóm tắt bài viết</th>" +
                "<th class='column-title'>Ảnh tiêu đề</th>" +
                "<th class='column-title'>Ngày đăng</th>" +
                "<th class='column-title'>Loại bài viết</th>" +
                "<th class='column-title'>Trang bài viết</th></tr></thead>");
            sbTable.Append("<tbody>");
            //Không chọn bộ lọc

            if (dbbv.Rows.Count > 0)
            {
                for (int i = 0; i < dbbv.Rows.Count; i++)
                {
                    sbTable.Append("<tr>");
                    sbTable.Append("<td><a href='frmVietBai.aspx?id=" + dbbv.Rows[i][0].ToString() + "' class='btn btn-block btn-default'>Chi Tiết</a></td>");
                    sbTable.Append("<td style='text-align: center;'>" + dbbv.Rows[i][0].ToString() + "</td>");
                    sbTable.Append("<td>" + dbbv.Rows[i][1].ToString() + "</td>");
                    sbTable.Append("<td>" + dbbv.Rows[i][2].ToString() + "</td>");
                    sbTable.Append("<td><img alt='' width='100' height='100' style='float: left;' src='../" + dbbv.Rows[i][3].ToString() + "'/></td>");
                    sbTable.Append("<td>" + dbbv.Rows[i][4].ToString() + "</td>");
                    sbTable.Append("<td>" + dbbv.Rows[i][5].ToString() + "</td>");
                    sbTable.Append("<td>" + dbbv.Rows[i][6].ToString() + "</td>");
                    sbTable.Append("</tr>");
                }
            }
            sbTable.Append("</tbody>");
            tbl_BaiViet.Controls.Add(new Literal { Text = sbTable.ToString() });
        }

        protected void drlTrang_TextChanged(object sender, EventArgs e)
        {
            getLoai();
            DisplayOnTable();
        }

        protected void drlLoai_TextChanged(object sender, EventArgs e)
        {
            DisplayOnTable();
        }

        protected void btlReset_Click(object sender, EventArgs e)
        {
            drlTrang.SelectedValue = "";
            drlLoai.SelectedValue = "";
            drlLoai.Items.Clear();
            DisplayOnTable();
        }
    }
}