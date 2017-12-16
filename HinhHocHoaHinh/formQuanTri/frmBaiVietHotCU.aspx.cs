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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                DisplayOnTable();
                getLoaiHienThi();
                getTrang();
                if (drlTrang.SelectedValue != "" && drlLoai.SelectedItem == null)
                    getLoai();
            }
        }

        private void DisplayOnTable()
        {
            string sql = "select b.id, b.ten from tbl_baiviet b FULL OUTER JOIN tbl_baiviethot h on b.id = h.id_baiviet join tbl_loaibaiviet l on b.maloai = l.maloai join tbl_trang t on l.id_trang = t.id_trang ";
            if (Request.QueryString["id"] == null)
            {
                sql = sql + " where h.id is null ";
            }
            else
            {
                sql = sql + " where h.id is null or b.id = " + Request.QueryString["id"];
            }

            if (drlLoai.SelectedValue != "")
            {
                sql = sql + " and l.maloai = '" + drlLoai.SelectedValue + "'";
            }
            else if (drlTrang.SelectedValue != "")
            {
                sql = sql + " and t.id_trang = '" + drlTrang.SelectedValue + "'";
            }

            sql = sql + " order by b.id desc";

            DataTable db = Connection.GetDataTable(sql);
            try
            {
                GridView1.DataSource = db;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            if (Request.QueryString["id"] != null)
            {
                SetSelectedRecord();
            }
        }

        private string GetSelectedRecord()
        {
            string id = "";
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                RadioButton rb = (RadioButton)GridView1.Rows[i]
                        .Cells[0].FindControl("RadioButton1");
                if (rb != null)
                {
                    if (rb.Checked)
                    {
                        HiddenField hf = (HiddenField)GridView1.Rows[i].Cells[0].FindControl("HiddenField1");
                        if (hf != null)
                        {
                            id = hf.Value;
                        }

                        break;
                    }
                }
            }
            return id;
        }

        private void SetSelectedRecord()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                RadioButton rb = (RadioButton)GridView1.Rows[i].Cells[0].FindControl("RadioButton1");
                if (rb != null)
                {
                    HiddenField hf = (HiddenField)GridView1.Rows[i].Cells[0].FindControl("HiddenField1");
                    if (hf != null && Request.QueryString["id"] != null)
                    {
                        if (hf.Value.Equals(Request.QueryString["id"].ToString()))
                        {
                            rb.Checked = true;
                            break;
                        }
                    }
                }
            }
        }

        private void getLoaiHienThi()
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
                if (Request.QueryString["id"] != null)
                {
                    string sqlA = "select announcements from tbl_baiviethot where id_baiviet = " + Request.QueryString["id"];
                    int ann = Connection.AExcuteSQL(sqlA);
                    drl.SelectedValue = ann.ToString();
                }
            }
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

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string sql = "";
            string drAn = drl.SelectedValue;
            if (drl.SelectedValue == "")
            {
                drAn = "1";
            }
            if (GetSelectedRecord() == "")
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Chưa chọn bài viết')", true);
            }
            else
            {
                if (Request.QueryString["id"] == null)
                {
                    sql = "insert into tbl_baiviethot values('" + GetSelectedRecord() + "','" + drAn + "','" + DateTime.Now.ToString() + "')";
                }
                else
                {
                    string sqlA = "select id from tbl_baiviethot where id_baiviet = " + Request.QueryString["id"];
                    int ann = Connection.AExcuteSQL(sqlA);
                    sql = "update tbl_baiviethot set id_baiviet = '" + GetSelectedRecord() + "', announcements = '" + drAn + "', inup = '" + DateTime.Now.ToString() + "' where id = " + ann;
                }

                if (Connection.ExcuteSQL(sql))
                {
                    string sqlcount = "select count(*) from tbl_baiviethot";
                    int count = Connection.AExcuteSQL(sqlcount);
                    if (count > 10)
                    {
                        string d = "delete from tbl_baiviethot where id = (select top 1 id from tbl_baiviethot order by inup asc)";
                        Connection.ExcuteSQL(d);
                    }
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Thành công!')", true);
                    Response.Redirect("frmBaiVietHot.aspx");
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Thông Báo", "alert('Đã xảy ra lỗi!')", true);
                }
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            drlTrang.SelectedValue = "";
            drlLoai.SelectedValue = "";
            drlLoai.Items.Clear();
            DisplayOnTable();
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
    }
}