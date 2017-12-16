<%@ page language="C#" autoeventwireup="true" codebehind="test.aspx.cs" inherits="HinhHocHoaHinh.formQuanTri.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:gridview id="GridView1" runat="server"
                headerstyle-backcolor="green"
                autogeneratecolumns="false" font-names="Arial"
                onpageindexchanging="OnPaging"
                font-size="11pt" alternatingrowstyle-backcolor="#C2D69B"
                allowpaging="true">
                <Columns>
                    <asp:TemplateField>
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server"
                            onclick = "RadioCheck(this);"/>
                        <asp:HiddenField ID="HiddenField1" runat="server"
                            Value = '<%#Eval("CustomerID")%>' />
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField ItemStyle-Width="150px" DataField="CustomerID"
                        HeaderText="CustomerID"  />
                    <asp:BoundField ItemStyle-Width="150px" DataField="City"
                        HeaderText="City" />
                    <asp:BoundField ItemStyle-Width="150px" DataField="PostalCode"
                        HeaderText="PostalCode"/>
                </Columns>
             </asp:gridview>
        </div>
    </form>
</body>
</html>
