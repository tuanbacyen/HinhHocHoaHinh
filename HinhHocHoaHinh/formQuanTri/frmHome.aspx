<%@ page title="" language="C#" masterpagefile="~/formQuanTri/frmMQT.Master" autoeventwireup="true" codebehind="frmHome.aspx.cs" inherits="HinhHocHoaHinh.formQuanTri.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    TRANG QUẢN TRỊ WEB.
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-user"></i>Tổng Số Khoa: </span>
                    <asp:label id="labCountKhoa" runat="server" text="labCountKhoa" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmQuanLyKhoa.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-clock-o"></i>Tổng Số Ngành: </span>
                    <asp:label id="labCountNganh" runat="server" text="labCountNganh" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmQuanLyNganh.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-user"></i>Tổng Số Lớp: </span>
                    <asp:label id="labCountLop" runat="server" text="labCoutLop" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmQuanLyLop.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </form>
</asp:content>
