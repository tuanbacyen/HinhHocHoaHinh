﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HinhHocHoaHinh.formQuanTri
{
    public partial class frmHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maTaiKhoan"] == null)
                Response.Redirect("frmLogin.aspx");
        }
    }
}