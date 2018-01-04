<%@ page title="" language="C#" masterpagefile="~/MasterPage.Master" autoeventwireup="true" codebehind="frm_TrangChu.aspx.cs" inherits="HinhHocHoaHinh.frm_TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <style>
        .art-content .art-postcontent-0 .layout-item-0 {
            padding-right: 10px;
            padding-left: 10px;
        }

        .ie7 .art-post .art-layout-cell {
            border: none !important;
            padding: 0 !important;
        }

        .ie6 .art-post .art-layout-cell {
            border: none !important;
            padding: 0 !important;
        }
    </style>
    <asp:PlaceHolder ID="test" runat="server"></asp:PlaceHolder>
</asp:content>
