<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="DeviantsList.aspx.cs" Inherits="TTCRTrafficArea_DeviantsList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content" style="padding: 20px 1px;">

        <div class="row justify-content-center">
            <div class="col-11">
                <div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <header class="card-header">
                            <h6 class="card-title mt-2" style="text-align: center">List of Deviants that you have take a focus! <span id="spnbranchname" runat="server"></span></h6>
                        </header>

                        <hr />
                    </div>
                    <div class="card-body table-responsive">
                        <table id="example" class="table-sm table-striped table-bordered" style="width: 100%; font-size: smaller;">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate</th>
                                    <th>Where (Branch)?</th>
                                    <th>Where (Location)?</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>

                            <tbody>

                                <asp:Repeater ID="rptrDeviatsInSearch" runat="server">
                                    <ItemTemplate>

                                        <tr>
                                            <td><%# Eval("Id") %></td>
                                            <td><%# Eval("Plate") %></td>
                                            <td><%# Eval("Branch") %></td>
                                            <td><%# Eval("Location") %></td>
                                            <td><%# Eval("Status") %></td>
                                            <td><%# Eval("DateTime") %></td>
                                            <td>
                                                <a href="DeviantFound.aspx?Id=<%# Eval("Id") %>"><i class="fa fa-edit" title="Edit if Defiant Found"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Plate</th>
                                    <th>Where (Branch)?</th>
                                    <th>Where (Location)?</th>
                                    <th>Status</th>
                                    <th>Date</th>
                                    <th>Edit</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

