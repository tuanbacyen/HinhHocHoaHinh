<%@ page title="" language="C#" masterpagefile="~/formQuanTri/frmMQT.Master" autoeventwireup="true" codebehind="frmHome.aspx.cs" inherits="HinhHocHoaHinh.formQuanTri.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    TRANG QUẢN TRỊ WEB.
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-user"></i>Tổng bài viết: </span>
                    <asp:label id="labCountBV" runat="server" text="NoN" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmDanhSachBaiViet.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-clock-o"></i>Tổng loại bài viết: </span>
                    <asp:label id="labCountLBV" runat="server" text="NoN" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmLoaiBaiViet.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 tile_stats_count">
                <div class="x_panel" style="background: #3A4A5B; border-radius: 10px;">
                    <span class="count_top" style="color: white"><i class="fa fa-user"></i>Tổng Số trang bài viết: </span>
                    <asp:label id="labCountTBV" runat="server" text="NoN" cssclass="count" forecolor="White"></asp:label>
                    <br />
                    <a href="frmTrangBaiViet.aspx" style="color: white"><span class="count_bottom"><i class="fa fa-search"></i>Chi Tiết</span></a>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </form>
</asp:content>
