<%@ Page Title="" Language="C#" MasterPageFile="~/TTCROwnerArea/OwnerArae.master" AutoEventWireup="true" CodeFile="ListOfmytaxis.aspx.cs" Inherits="TTCROwnerArea_ListOfmytaxis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">


    <div class="content" style="padding: 20px 5px;">
        <div class="row justify-content-center">

            <div class="col-md-8">
                <div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <header class="card-header">
                            <p class="card-title mt-2" style="text-align: center">List of your taxis </p>
                        </header>

                    </div>
                    <hr class="btn-primary" />
                    <div class="card-body table-full-width table-responsive">
                        <table id="example" class="table table-striped" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate #</th>
                                    <th>Driver Phone</th>
                                    <th>Plate Status</th>
                                    <th>Status</th>
                                    <th>Detail</th>
                                </tr>
                            </thead>

                            <tbody>
                                <asp:Repeater ID="rptrMyTaxis" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id") %></td>
                                            <td>
                                                <a href="TaxiDetailToOwner.aspx?Plate=<%# Eval("Plate") %>" title="See libre of the taxi"><span runat="server" id="Span1"><%# Eval("Plate") %></span></a>
                                            </td>
                                            <td>
                                            <a href="DriverDetaileToOwner.aspx?Phone_No=<%# Eval("Driver_Phone") %>" title="See Detail of the Driver"><span runat="server" id="spntaxidriverPhone"><%# Eval("Driver_Phone") %></span></a>
                                            </td>
                                            <td>Renewed</td>
                                            <td><%# Eval("taxi_Status") %></td>
                                            <td>
                                                <a href="TaxiDetailToOwner.aspx?Plate=<%# Eval("Plate") %>"><i class="fa fa-list" title="See Record history of this Taxi"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate #</th>
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

</asp:Content>

