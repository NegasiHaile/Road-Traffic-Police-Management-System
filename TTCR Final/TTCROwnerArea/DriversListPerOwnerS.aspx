 <%@ Page Title="" Language="C#" MasterPageFile="~/TTCROwnerArea/OwnerArae.master" AutoEventWireup="true" CodeFile="DriversListPerOwnerS.aspx.cs" Inherits="TTCROwnerArea_DriversListPerOwnerS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
  <div class="content" style="padding: 20px 5px;">
        <div class="row justify-content-center">

            <div class="col-md-8">
                <div class="card strpied-tabled-with-hover">

                    <div class="card-header ">
                        <header class="card-header">
                            <p class="card-title mt-2" style="text-align: center">List of Your Active drivers </p>
                        </header>
                    </div>

                    <hr class="btn-primary" />

                    <div class="card-body table-full-width table-responsive">
                        <table id="example" class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>License Number</th>
                                    <th>Full Name</th>
                                    <th>Driver Phone_No</th>
                                    <th>Taxi Palte</th>
                                    <th>Status</th>
                                    <th>Detail</th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:repeater id="rptrMyDrivers" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("license_Id") %></td>
                                            <td><%# Eval("Name") %> <%# Eval("mName") %></td>
                                            <td><%# Eval("Phone_No") %></td>
                                            <td><%# Eval("Taxi_Plate") %></td>
                                            <td><%# Eval("Driver_Status") %></td>
                                            <td>
                                                <a href="DriverDetaileToOwner.aspx?Phone_No=<%# Eval("Phone_No") %>"><i class="fa fa-list" title="See Detail of the Driver"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                     <th>License Number</th>
                                    <th>Full Name</th>
                                    <th>Driver Phone_No</th>
                                    <th>Taxi Palte</th>
                                    <th>Status</th>
                                    <th>Detail</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>


                </div>
            </div>

        </div>
        </div>
</asp:Content>

