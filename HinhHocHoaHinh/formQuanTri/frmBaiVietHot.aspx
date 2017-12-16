<%@ Page Title="" Language="C#" MasterPageFile="~/formQuanTri/frmMQT.Master" AutoEventWireup="true" CodeBehind="frmBaiVietHot.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmBaiVietHot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    DANH SÁCH BÀI VIẾT HOT
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
                            <asp:DropDownList ID="drl" runat="server" CssClass="form-control input-group" AutoPostBack="True" OnSelectedIndexChanged="drl_TextChanged"></asp:DropDownList>
                            <hr />
                            <asp:Button ID="btlReset" runat="server" Text="Tạo Lại" CssClass="form-control btn btn-default" OnClick="btnReset_Click" />
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12 col-xs-12" style="float: left;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2 style="float: left;">Danh Sách Bài Viết HOT</h2>
                            <div style="float: right; width: 100px;">
                                <asp:Button ID="btnThem" runat="server" Text="Thêm Mới" CssClass="form-control btn btn-default" PostBackUrl="~/formQuanTri/frmBaiVietHotCU.aspx" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                                <table id='example' class="table table-striped jambo_table table-bordered">
                                    <asp:PlaceHolder ID="tblBVH" runat="server"></asp:PlaceHolder>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
