<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Opinion.aspx.cs" Inherits="Update_Opinion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <!--Import basic css-->
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <!--Panel starts here-->
    <div class='container'>
        <!--Panel style panel-primary = blue header, panel-warning = orange header...-->
        <div class='panel panel-warning dialog-panel'>
            <!--Header title = Add Kid-->
            <div class='panel-heading'>Add Kid</div>
            <!--Panel body starts here-->
            <div class='panel-body'>
                <!--Form starts here, every TextBox, Button and such components must be inside a form-->
                <form class='form-horizontal' role='form' runat="server">
                    <!--Empty Row, form-group is a row in the form-->
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'></label>
                    </div>
                    <!--1st Row, Kid ID-->
                    <div class='form-group'>
                        <!--1st label, Kid ID-->
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'>Kid ID</label>
                        <!--1st textBox, col-md-2 indent-small represents moving litlle bit right-->
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <!--1st TextBox, Kid ID type='text' stands for free text-->
                                <asp:TextBox runat="server" class='form-control' ID='id' placeholder='ID' type='text'></asp:TextBox>
                                <!--p is paragraph so it will be spaced from textbox-->
                                <p>
                                    <!--indicated this is a required field-->
                                    <!--ControlToValidate is the id of the textbox that should be validated-->
                                    <!--Display="Dynamic" meand it will be placed according to the textbox-->
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="id"
                                        ErrorMessage="ID Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                    <!--indicated this is a Regular Expression field-->
                                    <!--Display="Dynamic" meand it will be placed according to the textbox-->
                                    <asp:RegularExpressionValidator runat="server" ControlToValidate="id"
                                        ErrorMessage="ID Is Invalid (9 digits)"
                                        ValidationExpression="^[0-9]{9}"
                                        Display="Dynamic">
                                    </asp:RegularExpressionValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--2nd Row, Full Name-->
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
                    <!--3rd Row, Birthdate-->
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
                    <!--4th Row, Address-->
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
                    <!--5th Row, Coordinates-->
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
                    <!--5th Row, Father Name-->
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Father Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='TextBox1' placeholder='First Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='TextBox2' placeholder='Last Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--5th Row, Mother Name-->
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Mother Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='TextBox3' placeholder='First Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='TextBox4' placeholder='Last Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!--5th Row, Kid's Place-->
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
                    <!--6th Row, Kindergarten + Class-->
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_accomodation'>Kindergarten</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="KGBox" CssClass="form-control" AutoPostBack="True" runat="server" Rows="1"></asp:ListBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="KGBox"
                                        ErrorMessage="Kindergarten Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                        <label class='control-label col-md-1 col-md-offset-0' for='id_title'>Class</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="CBox" CssClass="form-control" runat="server" Rows="1"></asp:ListBox>
                                <p>
                                    <asp:RequiredFieldValidator runat="server"
                                        ControlToValidate="CBox"
                                        ErrorMessage="Class Is Required"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!--Buttons starts here-->
                    <div class='form-group'>
                        <br />
                        <!--goes 1 line down-->
                        <div class="footer text-center">
                            <!--CausesValidation will check all the validators declared in the form-->
                            <asp:Button runat="server" CausesValidation="true" class="btn btn-warning btn-fill btn-wd" Text="Add Kid" type='submit'></asp:Button>
                            <asp:Button runat="server" class="btn btn-danger btn-fill btn-wd" Text="Cancel" type='submit'></asp:Button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

