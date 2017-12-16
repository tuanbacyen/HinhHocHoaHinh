<%@ Page Title="" Language="C#" MasterPageFile="~/formQuanTri/frmMQT.Master" AutoEventWireup="true" CodeBehind="frmBaiVietHotCU.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmBaiVietHotCU" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Loại bài viết hot
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
                            <asp:DropDownList ID="drl" runat="server" CssClass="form-control"></asp:DropDownList>
                            <hr />
                            <table style="max-width: 100%; margin: auto; margin-top: 15px; border-spacing: 10px;">
                                <tr>
                                    <td style="width: 50%;">
                                        <div style="width: 95%; float: left;">
                                            <asp:Button ID="Button1" runat="server" Text="Lưu" CssClass="btn btn-lg btn-block btn-success" OnClick="btnThem_Click" ValidationGroup="error" />
                                        </div>
                                    </td>
                                    <td style="width: 50%;">
                                        <div style="width: 95%; float: left;">
                                            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-lg btn-block btn-default" PostBackUrl="~/formQuanTri/frmBaiVietHot.aspx" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12 col-xs-12" style="float: left;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2 style="float: left;">Danh Sách Bài Viết</h2>
                            <div style="float: right; width: 100px;">
                                <asp:Button ID="btnThem" runat="server" Text="Thêm Mới Bài Viết HOT" CssClass="form-control btn btn-default" PostBackUrl="~/formQuanTri/frmBaiVietHotCU.aspx" />
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                                <table id='example' class="table table-striped jambo_table table-bordered">
                                    <asp:PlaceHolder ID="tbl" runat="server"></asp:PlaceHolder>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
