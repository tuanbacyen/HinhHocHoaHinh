<%@ Page Title="" Language="C#" MasterPageFile="~/formHienThi/MasterPage.Master" AutoEventWireup="true" CodeBehind="frm_BaiToanLuong.aspx.cs" Inherits="HinhHocHoaHinh.frm_BaiToanLuong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        &nbsp;<asp:Label ID="txtND" runat="server" Text="Label" ></asp:Label>
    <br />
    <span><h3 style="text-align:center">Các bài toán liên quan</h3></span><br />
   <asp:GridView ID="GridView1"  HeaderStyle-ForeColor="White"
     BorderWidth="0" BorderColor="#F6F2EC"
    RowStyle-BackColor="#F6F2EC" AlternatingRowStyle-BackColor="#F6F2EC" AlternatingRowStyle-ForeColor="#000" EditRowStyle-BorderWidth="0"
    runat="server" AutoGenerateColumns="False" Height="179px" Width="777px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged2">
    <Columns>
        <asp:BoundField DataField="id" ItemStyle-Width = "15px" FooterText="Bài" Visible="False" >
<ItemStyle Width="5px"></ItemStyle>
        </asp:BoundField>
        <asp:HyperLinkField DataTextField="tomtat" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~//formHienThi/frm_BaiToanLuong.aspx?ma={0}" ItemStyle-Width = "150" >
<ItemStyle Width="150px"></ItemStyle>
        </asp:HyperLinkField>
    </Columns>
</asp:GridView>
    <br />
</asp:Content>
