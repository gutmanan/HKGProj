﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<script type="text/javascript">
    function existAlert() {
        swal({
            title: "Auto close alert!",
            text: "I will close in 2 seconds.",
            timer: 2000,
            showConfirmButton: false
        });
    }
</script>

<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="../../assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Haifa Kindergartens</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />

    <!--  Light Bootstrap Dashboard core CSS    -->
    <link href="../../assets/css/light-bootstrap-dashboard.css" rel="stylesheet" />

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../../assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="../../assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>
<body>
    <nav class="navbar navbar-transparent navbar-absolute">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href='<%=ResolveUrl("~/View/Login.aspx")%>'>Looking to login?
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="wrapper wrapper-full-page">
        <div class="full-page register-page" data-color="orange" data-image="../../assets/img/full-screen-image-1.jpg">
            <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
            <div class="content">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="header-text">
                                <h2>Haifa Kindergartens</h2>
                                <h4>Register for free and experience the new kindergarten management technique</h4>
                                <hr />
                            </div>
                        </div>
                        <div class="col-md-4 col-md-offset-2">
                            <div class="media">
                                <div class="media-left">
                                    <div class="icon">
                                        <i class="pe-7s-user"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h4>Free Account</h4>
                                </div>
                            </div>

                            <div class="media">
                                <div class="media-left">
                                    <div class="icon">
                                        <i class="pe-7s-graph1"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h4>Awesome Performances</h4>
                                </div>
                            </div>

                            <div class="media">
                                <div class="media-left">
                                    <div class="icon">
                                        <i class="pe-7s-headphones"></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h4>Global Support</h4>
                                </div>
                            </div>

                        </div>
                        <div class="col-md-4 col-md-offset-s1">
                            <form method="post" action="Register.aspx" runat="server">
                                <div class="card card-plain">
                                    <div class="content">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="id" AutoPostBack="false" placeholder="ID" class="form-control"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ControlToValidate="fName"
                                                    ErrorMessage="ID Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator runat="server" ControlToValidate="id"
                                                    ErrorMessage="ID Is Invalid (9 digits)"
                                                    ValidationExpression="^[0-9]{9}"
                                                    Display="Dynamic">
                                                </asp:RegularExpressionValidator>
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="text" AutoPostBack="false" ID="fName" placeholder="First Name" class="form-control"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                    ControlToValidate="fName"
                                                    ErrorMessage="First Name Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="text" AutoPostBack="false" ID="lName" placeholder="Last Name" class="form-control"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                    ControlToValidate="lName"
                                                    ErrorMessage="Last Name Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="text" AutoPostBack="false" ID="bDay" placeholder="Birthdate" class="form-control datepicker"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                                    ControlToValidate="bDay"
                                                    ErrorMessage="Birthdate Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <asp:RadioButtonList ID="radioGender" runat="server">
                                                <asp:ListItem Text=" Male" Value="1" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text=" Female" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="password" AutoPostBack="false" ID="pass1" placeholder="Password" class="form-control"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                                    ControlToValidate="pass1"
                                                    ErrorMessage="Password Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox runat="server" type="password" AutoPostBack="false" ID="pass2" placeholder="Password Confirmation" class="form-control"></asp:TextBox>
                                            <p>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                    ControlToValidate="pass2"
                                                    ErrorMessage="Password Confirmation Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="footer text-center">
                                        <asp:Button runat="server" type="submit" ID="createBtn" CausesValidation="true" CssClass="btn btn-fill btn-neutral btn-wd" Text="Create Free Account"></asp:Button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer footer-transparent">
                <div class="container">
                    <p class="copyright pull-right">&copy; 2017 <a href="http://www.shaigutman.com">Shai Gutman & Yair Etzion</a>, made for databases course</p>
                </div>
            </footer>
        </div>
    </div>
</body>
<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="../../assets/js/jquery.min.js" type="text/javascript"></script>
<script src="../../assets/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Forms Validations Plugin -->
<script src="../../assets/js/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="../../assets/js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="../../assets/js/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="../../assets/js/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="../../assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>

<!--  Charts Plugin -->
<script src="../../assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="../../assets/js/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="../../assets/js/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="../../assets/js/jquery-jvectormap.js"></script>

<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Wizard Plugin    -->
<script src="../../assets/js/jquery.bootstrap.wizard.min.js"></script>

<!--  Datatable Plugin    -->
<script src="../../assets/js/bootstrap-table.js"></script>

<!--  Full Calendar Plugin    -->
<script src="../../assets/js/fullcalendar.min.js"></script>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="../../assets/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="../../assets/js/demo.js"></script>

<script type="text/javascript">
    $().ready(function () {

        // Init Sliders
        demo.initFormExtendedSliders();

        // Init DatetimePicker
        demo.initFormExtendedDatetimepickers();

        lbd.checkFullPageBackgroundImage();

        setTimeout(function () {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>

</html>


