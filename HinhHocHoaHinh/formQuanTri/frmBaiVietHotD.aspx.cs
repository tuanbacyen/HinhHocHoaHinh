using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HinhHocHoaHinh.Config;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmBaiVietHotD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    try
                    {
                        string sql = "DELETE FROM tbl_baiviethot WHERE id = " + Request.QueryString["id"];
                        if (Connection.ExcuteSQL(sql))
                            Response.Redirect("frmBaiVietHot.aspx");
                        else
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "thông báo", "alert('đã xảy ra lỗi!')", true);
                    }
                    catch
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "thông báo", "alert('đã xảy ra lỗi!')", true);
                    }
                }

            }
        }
    }
}