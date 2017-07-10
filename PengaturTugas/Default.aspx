<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PengaturTugas._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href='Styles/fullcalendar.min.css' rel='stylesheet' />
    <link href='Styles/fullcalendar.print.min.css' rel='stylesheet' media='print' />
    <script src='Scripts/lib/moment.min.js'></script>
    <script src='Scripts/lib/jquery.min.js'></script>
    <script src='Scripts/fullcalendar.min.js'></script>
    <script>

        $(document).ready(function () {

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultDate: $('#calendar').fullCalendar('today'),
                navLinks: true, // can click day/week names to navigate views
                selectable: true,
                selectHelper: true,
                select: function (start, end) {
                    var title = prompt('Event Title:');
                    var eventData;
                    if (title) {
                        eventData = {
                            title: title,
                            start: start,
                            end: end
                        };
                        $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
                    }
                    $('#calendar').fullCalendar('unselect');
                },
                dayClick: function (date, jsEvent, view) {
                    window.open('EventList.aspx?date=' + date.format(), '_blank');
                },
                editable: true,
                eventLimit: true, // allow "more" link when too many events
                events: "/CalendarJSON.ashx"
                //events: [
                //    {
                //        title: 'All Day Event',
                //        start: '2017-05-01'
                //    },
                //    {
                //        title: 'Long Event',
                //        start: '2017-05-07',
                //        end: '2017-05-10'
                //    },
                //    {
                //        id: 999,
                //        title: 'Repeating Event',
                //        start: '2017-05-09T16:00:00'
                //    },
                //    {
                //        id: 999,
                //        title: 'Repeating Event',
                //        start: '2017-05-16T16:00:00'
                //    },
                //    {
                //        title: 'Conference',
                //        start: '2017-05-11',
                //        end: '2017-05-13'
                //    },
                //    {
                //        title: 'Meeting',
                //        start: '2017-05-12T10:30:00',
                //        end: '2017-05-12T12:30:00'
                //    },
                //    {
                //        title: 'Lunch',
                //        start: '2017-05-12T12:00:00'
                //    },
                //    {
                //        title: 'Meeting',
                //        start: '2017-05-12T14:30:00'
                //    },
                //    {
                //        title: 'Happy Hour',
                //        start: '2017-05-12T17:30:00'
                //    },
                //    {
                //        title: 'Dinner',
                //        start: '2017-05-12T20:00:00'
                //    },
                //    {
                //        title: 'Birthday Party',
                //        start: '2017-05-13T07:00:00'
                //    },
                //    {
                //        title: 'Click for Google',
                //        url: 'http://google.com/',
                //        start: '2017-05-28'
                //    }
                //]
            });

        });

    </script>

    <style>
        body {
            margin: 40px 10px;
            padding: 0;
            font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
            font-size: 14px;
        }

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }
    </style>

    <div id='calendar'></div>

</asp:Content>
