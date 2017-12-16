<%@ Page Title="" Language="C#" MasterPageFile="~/formQuanTri/frmMQT.Master" AutoEventWireup="true" CodeBehind="frmTrangBaiVietCUD.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmTrangBaiVietCUD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    Tùy chỉnh trang
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form runat="server">
            <div class="row">
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h4 style="float: left;"><i class="fa fa-file-text-o fa-fw">&nbsp;</i>Chi Tiết trang </h4>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p><b>Tên trang: </b></p>
                            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tên trang không đc bỏ trống" ControlToValidate="txtTen" ForeColor="Red" ValidationGroup="error" Font-Italic="True"></asp:RequiredFieldValidator>

                            <table style="max-width: 100%; margin: auto; margin-top: 15px; border-spacing: 10px;">
                                <tr>
                                    <td style="width: 30%;">
                                        <div style="width: 95%; float: left;">
                                            <asp:Button ID="btnThem" runat="server" Text="Lưu" CssClass="btn btn-lg btn-block btn-success" OnClick="btnThem_Click" ValidationGroup="error" />
                                        </div>
                                    </td>
                                    <td style="width: 30%;">
                                        <div style="width: 95%; float: left;">
                                            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CssClass="btn btn-lg btn-block btn-danger" OnClick="btnXoa_Click" Enabled="False" />
                                        </div>
                                    </td>
                                    <td style="width: 30%;">
                                        <div style="width: 95%; float: left;">
                                            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-lg btn-block btn-default" PostBackUrl="~/formQuanTri/frmTrangBaiViet.aspx" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
