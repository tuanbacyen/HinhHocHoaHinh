<%@ Page Title="" Language="C#" MasterPageFile="~/formHienThi/MasterPage.Master" AutoEventWireup="true" CodeBehind="frm_BaiToanViTri.aspx.cs" Inherits="HinhHocHoaHinh.frm_BaiToanViTri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp;<asp:Label ID="txtND" runat="server" Text="Label" ></asp:Label>
    <br />
    <span><h3 style="text-align:center">Các bài toán liên quan</h3></span><br />
   <asp:GridView ID="GridView1"  HeaderStyle-ForeColor="White"
     BorderWidth="0px" BorderColor="#F6F2EC"
    RowStyle-BackColor="#F6F2EC" AlternatingRowStyle-BackColor="#F6F2EC" AlternatingRowStyle-ForeColor="#000" EditRowStyle-BorderWidth="0"
    runat="server" AutoGenerateColumns="False" Height="179px" Width="777px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2">
<AlternatingRowStyle BackColor="#F6F2EC" ForeColor="#000000"></AlternatingRowStyle>
    <Columns>
        <asp:BoundField DataField="id" ItemStyle-Width = "15px" FooterText="Bài" Visible="False" >
<ItemStyle Width="5px"></ItemStyle>
        </asp:BoundField>
        <asp:HyperLinkField DataTextField="tomtat" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~//formHienThi/frm_BaiToanViTri.aspx?ma={0}" ItemStyle-Width = "150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:HyperLinkField>
    </Columns>

<EditRowStyle BorderWidth="0px"></EditRowStyle>

<HeaderStyle ForeColor="White"></HeaderStyle>

<RowStyle BackColor="#F6F2EC"></RowStyle>
</asp:GridView>
    <br />
</asp:Content>
