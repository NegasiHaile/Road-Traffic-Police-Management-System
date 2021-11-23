<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="ListOfTaxis.aspx.cs" Inherits="TTCRSuperAdmin_ListOfTaxis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="content">
        <div class="container-fluid">
            <div class="row justify-content-center" style="border-radius: 5px;">
                <div class="MyCard table-full-width table-responsive">
                    <header class="card-header mb-1">
                        <a href="TaxiRegistration.aspx" class="float-right btn btn-outline-success mt-1"><i class="fa fa-plus"></i>Add New </a>
                        <h6 class="card-title mt-2">List of taxis in Mekelle city</h6>
                    </header>
                    <table id="example" class="table  table-hover" style="width: 100%; font-size: small;">
                        <thead class="thead-dark">
                            <tr>

                                <th>ID</th>
                                <th>Plate #</th>
                                <th>Owner Full Name</th>
                                <th>Driver Phone</th>
                                <th>Plate Status</th>
                                <th>Status</th>
                                <th>Detail</th>
                            </tr>
                        </thead>

                        <tbody>
                            <asp:Repeater ID="rptrAllTaxis" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Id") %></td>
                                        <th><%# Eval("Plate") %></th>
                                        <td><%# Eval("FName") %> <%# Eval("MName") %></td>
                                        <td><%# Eval("Driver_Phone") %></td>
                                        <td>Renewed</td>
                                        <td><%# Eval("taxi_Status") %></td>
                                        <td>
                                            <a href="TaxiDetailToSuperAdmin.aspx?Plate=<%# Eval("Plate") %>" title="See Detail of this taxi"><i class="fa fa-list"></i><%# Eval("Plate") %></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Plate #</th>
                                <th>Owner Full Name</th>
                                <th>Driver Phone</th>
                                <th>Plate Status</th>
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
    </div>
</asp:Content>

