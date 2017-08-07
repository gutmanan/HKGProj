<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Queries.aspx.cs" Inherits="View_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function showSwal(type, param) {
            if (type == 'basic') {
                swal(param);
            } else if (type == 'warning-message-and-confirmation') {
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to recover this opinion!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn btn-info btn-fill",
                    confirmButtonText: "Yes, delete it!",
                    cancelButtonClass: "btn btn-danger btn-fill",
                    closeOnConfirm: false,
                }, function () {
                    DeleteSelected(param);
                });
            } else if (type == 'input-field') {
                swal({
                    title: 'Please provide new opinion',
                    html: '<p><asp:TextBox ID="Talk" CssClass="form-control" runat="server" placeholder="Opinion"></asp:TextBox>' +
                    '<p><asp:TextBox ID="Grade" CssClass="form-control" runat="server" placeholder="Grade" TextMode="number"></asp:TextBox>',
                    showCancelButton: true,
                    closeOnConfirm: false,
                    allowOutsideClick: false
                },
                    function () {
                        var talk = $("#<%= Talk.ClientID %>").val();
                        var grade = $("#<%= Grade.ClientID %>").val();
                        AddOpinion(talk, grade);
                        swal({
                            html:
                            'You entered: <strong>' + talk + " grade: " + grade + '</strong>'
                        });
                    })
            }
            else if (type == 'update-field') {
                swal({
                    title: 'Please provide new opinion',
                    html: '<p><asp:TextBox ID="Talk1" CssClass="form-control" runat="server" placeholder="Opinion"></asp:TextBox>' +
                    '<p><asp:TextBox ID="Grade1" CssClass="form-control" runat="server" placeholder="Grade" TextMode="number"></asp:TextBox>',
                    showCancelButton: true,
                    closeOnConfirm: false,
                    allowOutsideClick: false
                },
                    function () {
                        var talk = $("#<%= Talk1.ClientID %>").val();
                        var grade = $("#<%= Grade1.ClientID %>").val();
                        UpdateOpinion(param, talk, grade);
                        swal({
                            html:
                            'You entered: <strong>' + talk + " grade: " + grade + '</strong>'
                        });
                    })
            }
            return false;
        }
    </script>
    <script type="text/javascript">
        function DeleteSelected(selected) {
            PageMethods.DeleteSelectedOpinion(selected, OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            swal("Success!", response, "success");
        }
    </script>
    <script type="text/javascript">
        function UpdateOpinion(selected, talk, grade) {
            PageMethods.UpdateOpinion(selected, talk, grade, OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            swal("Success!", response, "success");
        }
    </script>
    <script type="text/javascript">
        function AddOpinion(talk, grade) {
            PageMethods.AddOpinion(talk, grade, OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            swal("Success!", response, "success");
        }
    </script>
    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Queries</div>
            <div class='panel-body'>
                <div class='form-horizontal' role='form'>
                    <div class="card">
                        <div class="header">
                            <h4 class="title">View Queries</h4>
                            <p class="category">You can view, save &amp; print queries</p>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
                                </asp:ScriptManager>
                                <br />
                                <div class='form-group'>
                                    <div class="content">
                                        <label class='control-label col-md-2 col-md-offset-0'>Query</label>
                                        <div class="col-md-2">
                                            <asp:ListBox ID="QueryBox" CssClass="form-control" OnSelectedIndexChanged="QueryBox_SelectedIndexChanged"
                                                AutoPostBack="true" runat="server" Rows="1"></asp:ListBox>
                                            <p>
                                                <asp:RequiredFieldValidator runat="server"
                                                    ControlToValidate="QueryBox"
                                                    ErrorMessage="Query Is Required"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </p>
                                        </div>
                                        <asp:HyperLink runat="server" CausesValidation="true" class="btn btn-warning btn-fill" type='submit'>
                                                <i class='fa fa-download'></i>
                                        </asp:HyperLink>
                                        <asp:HyperLink runat="server" CausesValidation="true" class="btn btn-danger btn-fill" type='submit'>
                                                <i class='fa fa-print'></i>
                                        </asp:HyperLink>
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="toolbar">
                                        <!--Here you can write extra buttons/actions for the toolbar              -->
                                    </div>
                                    <div class="fresh-datatables">
                                        <div id="datatables_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="dataTables_length" id="datatables_length">
                                                        <label>Showing <asp:Literal runat="server" ID="lit"></asp:Literal> entries</label>
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
                            <!-- end col-md-12 -->
                        </div>
                    </div>
                </div>
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

    <!-- Sweet Alert 2 plugin -->
    <script src="../../assets/js/sweetalert2.js"></script>
</asp:Content>

