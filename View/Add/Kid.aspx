﻿<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Kid.aspx.cs" Inherits="Kids" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function showSwal(type, param) {
            if (type == 'basic') {
                swal("Here's a message!");

            } else if (type == 'added-message') {
                swal("Added!", "Successfully added kid to system!", "success")

            } else if (type == 'deleted-message') {
                swal("Cancelled!", "There is no class available!", "error")
            } else if (type == 'already-message') {
                swal("Cancelled!", "The child is already signed!", "error")
            }


            return false;
        }
    </script>
    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Add Kid</div>
            <div class='panel-body'>
                <div class='form-horizontal' role='form'>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'></label>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'>Kid ID</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id' placeholder='ID' type='text'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="id"
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
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Full Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id_first_name' placeholder='First Name' type='text'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="id_first_name"
                                        ErrorMessage="First Name Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id_last_name' placeholder='Last Name' type='text'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="id_last_name"
                                        ErrorMessage="Last Name Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Birthdate</label>
                        <div class='col-md-2 '>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" type="text" AutoPostBack="false" ID="bDay" placeholder="Birthdate" TextMode="Date" class="form-control"></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="bDay"
                                        ErrorMessage="Birthdate Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_email'>Address</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="StreetBox" CssClass="form-control" runat="server" placeholder='Street' type="text"></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="StreetBox"
                                        ErrorMessage="Street Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                        <div class='col-md-1'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="HouseBox" CssClass="form-control" runat="server" placeholder='Number' type="number"></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="HouseBox"
                                        ErrorMessage="Number Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="CityBox" CssClass="form-control" placeholder='Haifa' disabled="true" runat="server" type="text"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_checkin'>Coordinates</label>
                        <div class='col-md-2'>
                            <div class='form-group internal input-group'>
                                <asp:TextBox runat="server" class='form-control' ID='LongBox' placeholder='Longitude'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="LongBox"
                                        ErrorMessage="Longitude Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                        <div class='col-md-2'>
                            <div class='form-group internal input-group'>
                                <asp:TextBox runat="server" class='form-control' ID='LatBox' placeholder='Latitude'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="LatBox"
                                        ErrorMessage="Latitude Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Father Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='First_Father' placeholder='First Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='Last_Father' placeholder='Last Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Mother Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='First_Mother' placeholder='First Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='Last_Mother' placeholder='Last Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Kid's Place</label>
                        <div class='col-md-1'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="kidPlace" CssClass="form-control" runat="server" placeholder='Number' TextMode="number"></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="kidPlace"
                                        ErrorMessage="Kid's Place Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_accomodation'>Type </label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:RadioButtonList AutoPostBack="true" ID="radioGender" OnSelectedIndexChanged="radioGender_SelectedIndexChanged" runat="server">
                                    <asp:ListItem Text=" Private" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text=" Public" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" ID="kinLab" class='control-label col-md-2 col-md-offset-0' for='id_accomodation'>Kindergarten</asp:Label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="KGBox" CssClass="form-control" OnSelectedIndexChanged="KGBox_SelectedIndexChanged"
                                    AutoPostBack="True" runat="server" Rows="1"></asp:ListBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="KGBox"
                                        ErrorMessage="Kindergarten Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <br />
                        <div class="footer text-center">
                            <asp:Button runat="server" ID="addKidButton" OnClick="addKidButton_Click" CausesValidation="true" class="btn btn-warning btn-fill btn-wd" Text="Add Kid" type='submit'></asp:Button>
                            <asp:Button runat="server" class="btn btn-danger btn-fill btn-wd" Text="Cancel" type='submit'></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src='<%=ResolveUrl("~/assets/js/jquery.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("~/assets/js/jquery-ui.min.js")%>' type="text/javascript"></script>

    <!-- Sweet Alert 2 plugin -->
    <script src="../../assets/js/sweetalert2.js"></script>
</asp:Content>

