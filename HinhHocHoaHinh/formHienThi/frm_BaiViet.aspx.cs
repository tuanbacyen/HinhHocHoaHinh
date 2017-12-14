using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HinhHocHoaHinh.makForm;

namespace HinhHocHoaHinh.formHienThi
{
    public partial class frm_BaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            mkBaiViet bv = new mkBaiViet();
            StringBuilder sbTable = new StringBuilder();
            sbTable.Clear();
            if(id == "" || id == null)
            {
                sbTable.Append("Không có bài viết nào phù hợp");
            }
            else
            {
                sbTable.Append(bv.baiviet(id));
            }
            baiViet.Controls.Add(new Literal { Text = sbTable.ToString() });
        }
    }
}