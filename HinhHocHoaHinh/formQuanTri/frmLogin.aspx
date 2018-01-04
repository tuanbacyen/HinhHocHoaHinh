<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="HinhHocHoaHinh.formQuanTri.frmLogin" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản trị bài viết</title>

    <!-- Bootstrap -->
    <link href="https://cdn.rawgit.com/tuanbacyen/vendors/b7337c34/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdn.rawgit.com/tuanbacyen/vendors/b7337c34/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="https://cdn.rawgit.com/tuanbacyen/vendors/b7337c34/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://cdn.rawgit.com/tuanbacyen/vendors/3e552b9/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../styles/build/css/custom.min.css" rel="stylesheet">

    <style>
        body {
            height: 100%;
            background: url(../images/bg.jpg);
            no-repeat center center fixed;
            /*-webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;*/
            background-size: 100% 1080px;
            padding: 20px;            
        }

        ._txt {
            border: none;
            border-radius: 10px;
        }
    </style>
</head>

<body class="_login">
    <div class="">
        <div class="login_wrapper">
            <div class="animate form login_form">
                <section style="margin: 0 auto; padding: 25px 0 0; position: relative; text-align: center; text-shadow: 0 1px 0 #fff; min-width: 350px;">
                    <form id="frmLogin" runat="server">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12" style="float: left; opacity: 0.2 inherit;">
                                <div class="x_panel" style="background: rgba(242,242,242,0.8); border: none; border-radius: 15px; box-shadow: 2px 5px 20px #808080;">
                                    <div class="x_content">
                                        <h1><i class="fa fa-flag"></i>&nbsp;Đăng Nhập</h1>
                                        <h4>Trang quản trị</h4>
                                        <div class="clearfix"></div>
                                        <asp:Panel ID="pnlLogin" class="separator" runat="server" DefaultButton="btnDangNhap">
                                            <div>
                                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control _txt" placeholder="Tên đăng nhập"></asp:TextBox>
                                                <br />
                                            </div>
                                            <div>
                                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control _txt" placeholder="Mật khẩu" TextMode="Password"></asp:TextBox>
                                                <br />
                                            </div>
                                            <div>
                                                <asp:LinkButton ID="btnDangNhap" CssClass="btn btn-block btn-success form-control _txt" runat="server" OnClick="btnDangNhap_Click">Đăng Nhập</asp:LinkButton>
                                            </div>
                                            <div>
                                                <asp:Label ID="labThongBao" runat="server" Text="Label" Font-Bold="True" Font-Italic="True" Enabled="False" Visible="False"></asp:Label>
                                            </div>
                                        </asp:Panel>
                                        <div class="clearfix"></div>
                                        <div class="separator">
                                            <p class="change_link">
                                                Đăng nhập để truy cập hệ thống
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
</body>
</html>
