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
    public partial class frmLoaiBaiViet : System.Web.UI.Page
    {
        StringBuilder sbTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            //if (!IsPostBack)
            //{
            DisplayOnTable("");
            getTrang();
            //}
        }

        private void DisplayOnTable(String key)
        {
            string sql = "select l.maloai, l.tenloai, t.tentrang from tbl_loaibaiviet l join tbl_trang t on l.id_trang = t.id_trang ";
            if (drlTrang.SelectedValue != "")
                sql = sql + "where t.id_trang = '" + drlTrang.SelectedValue + "'";
            sql = sql + " order by maloai desc";
            DataTable db = Connection.GetDataTable(sql);

            sbTable.Clear();
            tblLoai.Controls.Clear();
            sbTable.Append("<thead>" +
                            "<tr class='headings'>" +
                            "<th style='width: 120px; text-align: center;' class='column-title'>Tùy Chỉnh</th>" +
                            "<th style='width: 60px; text-align: center' class='column-title'>ID</th>" +
                            "<th class='column-title'>Tên loạn bài viết</th>" +
                            "<th class='column-title'>Trang</th></tr></thead>");
            sbTable.Append("<tbody>");

            if (db.Rows.Count > 0)
            {
                for (int i = 0; i < db.Rows.Count; i++)
                {
                    sbTable.Append("<tr>");
                    sbTable.Append("<td><a href='frmLoaiBaiVietCUD.aspx?id=" + db.Rows[i][0].ToString() + "' class='btn btn-block btn-default'>Chi Tiết</a></td>");
                    sbTable.Append("<td style='text-align: center;'>" + db.Rows[i][0].ToString() + "</td>");
                    sbTable.Append("<td>" + db.Rows[i][1].ToString() + "</td>");
                    sbTable.Append("<td>" + db.Rows[i][2].ToString() + "</td>");
                    sbTable.Append("</tr>");
                }
            }
            sbTable.Append("</tbody>");
            tblLoai.Controls.Add(new Literal { Text = sbTable.ToString() });
        }

        private void getTrang()
        {
            if (drlTrang.SelectedItem == null)
            {
                string sql = "select * from tbl_trang";
                DataTable db = Connection.GetDataTable(sql);

                if (db.Rows.Count > 0)
                {
                    List<ListItem> items = new List<ListItem>();
                    drlTrang.Items.Clear();
                    items.Add(new ListItem("Chọn khoa", ""));
                    for (int i = 0; i < db.Rows.Count; i++)
                    {
                        items.Add(new ListItem(db.Rows[i][1].ToString(), db.Rows[i][0].ToString()));
                    }
                    drlTrang.Items.AddRange(items.ToArray());
                }
            }
        }
        protected void drlTrang_TextChanged(object sender, EventArgs e)
        {
            DisplayOnTable(drlTrang.SelectedValue);
        }
        protected void btnReset_Click(Object sender, EventArgs e)
        {
            drlTrang.SelectedValue = "";
            DisplayOnTable("");
        }
    }
}