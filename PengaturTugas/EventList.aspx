<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventList.aspx.cs" Inherits="PengaturTugas.EventList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event List</title>
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="../App_Themes/assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
        rel="stylesheet" />
    <link href="../App_Themes/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../App_Themes/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../App_Themes/assets/css/animate.min.css" rel="stylesheet" />
    <link href="../App_Themes/assets/css/style.min.css" rel="stylesheet" />
    <link href="../App_Themes/assets/css/style-responsive.min.css" rel="stylesheet" />
    <link href="../App_Themes/assets/css/theme/default.css" rel="stylesheet" id="theme" />
    <!-- ================== END BASE CSS STYLE ================== -->
    <!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
    <link href="../App_Themes/assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css"
        rel="stylesheet" />
    <link href="../App_Themes/assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css"
        rel="stylesheet" />
    <!-- ================== END PAGE LEVEL STYLE ================== -->
    <!-- ================== BEGIN BASE JS ================== -->
    <script src="../App_Themes/assets/plugins/pace/pace.min.js"></script>
    <!-- ================== END BASE JS ================== -->
    <style>
        .content {
            margin-left: 0px;
            padding: 20px 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-container" class="fade">
            <div id="content" class="content">
                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <h4 class="panel-title">Event List</h4>
                    </div>
                    <div class="panel-body">
                        <!-- begin row -->
                        <div class="row">
                            <!-- begin col-12 -->
                            <div class="col-md-12">
                                <asp:ListView ID="lstReport" runat="server" OnDataBinding="lstReport_DataBinding">
                                    <LayoutTemplate>
                                        <table id="data-table" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Nomor
                                                    </th>
                                                    <th>PIC
                                                    </th>
                                                    <th>Target
                                                    </th>
                                                    <th>Tanggal Dibuat
                                                    </th>
                                                    <th>Kode
                                                    </th>
                                                    <th>Keterangan
                                                    </th>
                                                    <th>FU
                                                    </th>
                                                    <th>Status
                                                    </th>
                                                    <th>Tanda Tangan
                                                    </th>
                                                    <%--<th>Jeda Follow Up
                                                    </th>
                                                    <th>Tanda
                                                    </th>--%>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id="ItemPlaceholder" runat="server">
                                                </tr>
                                            </tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="whiteRow">
                                                <%# Eval("TaskCode")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("PersonInCharge")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# FormatDateWithTime(Eval("TaskDueDate"))%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# FormatDateWithTime(Eval("CreatedDate"))%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("Kode")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("TaskName")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("FU")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("Status ")%>
                                            </td>
                                            <td class="whiteRow">
                                                <%# Eval("TandaTangan")%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        No data found
                                    </EmptyDataTemplate>
                                </asp:ListView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- ================== BEGIN BASE JS ================== -->
    <script src="../App_Themes/assets/plugins/jquery/jquery-1.9.1.min.js"></script>
    <script src="../App_Themes/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
    <script src="../App_Themes/assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
    <script src="../App_Themes/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!--[if lt IE 9]>
		<script src="../App_Themes/assets/crossbrowserjs/html5shiv.js"></script>
		<script src="../App_Themes/assets/crossbrowserjs/respond.min.js"></script>
		<script src="../App_Themes/assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
    <script src="../App_Themes/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../App_Themes/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
    <!-- ================== END BASE JS ================== -->
    <!-- ================== BEGIN PAGE LEVEL JS ================== -->
    <script src="../App_Themes/assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
    <script src="../App_Themes/assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
    <script src="../App_Themes/assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
    <script src="../App_Themes/assets/js/table-manage-default.demo.min.js"></script>
    <script src="../App_Themes/assets/js/apps.min.js"></script>
    <!-- ================== END PAGE LEVEL JS ================== -->
    <script>
        $(document).ready(function () {
            App.init();
            //TableManageDefault.init();

            var oTable = $('#data-table').dataTable({});
            //oTable.fnSort([[2, 'desc']]); //sort by action date
        });
	</script>
</body>
</html>
