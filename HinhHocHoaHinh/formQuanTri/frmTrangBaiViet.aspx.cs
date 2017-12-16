using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HinhHocHoaHinh.Config;
using System.Data;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmTrangBaiViet : System.Web.UI.Page
    {
        StringBuilder sbTable = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            DisplayOnTable();
        }
        private void DisplayOnTable()
        {
            string sql = "select * from tbl_trang";
            DataTable dbt = Connection.GetDataTable(sql);
            sbTable.Clear();
            sbTable.Append("<thead>" +
                "<tr class='headings'>" +
                "<th style='width: 120px; text-align: center;' class='column-title'>Tùy Chỉnh</th>" +
                "<th style='width: 60px; text-align: center' class='column-title'>ID</th>" +
                "<th style='text-align: center;' class='column-title'>Tên Trang</th></tr></thead>");
            sbTable.Append("<tbody>");
            if (dbt.Rows.Count > 0)
            {
                for (int i = 0; i < dbt.Rows.Count; i++)
                {
                    sbTable.Append("<tr>");
                    sbTable.Append("<td><a href='frmTrangBaiVietCUD.aspx?id=" + dbt.Rows[i][0].ToString() + "' class='btn btn-block btn-default'>Chi Tiết</a></td>");
                    sbTable.Append("<td style='text-align: center'>" + dbt.Rows[i][0].ToString() + "</td>");
                    sbTable.Append("<td>" + dbt.Rows[i][1].ToString() + "</td>");
                    sbTable.Append("</td>");
                    sbTable.Append("</tr>");
                }
            }
            sbTable.Append("</tbody>");
            tblTrang.Controls.Add(new Literal { Text = sbTable.ToString() });
        }
    }
}