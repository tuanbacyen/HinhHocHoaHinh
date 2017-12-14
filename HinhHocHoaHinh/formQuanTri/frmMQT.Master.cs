using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmMQT : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labMaTaiKhoan.Text = Session["maTaiKhoan"].ToString().Trim();
            labNameTop.Text = Session["maTaiKhoan"].ToString().Trim();
        }
    }
}