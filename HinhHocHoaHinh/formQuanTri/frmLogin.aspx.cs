using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using HinhHocHoaHinh.Config;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
            {
                try
                {
                    string query = "select * from tbl_taikhoan";
                    DataTable db = Connection.GetDataTable(query);
                    if (db.Rows.Count > 0)
                    {
                        Session["maTaiKhoan"] = txtUsername.Text;
                        Response.Redirect("frmHome.aspx");
                    }
                    else
                    {
                        labThongBao.Text = "Tên hoặc mật khẩu không đúng";
                        labThongBao.Visible = true;
                    }
                }
                catch
                {

                }
            }
        }
    }
}