<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="OpinionKin.aspx.cs" Inherits="Add_Opinion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function showSwal(type, param) {
            if (type == 'basic') {
                swal(param);

            } else if (type == 'title-and-text') {
                swal("Here's a message!", "It's pretty, isn't it?")

            } else if (type == 'success-message') {
                swal("Good job!", "You clicked the button!", "success")

            } else if (type == 'warning-message-and-confirmation') {
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this imaginary file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn btn-info btn-fill",
                    confirmButtonText: "Yes, delete it!",
                    cancelButtonClass: "btn btn-danger btn-fill",
                    closeOnConfirm: false,
                }, function () {
                    swal("Deleted!", "Your imaginary file has been deleted.", "success");
                });

            } else if (type == 'warning-message-and-cancel') {
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this imaginary file!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, delete it!",
                    cancelButtonText: "No, cancel plx!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });

            } else if (type == 'custom-html') {
                swal({
                    title: 'HTML example',
                    html:
                    'You can use <b>bold text</b>, ' +
                    '<a href="http://github.com">links</a> ' +
                    'and other HTML tags'
                });

            } else if (type == 'auto-close') {
                swal({
                    title: "Auto close alert!",
                    text: "I will close in 2 seconds.",
                    timer: 2000,
                    showConfirmButton: false
                });
            } else if (type == 'input-field') {
                swal({
                    title: 'Please provide new opinion',
                    html: '<p><input id="input-field" class="form-control">',
                    showCancelButton: true,
                    closeOnConfirm: false,
                    allowOutsideClick: false
                },
                    function () {
                        swal({
                            html:
                            'You entered: <strong>' +
                            $('#input-field').val() +
                            '</strong>'
                        });
                        document.getElementById(param).value = $('#input-field').val();
                    })
            }
        }
    </script>
    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Manage Opinions</div>
            <div class='panel-body'>
                <form class='form-horizontal' role='form' runat="server">
                    <div class="card" runat="server">
                        <div class="header">
                            <h4 class="title">Kindergarten Opinions</h4>
                            <p class="category">You can view, edit &amp; remove opinions</p>
                        </div>
                        <div id="tabs-1" class="tab-pane active">
                            <div class="row">
                                <div class="col-md-12">
                                    <br />
                                    <div class='form-group'>
                                        <label class='control-label col-md-2 col-md-offset-0' for='id_accomodation'>Kindergarten</label>
                                        <div class='col-md-2'>
                                            <div class='form-group internal'>
                                                <asp:ListBox ID="KGBox" CssClass="form-control" OnSelectedIndexChanged="KGBox_SelectedIndexChanged"
                                                    AutoPostBack="true" runat="server" Rows="1"></asp:ListBox>
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
                                    <!--  end card  -->
                                </div>
                                <!-- end col-md-12 -->
                            </div>
                            <div class='form-group'>
                                <br />
                                <div class="footer text-center">
                                    <asp:Button runat="server" CausesValidation="true" class="btn btn-warning btn-fill btn-wd" Text="Add Kid" type='submit'></asp:Button>
                                    <asp:Button runat="server" class="btn btn-danger btn-fill btn-wd" Text="Cancel" type='submit'></asp:Button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="sweet-container">
        <div class="sweet-overlay" tabindex="-1"></div>
        <div class="sweet-alert" style="display: none" tabindex="-1">
            <div class="icon error"><span class="x-mark"><span class="line left"></span><span class="line right"></span></span></div>
            <div class="icon warning"><span class="body"></span><span class="dot"></span></div>
            <div class="icon info"></div>
            <div class="icon success">
                <span class="line tip"></span><span class="line long"></span>
                <div class="placeholder"></div>
                <div class="fix"></div>
            </div>
            <img class="sweet-image">
            <h2>Title</h2>
            <div class="sweet-content">Text</div>
            <hr class="sweet-spacer">
            <button class="sweet-confirm">OK</button>
            <button class="sweet-cancel">Cancel</button>
        </div>
    </div>
    <!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src='<%=ResolveUrl("~/assets/js/jquery.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("~/assets/js/jquery-ui.min.js")%>' type="text/javascript"></script>
    <script src='<%=ResolveUrl("~/assets/js/bootstrap.min.js")%>' type="text/javascript"></script>
    <!-- Sweet Alert 2 plugin -->
    <script src="../../assets/js/sweetalert2.js"></script>

    <!-- Light Bootstrap Dashboard Core javascript and methods -->
    <script src="../../assets/js/light-bootstrap-dashboard.js"></script>

</asp:Content>
