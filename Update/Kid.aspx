<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Kid.aspx.cs" Inherits="Update_Kid" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <link href='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
    <link href='https://davidstutz.github.io/bootstrap-multiselect/css/bootstrap-multiselect.css' rel='stylesheet' type='text/css'>
    <script src='https://davidstutz.github.io/bootstrap-multiselect/js/bootstrap-multiselect.js' type='text/javascript'></script>

    <div class='container'>
        <div class='panel panel-primary dialog-panel'>
            <div class='panel-heading card header'>
                <h5>Update Kid</h5>
            </div>
            <div class='panel-body'>
                <form class='form-horizontal' role='form' runat="server">
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'></label>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'>Kid ID</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id' placeholder='ID' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 col-md-offset-0'>
                            <asp:Button runat="server" class="btn btn-warning btn-fill" ID="FindBtn" Text="Go" OnClick="FindBtn_Click" type='submit'></asp:Button>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Full Name</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id_first_name' placeholder='First Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id_last_name' placeholder='Last Name' type='text'></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_adults'>Birthdate</label>
                        <div class='col-md-1'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="DayBox" CssClass="form-control" runat="server" Rows="1"></asp:ListBox>
                            </div>
                        </div>
                        <div class='col-md-1'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="MonthBox" CssClass="form-control" runat="server" Rows="1"></asp:ListBox>
                            </div>
                        </div>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="YearBox" CssClass="form-control" runat="server" Rows="1"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_email'>Address</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="StreetBox" CssClass="form-control" runat="server" placeholder='Street' type="text"></asp:TextBox>
                            </div>
                        </div>
                        <div class='col-md-1'>
                            <div class='form-group internal'>
                                <asp:TextBox ID="HouseBox" CssClass="form-control" runat="server" placeholder='Number' type="number"></asp:TextBox>
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
                                <asp:TextBox runat="server" class='form-control datepicker' ID='LongBox' placeholder='Longitude'></asp:TextBox>
                                <span class='input-group-addon'>
                                    <i class='glyphicon glyphicon-arrow-right'></i>
                                </span>
                            </div>
                        </div>
                        <div class='col-md-2'>
                            <div class='form-group internal input-group'>
                                <asp:TextBox runat="server" class='form-control datepicker' ID='LatBox' placeholder='Latitude'></asp:TextBox>
                                <span class='input-group-addon'>
                                    <i class='glyphicon glyphicon-arrow-up'></i>
                                </span>
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
                                <asp:TextBox ID="KidPlaceBox" CssClass="form-control" runat="server" placeholder='Number' type="number"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_accomodation'>Kindergarten</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="KGBox" CssClass="form-control" OnSelectedIndexChanged="KGBox_SelectedIndexChanged"
                                    AutoPostBack="false" runat="server" Rows="1"></asp:ListBox>
                            </div>
                        </div>
                        <label class='control-label col-md-1 col-md-offset-0' for='id_title'>Class</label>
                        <div class='col-md-2'>
                            <div class='form-group internal'>
                                <asp:ListBox ID="CBox" CssClass="form-control" runat="server" Rows="1"></asp:ListBox>
                            </div>
                        </div>
                    </div>
                    <div class='form-group'>
                        <div class='col-md-2 col-md-offset-2'>
                            <asp:Button runat="server" class="btn btn-warning btn-fill btn-wd" Style='float: right' Text="Update Kid" type='submit'></asp:Button>
                        </div>
                        <div class='col-md-2'>
                            <asp:Button runat="server" class="btn btn-danger btn-fill btn-wd" Style='float: right' Text="Cancel" type='submit'></asp:Button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
</asp:Content>

