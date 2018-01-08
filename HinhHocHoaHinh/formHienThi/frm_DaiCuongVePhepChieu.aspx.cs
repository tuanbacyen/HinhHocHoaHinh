using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using HinhHocHoaHinh.Config;

namespace HinhHocHoaHinh
{
    public partial class frm_DaiCuongVePhepChieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String ma = Request.QueryString.Get("ma");
            if (ma == null || ma == "")
            {
                String sql = "select top 1 noidung from tbl_baiviet where maloai='4'";
                DataTable dt = Connection.GetDataTable(sql);
                if (dt.Rows.Count > 0)
                {
                    this.txtND.Text = dt.Rows[0]["noidung"].ToString();
                    String sql1 = "select id,tomtat from tbl_baiviet where maloai='4'";
                    DataTable data = Connection.GetDataTable(sql1);
                    GridView1.DataSource = data;
                    GridView1.DataBind();
                }
            }
            else
            {
                String sql = "select top 1 noidung from tbl_baiviet where id='" + ma + "'";
                DataTable dt = Connection.GetDataTable(sql);
                if (dt.Rows.Count > 0)
                {
                    this.txtND.Text = dt.Rows[0]["noidung"].ToString();
                    String sql1 = "select id,tomtat from tbl_baiviet where maloai='4'";
                    DataTable data = Connection.GetDataTable(sql1);
                    GridView1.DataSource = data;
                    GridView1.DataBind();
                }

            }
        }

        protected void txtND_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
        {

        }
    }
}