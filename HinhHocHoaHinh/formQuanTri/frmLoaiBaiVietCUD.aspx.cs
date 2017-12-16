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
    public partial class frmLoaiBaiVietCUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                txtLoai.Focus();
                getTrang();
                if (Request.QueryString["id"] != null && txtLoai.Text == "")
                {
                    TuyChon();
                }
            }
        }
        private void TuyChon()
        {
            string sql = "select * from tbl_loaibaiviet where maloai = " + Request.QueryString["id"];
            DataTable db = Connection.GetDataTable(sql);
            if (db.Rows.Count == 1)
            {
                txtLoai.Text = db.Rows[0][1].ToString();
                drlTrang.SelectedValue = db.Rows[0][2].ToString();
                btnXoa.Enabled = true;
            }
        }
        private void getTrang()
        {
            if (drlTrang.SelectedItem == null)
            {
                List<ListItem> items = new List<ListItem>();
                string sql = "select * from tbl_trang";
                DataTable db = Connection.GetDataTable(sql);

                if (db.Rows.Count > 0)
                {
                    drlTrang.Items.Clear();
                    for (int i = 0; i < db.Rows.Count; i++)
                    {
                        items.Add(new ListItem(db.Rows[i][1].ToString(), db.Rows[i][0].ToString()));
                    }
                    drlTrang.Items.AddRange(items.ToArray());
                }
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            if (drlTrang.SelectedValue == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Chưa chọn Trang')", true);
            }
            else
            {
                string sql = "";
                if (Request.QueryString["id"] == null)
                    sql = "insert into tbl_loaibaiviet values(N'" + txtLoai.Text + "','" + drlTrang.SelectedValue + "')";
                else
                    sql = "update tbl_loaibaiviet set tenloai = N'" + txtLoai.Text + "', id_trang = '" + drlTrang.SelectedValue + "' where maloai = " + Request.QueryString["id"];

                if (Connection.ExcuteSQL(sql))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Thành công!')", true);
                    Response.Redirect("frmLoaiBaiViet.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Đã xảy ra lỗi!')", true);
                }
            }
        }
        protected void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "DELETE FROM tbl_loaibaiviet where maloai = " + Request.QueryString["id"];
                Connection.ExcuteSQL(sql);
                Response.Redirect("frmLoaiBaiViet.aspx");

            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "thông báo", "alert('đã xảy ra lỗi!')", true);
            }
        }
    }
}