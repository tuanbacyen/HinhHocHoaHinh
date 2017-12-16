<%@ Page Title="" Language="C#" MasterPageFile="~/formQuanTri/frmMQT.Master" AutoEventWireup="true" CodeBehind="frmTrangBaiViet.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmTrangBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    QUẢN LÝ TRANG BÀI VIẾT
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form runat="server">
            <div class="row">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="float: left;">Danh Sách Trang</h2>
                        <div style="float: right; width: 100px;">
                            <asp:Button ID="btnThem" runat="server" Text="Thêm Mới" CssClass="form-control btn btn-default" PostBackUrl="~/formQuanTri/frmTrangBaiVietCUD.aspx" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <div class="x_content">
                        <div class="table-responsive">
                            <table id='example' class="table table-striped jambo_table table-bordered" style="width: 100%;">
                                <asp:PlaceHolder ID="tblTrang" runat="server"></asp:PlaceHolder>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
