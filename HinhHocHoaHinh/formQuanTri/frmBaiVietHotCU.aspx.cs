using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HinhHocHoaHinh.Config;
using System.Text;
using HinhHocHoaHinh.makForm;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmBaiVietHotCU : System.Web.UI.Page
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
            string sql = "select b.id, b.ten from tbl_baiviet b order by b.id desc";
            DataTable db = Connection.GetDataTable(sql);

            sbTable.Clear();
            tbl.Controls.Clear();
            sbTable.Append("<thead>" +
                            "<tr class='headings'>" +
                            "<th style='width: 120px; text-align: center;' class='column-title'>Chọn</th>" +
                            "<th class='column-title'>Tên bài viết</th></tr></thead>");
            sbTable.Append("<tbody>");

            if (db.Rows.Count > 0)
            {
                for (int i = 0; i < db.Rows.Count; i++)
                {
                    sbTable.Append("<tr>");
                    sbTable.Append("<td><asp:RadioButton runat='server' ID='_" + db.Rows[i][0] + "' GroupName='chon'>" + db.Rows[i][0] + "</asp:RadioButton></td>");
                    sbTable.Append("<td>" + db.Rows[i][1].ToString() + "</td>");
                    sbTable.Append("</tr>");
                }
            }
            sbTable.Append("</tbody>");
            tbl.Controls.Add(new Literal { Text = sbTable.ToString() });
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
        }
    }
}