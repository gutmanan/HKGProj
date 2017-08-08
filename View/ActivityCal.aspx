<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityCal.aspx.cs" Inherits="View_ActivityCal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />
    <script type="text/javascript">
        function initFullCalendar() {
            $calendar = $('#fullCalendar');

            today = new Date();
            y = today.getFullYear();
            m = today.getMonth();
            d = today.getDate();

            $calendar.fullCalendar({
                header: {
                    left: 'title',
                    center: 'month,agendaWeek,agendaDay',
                    right: 'prev,next today'
                },
                defaultView: 'agendaWeek',
                defaultDate: today,
                selectable: true,
                selectHelper: true,
                titleFormat: {
                    month: 'MMMM YYYY', // September 2015
                    week: "MMMM D YYYY", // September 2015
                    day: 'D MMM, YYYY'  // Tuesday, Sep 8, 2015
                },
                select: function (start, end) {

                    // on select we show the Sweet Alert modal with an input
                    swal({
                        title: 'Create an Event',
                        html: '<br><input class="form-control" placeholder="Event Title" id="input-field">',
                        showCancelButton: true,
                        closeOnConfirm: true
                    }, function () {

                        var eventData;
                        event_title = $('#input-field').val();

                        if (event_title) {
                            eventData = {
                                title: event_title,
                                start: start,
                                end: end,
                                backgroundColor: '#ff9510'
                            };
                            $calendar.fullCalendar('renderEvent', eventData, true); // stick? = true
                        }

                        $calendar.fullCalendar('unselect');

                    });
                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                // color classes: [ event-blue | event-azure | event-green | event-orange | event-red ]

            });
            //addEvent('all');
        }
    </script>
    <script>
        function addEvent(title, day, sHour, sMinute, length) {
            $calendar = $('#fullCalendar');

            today = new Date();

            var diff = (today.getDay() + 1 - day);
            if (diff >= 0) today = moment().subtract(diff, 'days').toDate();
            else today = moment().add(-diff, 'days').toDate();

            var eHour = parseInt(sHour);
            var eMinute = Number(sMinute) + Number(length);
            if (eMinute / 60 >= 1) {
                eHour += eMinute / 60;
                eMinute = eMinute % 60;
            }
            y = today.getFullYear();
            m = today.getMonth();
            d = today.getDate();

            //alert(title + " " + eHour + " " + eMinute);
            var eventData = {
                title: title,
                start: new Date(y, m, d, sHour, sMinute),
                end: new Date(y, m, d, eHour, eMinute),
                backgroundColor: '#ff9510'
            };
            $calendar.fullCalendar('renderEvent', eventData, true); // stick? = true
            $calendar.fullCalendar('unselect');
        }
    </script>
    <div class="content">
        <div class="container-fluid">
            <div class="col-md-6">
                <div class="card">
                    <div class="header">Activity Calendar</div>
                    <div class="content">
                        <div class="form-group">
                            <label>Kindergarten</label>
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
                        <div class="form-group">
                            <label>Class</label>
                            <asp:ListBox ID="CBox" CssClass="form-control" OnSelectedIndexChanged="CBox_SelectedIndexChanged" runat="server" Rows="1"></asp:ListBox>
                            <p>
                                <asp:RequiredFieldValidator runat="server"
                                    ControlToValidate="CBox"
                                    ErrorMessage="Class Is Required"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <asp:Button runat="server" CausesValidation="true" ID="calBtn" OnClick="calBtn_Click" class="btn btn-warning btn-fill btn-wd" Text="View Calendar" type='submit'></asp:Button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="card card-calendar">
                        <div class="content">
                            <div id="fullCalendar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="../assets/js/jquery.min.js" type="text/javascript"></script>

    <!--  Forms Validations Plugin -->
    <script src="../assets/js/jquery.validate.min.js"></script>

    <!--  Plugin for Date Time Picker and Full Calendar Plugin-->
    <script src="../assets/js/moment.min.js"></script>

    <!--  Date Time Picker Plugin is included in this js file -->
    <script src="../assets/js/bootstrap-datetimepicker.js"></script>

    <!--  Select Picker Plugin -->
    <script src="../assets/js/bootstrap-selectpicker.js"></script>

    <!--  Checkbox, Radio, Switch and Tags Input Plugins -->
    <script src="../assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>

    <!--  Charts Plugin -->
    <script src="../assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="../assets/js/bootstrap-notify.js"></script>

    <!-- Sweet Alert 2 plugin -->
    <script src="../assets/js/sweetalert2.js"></script>

    <!-- Vector Map plugin -->
    <script src="../assets/js/jquery-jvectormap.js"></script>

    <!--  Google Maps Plugin    -->
    <script src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Wizard Plugin    -->
    <script src="../assets/js/jquery.bootstrap.wizard.min.js"></script>

    <!--  Bootstrap Table Plugin    -->
    <script src="../assets/js/bootstrap-table.js"></script>

    <!--  Plugin for DataTables.net  -->
    <script src="../assets/js/jquery.datatables.js"></script>

    <!--  Full Calendar Plugin    -->
    <script src="../assets/js/fullcalendar.min.js"></script>

    <!-- Light Bootstrap Dashboard Core javascript and methods -->
    <script src="../assets/js/light-bootstrap-dashboard.js"></script>

    <!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
    <script src="../assets/js/demo.js"></script>

</asp:Content>
