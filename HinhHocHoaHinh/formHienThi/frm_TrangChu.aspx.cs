using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HinhHocHoaHinh.makForm;

namespace HinhHocHoaHinh
{
    public partial class frm_TrangChu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mkTrangChu tc = new mkTrangChu();
            StringBuilder sbTable = new StringBuilder();
            sbTable.Clear();
            sbTable.Append(tc.trangchu());
            test.Controls.Add(new Literal { Text = sbTable.ToString() });
        }
    }
}