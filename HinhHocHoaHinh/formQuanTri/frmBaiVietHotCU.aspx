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
	                        <h4 style="float: left;"><i class="fa fa-filter fa-fw">&nbsp;</i>Lọc Bài Viết</h4>
	                        <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
		                        <asp:DropDownList ID="drlTrang" runat="server" CssClass="form-control input-group" AutoPostBack="True" OnSelectedIndexChanged="drlTrang_TextChanged"></asp:DropDownList>
		                        <hr />
	                        <div class="x_content">
		                        <asp:DropDownList ID="drlLoai" runat="server" CssClass="form-control input-group" AutoPostBack="True" OnSelectedIndexChanged="drlLoai_TextChanged"></asp:DropDownList>
		                        <hr />
		                        <asp:Button ID="btlReset" runat="server" Text="Tạo Lại" CssClass="form-control btn btn-default" OnClick="btnReset_Click" />
	                        </div>
                        </div>
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
                            <div class="clearfix">
                            </div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                                <asp:gridview id="GridView1" runat="server"
                                headerstyle-backcolor="#ABEBC6"
                                HeaderStyle-CssClass="centerHeaderText"
                                autogeneratecolumns="false" font-names="Arial"
                                font-size="11pt" alternatingrowstyle-backcolor="#C2D69B" ForeColor="black"
                                allowpaging="true" class="table table-striped jambo_table table-bordered">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Lựa chọn" ItemStyle-HorizontalAlign="Center" >
                                        <ItemTemplate>
                                            <asp:RadioButton ID="RadioButton1" runat="server" onclick = "RadioCheck(this)"/>
                                            <asp:HiddenField ID="HiddenField1" runat="server" Value = '<%#Eval("id")%>' />
                                        </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField ItemStyle-Width="20%" DataField="id"
                                            HeaderText="ID Bài Viết" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField ItemStyle-Width="60%" DataField="ten"
                                            HeaderText="Tên Bài Viết"  />
                                    </Columns>
                             </asp:gridview>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script language="javascript" type="text/javascript">
            function myselection(rbtnid) {
                var rbtn = document.getElementById(rbtnid);
                var rbtnlist = document.getElementsByTagName("input");
                for (i = 0; i < rbtnlist.length; i++) {
                    if (rbtnlist[i].text == "radio" && rbtnlist[i].id != rbtn.id) {
                        rbtnlist[i].checked = false;

                    }
                }
            }
            function RadioCheck(rb) {
                var gv = document.getElementById("<%=GridView1.ClientID%>");
                var rbs = gv.getElementsByTagName("input");

                var row = rb.parentNode.parentNode;
                for (var i = 0; i < rbs.length; i++) {
                    if (rbs[i].type == "radio") {
                        if (rbs[i].checked && rbs[i] != rb) {
                            rbs[i].checked = false;
                            break;
                        }
                    }
                }
            }
        </script>
        <style>
            .centerHeaderText th {
                text-align: center;
            }
        </style>
    </div>
</asp:Content>
