using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HinhHocHoaHinh.makForm;
using System.Data;
using HinhHocHoaHinh.Config;
using System.Text;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmBaiVietHot : System.Web.UI.Page
    {
        StringBuilder sbTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                DisplayOnTable("");
                getLoai();
            }
        }
        private void DisplayOnTable(String key)
        {
            string sql = "select b.id, b.ten, h.announcements, h.id from tbl_baiviethot h join tbl_baiviet b on h.id_baiviet = b.id ";
            if (drl.SelectedValue != "")
                sql = sql + " where h.announcements = '" + drl.SelectedValue + "'";
            sql = sql + " order by h.inup desc";

            DataTable db = Connection.GetDataTable(sql);

            sbTable.Clear();
            tblBVH.Controls.Clear();
            sbTable.Append("<thead>" +
                            "<tr class='headings'>" +
                            "<th style='width: 120px; text-align: center;' class='column-title'>Đổi Loại</th>" +
                            "<th style='width: 120px; text-align: center' class='column-title'>Xóa</th>" +
                            "<th class='column-title'>Tên bài viết</th>" +
                            "<th class='column-title'>Loại hiển thị</th></tr></thead>");
            sbTable.Append("<tbody>");

            if (db.Rows.Count > 0)
            {
                for (int i = 0; i < db.Rows.Count; i++)
                {
                    sbTable.Append("<tr>");
                    sbTable.Append("<td><a href='frmBaiVietHotCU.aspx?id=" + db.Rows[i][0].ToString() + "' class='btn btn-block btn-default'>Đổi Loại</a></td>");
                    sbTable.Append("<td><a href='frmBaiVietHotD.aspx?id=" + db.Rows[i][3].ToString() + "' class='btn btn-block btn-default'>Xóa</a></td>");
                    sbTable.Append("<td>" + db.Rows[i][1].ToString() + "</td>");
                    sbTable.Append("<td>" + LoaiBaiVietHot.loaiBVH[int.Parse(db.Rows[i][2].ToString()) - 1] + "</td>");
                    sbTable.Append("</tr>");
                }
            }
            sbTable.Append("</tbody>");
            tblBVH.Controls.Add(new Literal { Text = sbTable.ToString() });
        }

        private void getLoai()
        {
            if (drl.SelectedItem == null)
            {
                List<ListItem> items = new List<ListItem>();
                drl.Items.Clear();
                items.Add(new ListItem("Chọn Loại Hiển Thị", ""));
                for (int i = 0; i < LoaiBaiVietHot.loaiBVH.Count(); i++)
                {
                    items.Add(new ListItem(LoaiBaiVietHot.loaiBVH[i], (i + 1).ToString()));
                }
                drl.Items.AddRange(items.ToArray());

            }
        }
        protected void drl_TextChanged(object sender, EventArgs e)
        {
            DisplayOnTable(drl.SelectedValue);
        }
        protected void btnReset_Click(Object sender, EventArgs e)
        {
            drl.SelectedValue = "";
            DisplayOnTable("");
        }
    }
}