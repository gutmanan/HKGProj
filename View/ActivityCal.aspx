<%@ Page Title="" Language="C#" MasterPageFile="~/View/MasterPage.master" AutoEventWireup="true" CodeFile="ActivityCal.aspx.cs" Inherits="View_ActivityCal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="Server">
    <link href="<%= Page.ResolveUrl("~/assets/css/bootstrap.min.css")%>" rel="stylesheet" />

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="card card-calendar">
                        <div class="content">
                            <div id="fullCalendar" class="fc fc-ltr fc-unthemed">
                                <div class="fc-toolbar">
                                    <div class="fc-left">
                                        <h2>
                                            <asp:Literal runat="server" ID="year"></asp:Literal></h2>
                                    </div>
                                    <div class="fc-right">
                                        <div class="fc-button-group">
                                            <button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left"><span class="fc-icon fc-icon-left-single-arrow"></span></button>
                                            <button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right"><span class="fc-icon fc-icon-right-single-arrow"></span></button>
                                        </div>
                                        <button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right fc-state-disabled" disabled="disabled">today</button>
                                    </div>
                                    <div class="fc-center">
                                        <div class="fc-button-group">

                                            <button type="button" class="fc-agendaWeek-button fc-button fc-state-default fc-state-active">week</button>
                                        </div>
                                    </div>
                                    <div class="fc-clear"></div>
                                </div>
                                <div class="fc-view-container">
                                    <div class="fc-view fc-agendaWeek-view fc-agenda-view">
                                        <table>
                                            <thead class="fc-head">
                                                <tr>
                                                    <td class="fc-widget-header">
                                                        <div class="fc-row fc-widget-header" style="border-right-width: 1px; margin-right: 16px;">
                                                            <table>
                                                                <thead>
                                                                    <tr>
                                                                        <th class="fc-axis fc-widget-header" style="width: 41px"></th>
                                                                        <th class="fc-day-header fc-widget-header fc-sun">Sun</th>
                                                                        <th class="fc-day-header fc-widget-header fc-mon">Mon</th>
                                                                        <th class="fc-day-header fc-widget-header fc-tue">Tue</th>
                                                                        <th class="fc-day-header fc-widget-header fc-wed">Wed</th>
                                                                        <th class="fc-day-header fc-widget-header fc-thu">Thu</th>
                                                                        <th class="fc-day-header fc-widget-header fc-fri">Fri</th>
                                                                        <th class="fc-day-header fc-widget-header fc-sat">Sat</th>
                                                                    </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </thead>
                                            <tbody class="fc-body">
                                                <tr>
                                                    <td class="fc-widget-content">
                                                        <div class="fc-day-grid">
                                                            <div class="fc-row fc-week fc-widget-content" style="border-right-width: 1px; margin-right: 16px;">
                                                                <div class="fc-bg">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="fc-axis fc-widget-content" style="width: 41px"><span>all-day</span></td>
                                                                                <td class="fc-day fc-widget-content fc-sun fc-past" data-date="2017-07-23"></td>
                                                                                <td class="fc-day fc-widget-content fc-mon fc-past" data-date="2017-07-24"></td>
                                                                                <td class="fc-day fc-widget-content fc-tue fc-past" data-date="2017-07-25"></td>
                                                                                <td class="fc-day fc-widget-content fc-wed fc-past" data-date="2017-07-26"></td>
                                                                                <td class="fc-day fc-widget-content fc-thu fc-past" data-date="2017-07-27"></td>
                                                                                <td class="fc-day fc-widget-content fc-fri fc-today fc-state-highlight" data-date="2017-07-28"></td>
                                                                                <td class="fc-day fc-widget-content fc-sat fc-future" data-date="2017-07-29"></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="fc-content-skeleton">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="fc-axis" style="width: 41px"></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end  fc-draggable fc-resizable">
                                                                                    <div class="fc-content"><span class="fc-title">חוג קראטה</span></div>
                                                                                    <div class="fc-resizer fc-end-resizer"></div>
                                                                                </a></td>
                                                                                <td class="fc-event-container"><a class="fc-day-grid-event fc-h-event fc-event fc-start fc-end event-azure fc-draggable fc-resizable">
                                                                                    <div class="fc-content"><span class="fc-title">LBD Launch</span></div>
                                                                                    <div class="fc-resizer fc-end-resizer"></div>
                                                                                </a></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                                <td></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <hr class="fc-divider fc-widget-header">
                                                        <div class="fc-time-grid-container fc-scroller" style="height: 594px;">
                                                            <div class="fc-time-grid">
                                                                <div class="fc-bg">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="fc-axis fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-day fc-widget-content fc-sun fc-past" data-date="2017-07-23"></td>
                                                                                <td class="fc-day fc-widget-content fc-mon fc-past" data-date="2017-07-24"></td>
                                                                                <td class="fc-day fc-widget-content fc-tue fc-past" data-date="2017-07-25"></td>
                                                                                <td class="fc-day fc-widget-content fc-wed fc-past" data-date="2017-07-26"></td>
                                                                                <td class="fc-day fc-widget-content fc-thu fc-past" data-date="2017-07-27"></td>
                                                                                <td class="fc-day fc-widget-content fc-fri fc-today fc-state-highlight" data-date="2017-07-28"></td>
                                                                                <td class="fc-day fc-widget-content fc-sat fc-future" data-date="2017-07-29"></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <div class="fc-slats">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>12am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>1am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>2am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>3am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>4am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>5am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>6am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>7am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>8am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>9am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>10am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>11am</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>12pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>1pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>2pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>3pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>4pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>5pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>6pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>7pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>8pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>9pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>10pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"><span>11pm</span></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                            <tr class="fc-minor">
                                                                                <td class="fc-axis fc-time fc-widget-content" style="width: 41px"></td>
                                                                                <td class="fc-widget-content"></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                <hr class="fc-divider fc-widget-header" style="display: none;">
                                                                <div class="fc-content-skeleton">
                                                                    <table>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td class="fc-axis" style="width: 41px"></td>
                                                                                <td>
                                                                                    <div class="fc-event-container">
                                                                                        <a class="fc-time-grid-event fc-v-event fc-event fc-start fc-end event-orange fc-draggable fc-resizable" href="http://www.creative-tim.com/" style="top: 0px; bottom: -85.6px; z-index: 1; left: 0%; right: 0%;">
                                                                                            <div class="fc-content">
                                                                                                <div class="fc-time" data-start="12:00" data-full="12:00 AM"><span>12:00</span></div>
                                                                                                <div class="fc-title">Click for Google</div>
                                                                                            </div>
                                                                                            <div class="fc-bg"></div>
                                                                                            <div class="fc-resizer fc-end-resizer"></div>
                                                                                        </a><a class="fc-time-grid-event fc-v-event fc-event fc-start fc-end event-blue fc-draggable fc-resizable" style="top: 258.4px; bottom: -344.8px; z-index: 1; left: 0%; right: 0%;">
                                                                                            <div class="fc-content">
                                                                                                <div class="fc-time" data-start="6:00" data-full="6:00 AM"><span>6:00</span></div>
                                                                                                <div class="fc-title">Repeating Event</div>
                                                                                            </div>
                                                                                            <div class="fc-bg"></div>
                                                                                            <div class="fc-resizer fc-end-resizer"></div>
                                                                                        </a>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container"></div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container">
                                                                                        <a class="fc-time-grid-event fc-v-event fc-event fc-start fc-end  fc-draggable fc-resizable fc-short" style="top: 409.6px; bottom: -431.2px; z-index: 1; left: 0%; right: 0%;">
                                                                                            <div class="fc-content">
                                                                                                <div class="fc-time" data-start="9:30" data-full="9:30 AM - 10:00 AM"><span>9:30 - 10:00</span></div>
                                                                                                <div class="fc-title">אבד</div>
                                                                                            </div>
                                                                                            <div class="fc-bg"></div>
                                                                                            <div class="fc-resizer fc-end-resizer"></div>
                                                                                        </a>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container"></div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container">
                                                                                        <a class="fc-time-grid-event fc-v-event fc-event fc-start fc-end event-green fc-draggable fc-resizable" style="top: 452.8px; bottom: -539.2px; z-index: 1; left: 0%; right: 0%;">
                                                                                            <div class="fc-content">
                                                                                                <div class="fc-time" data-start="10:30" data-full="10:30 AM"><span>10:30</span></div>
                                                                                                <div class="fc-title">Meeting</div>
                                                                                            </div>
                                                                                            <div class="fc-bg"></div>
                                                                                            <div class="fc-resizer fc-end-resizer"></div>
                                                                                        </a>
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container"></div>
                                                                                </td>
                                                                                <td>
                                                                                    <div class="fc-event-container">
                                                                                        <a class="fc-time-grid-event fc-v-event fc-event fc-start fc-end fc-draggable fc-resizable" style="top: 820px; bottom: -971.2px; z-index: 1; left: 0%; right: 0%;">
                                                                                            <div class="fc-content">
                                                                                                <div class="fc-time" data-start="7:00" data-full="7:00 PM - 10:30 PM"><span>7:00 - 10:30</span></div>
                                                                                                <div class="fc-title">Birthday Party</div>
                                                                                            </div>
                                                                                            <div class="fc-bg"></div>
                                                                                            <div class="fc-resizer fc-end-resizer"></div>
                                                                                        </a>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
