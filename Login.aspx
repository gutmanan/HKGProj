<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>Sign-Up/Login Form</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form">
                <ul class="tab-group">
                    <li class="tab active"><a href="#login">Log In</a></li>
                    <li class="tab"><a href="#signup">Sign Up</a></li>
                </ul>
                <div class="tab-content">
                    <div id="login">
                        <h1>Welcome Back!</h1>
                        <!--form action="/" method="post"-->
                            <div class="field-wrap">
                                <label>Email Address<span class="req">*</span></label>
                                <asp:TextBox runat="server" ID="clientLoginEmail"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label>Password<span class="req">*</span></label>
                                <asp:TextBox runat="server" ID="clientLoginPassword"></asp:TextBox>
                            </div>
                            <p class="forgot"><a href="#">Forgot Password?</a></p>
                            <asp:Button class="button button-block" id="LoginBtn" Text="Log In" OnClick="LoginBtn_Click" runat="server"/>
                        <!--/form-->
                    </div>
                    <div id="signup">
                        <h1>Sign Up</h1>
                        <!--form action="/" method="post"-->
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label>First Name<span class="req">*</span></label>
                                    <asp:TextBox runat="server" ID="clientSignedFirstName"></asp:TextBox>
                                </div>
                                <div class="field-wrap">
                                    <label>Last Name<span class="req">*</span></label>
                                    <asp:TextBox runat="server" ID="clientSignedLastName"></asp:TextBox>
                                </div>
                            </div>
                            <div class="field-wrap">
                                <label>Email Address<span class="req">*</span></label>
                                <asp:TextBox runat="server" ID="clientSignedEmail"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label>Set A Password<span class="req">*</span></label>
                                <asp:TextBox runat="server" ID="clientSignedPassword"></asp:TextBox>
                            </div>
                            <asp:Button class="button button-block" id="SignupBtn" Text="Sign Up" OnClick="SignupBtn_Click" runat="server"/>
                        <!--/form-->
                    </div>
                </div>
                <!-- tab-content -->
            </div>
            <!-- /form -->
            <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
            <script src="assets/js/index.js"></script>
        </div>
    </form>
</body>
</html>
