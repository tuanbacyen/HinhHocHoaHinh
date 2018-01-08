using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HinhHocHoaHinh.formHienThi
{
    public partial class frm_Forum : System.Web.UI.Page
    {
        String baiviet;
        protected void Page_Load(object sender, EventArgs e)
        {
            baiviet = txtBaiViet.Text;
            lblBaiViet.Text = baiviet;
           
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnVietBai_Click(object sender, EventArgs e)
        {
             baiviet = txtBaiViet.Text;
            lblBaiViet.Text = baiviet;
            txtBaiViet.Text = "";
        }
    }
}