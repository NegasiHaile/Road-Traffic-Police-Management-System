<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="ListOftaixs.aspx.cs" Inherits="TTCRTrafficArea_ListOftaixs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" style="padding: 20px 1px;">


        <div class="row justify-content-center">
            <div class="col-md-11">
                <%--<div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <header class="card-header">
                            <p class="card-title mt-2" style="text-align: center">List of taxis in this city</p>
                        </header>

                    </div>
                    <hr class="btn-primary" />
                    <div class="card-body table-full-width table-responsive">
                        <table id="example" class="table table-striped table-bordered" style="width: 100%">
                            <thead>--%>
                 <div class="card strpied-tabled-with-hover">
                        <div class="card-header ">
                            <header class="card-header">
                                <h6 class="card-title mt-2" style="text-align: center">List of taxis in this city</h6>
                            </header>

                            <hr />
                        </div>
                        <div class="card-body table-responsive">
                            <table id="example" class="table-sm table-striped table-bordered" style="width: 100%; font-size: smaller;">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate #</th>
                                    <th>Owner Full Name</th>
                                    <th>Driver ID</th>
                                    <th>Plate Status</th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="rptrAllTaxis" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id") %></td>
                                            <td><a href="TaxiDetail.aspx?Plate=<%# Eval("Plate") %>" title="See detail of the taxi with this plate"><%# Eval("Plate") %></a></td>
                                            <td><a href="OwnerDetail.aspx?Phone_No=<%# Eval("Phone_No") %>" title="See detail of this Owner"><%# Eval("FName") %> <%# Eval("MName") %></a></td>
                                            <td><a href="DriverDetail.aspx?Driver_Phone=<%# Eval("Driver_Phone") %>" title="See detail of this Driver"><%# Eval("Driver_Phone") %></a></td>
                                            <td>Renewed</td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate #</th>
                                    <th>Owner Full Name</th>
                                    <th>Driver ID</th>
                                    <th>Plate Status</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>

        </div>

        </div>
</asp:Content>

