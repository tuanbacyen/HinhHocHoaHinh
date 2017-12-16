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
    public partial class frmTrangBaiVietCUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                txtTen.Focus();
                if (Request.QueryString["id"] != null)
                {
                    TuyChinh();
                }
            }
        }

        private void TuyChinh()
        {
            string sql = "select * from tbl_trang where id_trang = " + Request.QueryString["id"];
            DataTable db = Connection.GetDataTable(sql);
            if (db.Rows.Count == 1)
            {
                txtTen.Text = db.Rows[0][1].ToString();
                btnXoa.Enabled = true;
            }


        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string sql = "";
            if (Request.QueryString["id"] == null)
                sql = "insert into tbl_trang values(N'" + txtTen.Text + "')";
            else
                sql = "update tbl_trang set tentrang = N'" + txtTen.Text + "' where id_trang = '" + Request.QueryString["id"] + "'";

            if (Connection.ExcuteSQL(sql))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Thành công!')", true);
                Response.Redirect("frmTrangBaiViet.aspx");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Đã xảy ra lỗi!')", true);
            }
        }
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "delete from tbl_trang where id_trang = " + Request.QueryString["id"];
                Connection.ExcuteSQL(sql);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Xóa thành công!')", true);
                Response.Redirect("frmTrangBaiViet.aspx");
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Đã xảy ra lỗi!')", true);
            }
        }
    }
}