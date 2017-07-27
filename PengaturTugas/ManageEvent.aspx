<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageEvent.aspx.cs" Inherits="PengaturTugas.ManageEvent" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <%--<form id="form1" runat="server" class="form-horizontal">--%>
        <div class="form-horizontal">

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Nomor:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtTaskCode" runat="server" CssClass="form-control"></asp:TextBox>
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
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Tanggal Target:</label>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" id="datepicker" runat="server">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Nama Petugas:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtPersonInCharge" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Jeda Follow Up:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtReminderInterval" runat="server" CssClass="form-control"></asp:TextBox>
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
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Tanda Tangan:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtTandaTangan" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-3">
                        <label>Status:</label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtStatus" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnSubmit" runat="server" Text="Masukkan Data" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
      <%--  </form>--%>
            </div>
    </div>

    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
        $(function () {
            $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
        });
    </script>
</asp:Content>

