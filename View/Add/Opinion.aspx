<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Opinion.aspx.cs" Inherits="Add_Opinion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="mainContent" runat="Server">
    <div class='container'>
        <div class='panel panel-warning dialog-panel'>
            <div class='panel-heading'>Manage Opinions</div>
            <div class='panel-body'>
                <form class='form-horizontal' role='form' runat="server">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Kindergarten Opinions &amp; Activity Opinions</h4>
                            <p class="category">Please choose whether to view opinions regarding kindergartens or activities </p>
                        </div>
                        <div class="content content-full-width">
                            <ul role="tablist" class="nav nav-tabs">
                                <li role="presentation" class="active">
                                    <a href="#icon-Kindergarten" data-toggle="tab" aria-expanded="true"><i class="fa fa-info"></i>Kindergarten</a>
                                </li>
                                <li class="">
                                    <a href="#icon-Activity" data-toggle="tab" aria-expanded="false"><i class="fa fa-user"></i>Activity</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div id="icon-Kindergarten" class="tab-pane active">
                                    <div class="row">
                                        <div class="col-md-12">
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
                                                            <td class="td-actions text-right" style="">
                                                                <a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)">
                                                                    <i class="fa fa-image"></i>
                                                                </a>
                                                                <a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)">
                                                                    <i class="fa fa-edit"></i>
                                                                </a>
                                                                <a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)">
                                                                    <i class="fa fa-remove"></i>
                                                                </a>
                                                            </td>
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
                                <div id="icon-Activity" class="tab-pane">
                                    We are Houses Inc., a group of architects and interior designers based in Chicago and operating for clients worldwide. We’ve been designing stunningly beautiful houses and making clients happy for years.
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>

