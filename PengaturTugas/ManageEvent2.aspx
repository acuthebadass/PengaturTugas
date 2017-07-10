<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageEvent2.aspx.cs" Inherits="PengaturTugas.ManageEvent2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Pengatur Tugas</a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a runat="server" href="~/">Home</a></li>
     <%--                   <li><a runat="server" href="~/About">About</a></li>
                        <li><a runat="server" href="~/Contact">Contact</a></li>--%>
                        <li><a runat="server" href="~/ManageEvent2">Enter Event</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container body-content">
            <div class="container" style="padding-top: 100px;">
                <%--<form id="form1" runat="server" class="form-horizontal">--%>
                <div class="form-horizontal">

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Nomor:</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtTaskCode" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvTaskCode" runat="server" ControlToValidate="txtTaskCode" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Keterangan:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtTaskName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvTaskName" runat="server" ControlToValidate="txtTaskName" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Target:</label>
                            </div>
                            <div class="col-sm-6">
                                <input type="text" id="datepicker" runat="server" readonly="true">
                                
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>PIC:</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtPersonInCharge" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvPersonInCharge" runat="server" ControlToValidate="txtPersonInCharge" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Jeda Follow Up:</label>
                            </div>
                            <div class="col-sm-1">
                                <asp:TextBox ID="txtReminderInterval" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvReminderInterval" runat="server" ControlToValidate="txtReminderInterval" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvReminderInterval" runat="server" 
                                    ControlToValidate="txtReminderInterval" Type="Integer" Operator="DataTypeCheck" ErrorMessage="Harus angka bulat!" Display="Dynamic" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Tanda:</label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="txtTanda" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvTanda" runat="server" ControlToValidate="txtTanda" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Tanda Tangan:</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtTandaTangan" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Status:</label>
                            </div>
                            <div class="col-sm-1">
                                <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rvStatus" runat="server" ControlToValidate="txtStatus" ErrorMessage="Harus diisi!" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>Kode:</label>
                            </div>
                            <div class="col-sm-1">
                                <asp:TextBox ID="txtKode" runat="server" CssClass="form-control" MaxLength="1"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-3">
                                <label>FU:</label>
                            </div>
                            <div class="col-sm-3">
                                <asp:TextBox ID="txtFU" runat="server" CssClass="form-control" MaxLength="3"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:Button ID="btnSubmit" runat="server" Text="Masukkan Data" OnClick="btnSubmit_Click" CssClass="btn btn-default" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <asp:Literal ID="lblMsg" runat="server" Visible="false"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <%--  </form>--%>
                </div>
            </div>
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - </p>
            </footer>
        </div>
    </form>

    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="Content/jquery-ui-1.12.1/jquery-ui.css" />
    <script src="Scripts/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }).datepicker("setDate", new Date());
        });
    </script>
</body>
</html>
