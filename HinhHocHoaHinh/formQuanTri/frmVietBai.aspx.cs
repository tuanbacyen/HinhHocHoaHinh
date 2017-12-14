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
    public partial class frmVietBai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                getLoai();
                if (Request.QueryString["id"] != null)
                {
                    TuyChon();
                }
            }
        }

        private void TuyChon()
        {
            string sqlGet = "select * from tbl_baiviet where id = '" + Request.QueryString["id"] + "'";
            DataTable dbGet = Connection.GetDataTable(sqlGet);
            txtTieuDe.Text = dbGet.Rows[0][1].ToString();
            txtTomTat.Text = dbGet.Rows[0][2].ToString();
            txtNoiDung.Text = dbGet.Rows[0][4].ToString();
            drlLoai.SelectedValue = dbGet.Rows[0][6].ToString();
            btnXoa.Enabled = true;
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string noidung = txtNoiDung.Text;
            string imgThumb = "";
            if (noidung.Contains("img"))
            {
                int f = noidung.IndexOf("img");
                string temp = noidung.Substring(f, noidung.Length - f - 1);

                int fc = temp.IndexOf("src") + 5;
                temp = temp.Substring(fc, temp.Length - fc - 1);
                int end = temp.IndexOf("\"");

                imgThumb = temp.Substring(0, end);
            }

            string loai = "1";
            if (drlLoai.SelectedValue != "")
            {
                loai = drlLoai.SelectedValue;
            }

            Boolean b = noidung.Contains("img");
            string sql = "";
            if (Request.QueryString["id"] != null)
            {
                sql = "UPDATE tbl_baiviet SET ten = N'" + txtTieuDe.Text + "', tomtat = N'" + txtTomTat.Text + "', imgthumb = '" + imgThumb + "', noidung = N'" + noidung + "', maloai = '" + loai + "' WHERE id = '" + Request.QueryString["id"] + "'";
            }
            else
            {
                sql = "INSERT INTO tbl_baiviet (ten , tomtat , imgthumb , noidung , ngaydang , maloai ) VALUES (N'" + txtTieuDe.Text + "',N'" + txtTomTat.Text + "','" + imgThumb + "',N'" + noidung + "','" + DateTime.Now.ToString() + "','" + loai + "')";
            }

            if (Connection.ExcuteSQL(sql))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Thêm thành công!')", true);
                Response.Redirect("frmDanhSachBaiViet.aspx");
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

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Xóa thành công!')", true);
                Response.Redirect("frmDanhSachBaiViet.aspx");

            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Đã xảy ra lỗi!')", true);
            }
        }
        private void getLoai()
        {
            List<ListItem> items = new List<ListItem>();
            items.Clear();
            items.Add(new ListItem("Chọn Loại Bài Viết", ""));
            string sql = "select * from tbl_loaibaiviet";
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
    }
}