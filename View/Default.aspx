<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function initDashboardPageCharts() {
            /*   **************** World Map ********************    */
            DrawMap();
            /*   **************** Pie Chart ********************    */
            DrawPie();
            /*   **************** Line Chart ********************    */
            DrawGraph();
            /*   **************** Bar Chart ********************    */
            DrawBar();
            /*   **************** Line Chart ********************    */
            DrawLine();
        }
    </script>
    <script type="text/javascript">
        function DrawPie() {
            PageMethods.DrawPie(OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            var res = response.split(",").map(Number);

            var data = {
                series: res
            };

            var sum = function (a, b) { return a + b };

            Chartist.Pie('#chartPie', data, {
                labelInterpolationFnc: function (value) {
                    return Math.round(value / data.series.reduce(sum) * 100) + '%';
                }
            });
        }
    </script>
    <script type="text/javascript">
        function DrawMap() {
            var mapData = {
                "IL": 3000,
            };

            $('#worldMap').vectorMap({
                map: 'world_mill_en',
                backgroundColor: "transparent",
                zoomOnScroll: false,
                regionStyle: {
                    initial: {
                        fill: '#e4e4e4',
                        "fill-opacity": 0.9,
                        stroke: 'none',
                        "stroke-width": 0,
                        "stroke-opacity": 0
                    }
                },

                series: {
                    regions: [{
                        values: mapData,
                        scale: ["#AAAAAA", "#444444"],
                        normalizeFunction: 'polynomial'
                    }]
                },
            });
        }
    </script>
    <script type="text/javascript">
        function DrawGraph() {
            PageMethods.DrawGraph(On);
        }
        function On(response, userContext, methodName) {
            var res1 = response.split("~");
            var res2 = res1[1].split(",").map(Number);
            var res3 = res1[2].split(",").map(Number);
            var res4 = res1[0].split(",");

            Chartist.Line('#chartGraph', {
                labels: res4,
                series: [res2, res3]
            }, {
                    low: 0,
                    showArea: true
                });
        }
    </script>
    <script type="text/javascript">
        function DrawBar() {
            PageMethods.DrawBar(OnSuc);
        }
        function OnSuc(response, userContext, methodName) {
            var res1 = response.split("~");
            var res2 = res1[1].split(",").map(Number);
            var res3 = res1[2].split(",").map(Number);
            var res4 = res1[0].split(",");

            var data = {
                labels: res4,
                series: [res2, res3]
            };

            var options = {
                seriesBarDistance: 10
            };

            var responsiveOptions = [
                ['screen and (max-width: 640px)', {
                    seriesBarDistance: 5,
                    axisX: {
                        labelInterpolationFnc: function (value) {
                            return value[0];
                        }
                    }
                }]
            ];
            Chartist.Bar('#chartActivity', data, options, responsiveOptions);
        }
    </script>
    <script type="text/javascript">
            function DrawLine() {
                PageMethods.DrawLine(OnSucc);
            }
            function OnSucc(response, userContext, methodName) {
                var res1 = response.split("~");
                var res2 = res1[0].split(",");
                var res3 = res1[1].split(",").map(Number);

                Chartist.Line('#chartHours', {
                    labels: res2,
                    series: [res3]
                }, {
                        fullWidth: true,
                        chartPadding: {
                            right: 40
                        }
                    });
            }
    </script>
    <div class="content">
        <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Profitable Activity </h4>
                            <asp:Literal runat="server" ID="yearstat"></asp:Literal>
                        </div>
                        <div class="content">
                            <div id="chartPie" class="ct-chart "></div>
                        </div>
                        <div class="footer">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i>Act 8
                                <i class="fa fa-circle text-danger"></i>Act 11
                                <i class="fa fa-circle text-warning"></i>Act 14
                                <i class="fa fa-circle text-primary"></i>Act 2
                                <i class="fa fa-circle text-success"></i>Act 6
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-clock-o"></i>Updated just now
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">Signed Kids</h4>
                            <asp:Literal runat="server" ID="GraphLit"></asp:Literal>
                        </div>
                        <div class="content">
                            <div id="chartGraph" class="ct-chart"></div>
                        </div>
                        <div class="footer">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i>Total number of kids
                                <i class="fa fa-circle text-danger"></i>Number of signed kids
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-check"></i>Data information certified
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">Half Activities</h4>
                            <p class="category">Number of kids signed for more than half of the activities</p>
                        </div>
                        <div class="content">
                            <div id="chartActivity" class="ct-chart"></div>
                        </div>
                        <div class="footer">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i>Kids in kindergarten
                                    <i class="fa fa-circle text-danger"></i>kids signed for more than half of the activities
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-check"></i>Data information certified
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Age Distribution</h4>
                            <p class="category">Number of kids by ages</p>
                        </div>
                        <div class="content">
                            <div id="chartHours" class="ct-chart"></div>
                        </div>
                        <div class="footer">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i>Number of Kids
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-clock-o"></i>Updated just now
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">Distribution of streets</h4>
                            <p class="category">Top 10 streets</p>
                        </div>
                        <div class="content">
                            <div class="row">
                                <div class="col-md-5">
                                    <div class="table-responsive">
                                        <asp:Table runat="server" ID="datatables" class="table table-striped table-no-bordered table-hover dataTable dtr-inline" CellSpacing="0" Width="100%" Style="width: 100%;" role="grid" aria-describedby="datatables_info">
                                        </asp:Table>
                                    </div>
                                </div>
                                <div class="col-md-6 col-md-offset-1">
                                    <div id="worldMap" style="height: 300px;"></div>
                                </div>
                            </div>
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
    <script type="text/javascript">
        $(document).ready(function () {
            initDashboardPageCharts();
        });
    </script>

</asp:Content>
