<%@ page title="" language="C#" masterpagefile="~/formQuanTri/frmMQT.Master" autoeventwireup="true" codebehind="frmVietBai.aspx.cs" inherits="HinhHocHoaHinh.formQuanTri.frmVietBai" %>

<%@ register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    VIẾT BÀI
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form runat="server">
            <div class="row">
                    <div class="x_panel">
                        <div class="x_title">
                            <h4 style="float: left;"><i class="fa fa-file-text-o fa-fw">&nbsp;</i>Bài viết</h4>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <p><b>Tiêu đề: </b></p>
                            <asp:TextBox ID="txtTieuDe" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tiêu đề không đc bỏ trống" ControlToValidate="txtTieuDe" ForeColor="Red" ValidationGroup="error" Font-Italic="True"></asp:RequiredFieldValidator>
                            <br />
                            <p><b>Tóm tắt bài viết: </b></p>
                            <asp:TextBox ID="txtTomTat" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tóm tắt không đc bỏ trống" ControlToValidate="txtTomTat" ForeColor="Red" ValidationGroup="error" Font-Italic="True"></asp:RequiredFieldValidator>
                            <p><b>Loại bài viết: </b></p>
                            <asp:DropDownList ID="drlLoai" runat="server" CssClass="form-control input-group" AutoPostBack="True"></asp:DropDownList>
                            <p><b>Bài viết: </b></p>
                            <ckeditor:ckeditorcontrol runat="server" id="txtNoiDung"></ckeditor:ckeditorcontrol>

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
                                            <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn btn-lg btn-block btn-default" PostBackUrl="~/formQuanTri/frmDanhSachBaiViet.aspx" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
        </form>
    </div>
    <script src="../ckeditor/ckeditor.js"></script>
</asp:content>
