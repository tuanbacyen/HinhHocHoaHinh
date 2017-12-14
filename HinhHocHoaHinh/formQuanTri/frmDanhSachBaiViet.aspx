<%@ Page Title="" Language="C#" MasterPageFile="~/formQuanTri/frmMQT.Master" AutoEventWireup="true" CodeBehind="frmDanhSachBaiViet.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmDanhSachBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    DANH SÁCH BÀI VIẾT
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form runat="server">
            <div class="row">
                <div class="col-md-3" style="float: right">
                    <div class="x_panel">
                        <div class="x_title">
                            <h4 style="float: left;"><i class="fa fa-search fa-fw">&nbsp;</i>Hiển Thị</h4>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <hr />
                            <asp:DropDownList ID="drlTrang" runat="server" CssClass="form-control input-group" AutoPostBack="True" OnTextChanged="drlTrang_TextChanged"></asp:DropDownList>
                            <hr />
                            <asp:DropDownList ID="drlLoai" runat="server" CssClass="form-control input-group" AutoPostBack="True" OnTextChanged="drlLoai_TextChanged"></asp:DropDownList>
                            <hr />
                            <asp:Button ID="btlReset" runat="server" Text="Tạo Lại" CssClass="form-control btn-default" OnClick="btlReset_Click"/>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12 col-xs-12" style="float: left;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2 style="float: left;">Danh Sách Bài Viết</h2>
                            <div style="float: right; width: 100px;">
                                <asp:Button ID="btnThem" runat="server" Text="Thêm Mới" CssClass="form-control btn btn-default" PostBackUrl="~/formQuanTri/frmVietBai.aspx" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                                <table id="example" class="table table-striped jambo_table table-bordered" style="width: 2000px;">
                                    <asp:PlaceHolder ID="tbl_BaiViet" runat="server"></asp:PlaceHolder>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
