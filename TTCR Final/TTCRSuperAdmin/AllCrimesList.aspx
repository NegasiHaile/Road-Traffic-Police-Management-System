<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="AllCrimesList.aspx.cs" Inherits="TTCRSuperAdmin_AllCrimesList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="table-full-width table-responsive">
                    <table id="example" class="table table-hover" style="width: 100%; font-size: small;">
                        <thead class="thead-dark">
                            <tr>
                                <th>Id</th>
                                <th>Driver_License_No</th>
                                <th>Purpose</th>
                                <th>Ammount_In_figure</th>
                                <th>Payment_Status</th>
                                <th>Date</th>
                                <th>Detail</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="rptrTheWholeRecords" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("Dirver_license_No") %></td>
                                        <td><%# Eval("Purpose") %></td>
                                        <td><%# Eval("Ammount_In_figure") %></td>
                                        <td><%# Eval("Payment_Status") %></td>
                                        <td><%# Eval("Date") %></td>
                                        <td>
                                            <a href="RecordDetailSlip.aspx?Id=<%# Eval("Id") %>"><span class="fa fa-list"></span></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot class="thead-dark">
                            <tr>
                                <th>Id</th>
                                <th>Driver_License_No</th>
                                <th>Purpose</th>
                                <th>Ammount_In_figure</th>
                                <th>Payment_Status</th>
                                <th>Date</th>
                                <th>Detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

