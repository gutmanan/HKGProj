<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SignedFor.aspx.cs" Inherits="Add_SignedFor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function showSwal(type, param) {
            if (type == 'basic') {
                swal(param);
            }
        }
    </script>
    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Manage Signfors</div>
            <div class='panel-body'>
                <div class='form-horizontal' role='form' id="FormView">
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'></label>
                    </div>
                    <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-0' for='id_title'>Kid ID</label>
                        <div class='col-md-2 indent-small'>
                            <div class='form-group internal'>
                                <asp:TextBox runat="server" class='form-control' ID='id' placeholder='ID' type='text'></asp:TextBox>
                                <p>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
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
                        <div class='col-md-2 col-md-offset-0'>
                            <asp:Button runat="server" class="btn btn-warning btn-fill" CausesValidation="true" ID="FindBtn" Text="Go" OnClick="FindBtn_Click" type='submit'></asp:Button>
                        </div>
                    </div>
                    <div class="card">
                        <div class="content">
                            <div class="toolbar">
                                <!--Here you can write extra buttons/actions for the toolbar              -->
                            </div>
                            <div class="fresh-datatables">
                                <div id="datatables_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="dataTables_length" id="datatables_length">
                                                <label>
                                                    Showing                                                            
                                                                            <asp:Literal runat="server" ID="lit"></asp:Literal>
                                                    entries</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div id="datatables_filter" class="dataTables_filter">
                                                <label>
                                                    <input type="search" class="form-control input-sm" placeholder="Search records" aria-controls="datatables"></label>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Table runat="server" ID="datatables" class="table table-striped table-no-bordered table-hover dataTable dtr-inline" CellSpacing="0" Width="100%" Style="width: 100%;" role="grid" aria-describedby="datatables_info">
                                    </asp:Table>
                                </div>
                            </div>
                        </div>
                        <!-- end content-->
                    </div>
                    <div class='form-group'>
                        <br />
                        <div class="footer text-center">
                            <asp:Button runat="server" ID="Update" CausesValidation="true" class="btn btn-warning btn-fill btn-wd" OnClick="Update_Click" Text="Update" type='submit'></asp:Button>
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

