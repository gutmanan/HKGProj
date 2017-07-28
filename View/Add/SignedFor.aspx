<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="SignedFor.aspx.cs" Inherits="Add_SignedFor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    Homepage
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />

    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Sign up a kid for an activity</div>
            <div class='panel-body'>
                <form class='form-horizontal' role='form' runat="server" id="FormView">
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
                                                    Show
                                                    <select name="datatables_length" aria-controls="datatables" class="form-control input-sm">
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="-1">All</option>
                                                    </select>
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
                                    <asp:Literal runat="server" ID="lit"></asp:Literal>
                                    <asp:Table runat="server" ID="datatables" class="table table-striped table-no-bordered table-hover dataTable dtr-inline" CellSpacing="0" Width="100%" Style="width: 100%;" role="grid" aria-describedby="datatables_info">
                                    </asp:Table>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <div class="dataTables_info" id="datatables_info" role="status" aria-live="polite">Showing 1 to 10 of 40 entries</div>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="dataTables_paginate paging_full_numbers" id="datatables_paginate">
                                                <ul class="pagination">
                                                    <li class="paginate_button first disabled" id="datatables_first"><a href="#" aria-controls="datatables" data-dt-idx="0" tabindex="0">First</a></li>
                                                    <li class="paginate_button previous disabled" id="datatables_previous"><a href="#" aria-controls="datatables" data-dt-idx="1" tabindex="0">Previous</a></li>
                                                    <li class="paginate_button active"><a href="#" aria-controls="datatables" data-dt-idx="2" tabindex="0">1</a></li>
                                                    <li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="3" tabindex="0">2</a></li>
                                                    <li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="4" tabindex="0">3</a></li>
                                                    <li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="5" tabindex="0">4</a></li>
                                                    <li class="paginate_button next" id="datatables_next"><a href="#" aria-controls="datatables" data-dt-idx="6" tabindex="0">Next</a></li>
                                                    <li class="paginate_button last" id="datatables_last"><a href="#" aria-controls="datatables" data-dt-idx="7" tabindex="0">Last</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end content-->
                    </div>
                    <div class='form-group'>
                        <div class='col-md-2 col-md-offset-2'>
                            <asp:Button runat="server" class="btn btn-warning btn-fill btn-wd" Style='float: right' Text="Update Kid" ID="Submit"></asp:Button>
                        </div>
                        <div class='col-md-2'>
                            <asp:Button runat="server" class="btn btn-danger btn-fill btn-wd" Style='float: right' Text="Cancel" type='submit'></asp:Button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

