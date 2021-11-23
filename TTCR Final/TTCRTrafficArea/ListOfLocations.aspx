<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="ListOfLocations.aspx.cs" Inherits="TTCRTrafficArea_ListOfLocations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" style="padding: 20px 1px;">


        <div class="row justify-content-center">
                <div class="col-11">


                    <div class="card strpied-tabled-with-hover">
                        <div class="card-header ">
                            <header class="card-header">
                                <h6 class="card-title mt-2 text-center">All list of Locations in <span id="spnbranchname" runat="server"></span></h6>
                            </header>

                            <hr />
                        </div>
                        <div class="card-body table-responsive">
                            <table id="example" class="table-sm table-striped table-bordered" style="width: 100%; font-size: smaller;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Branch</th>
                                        <th>Location name</th>
                                        <th>See Detail</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <asp:Repeater ID="rptrAllLocations" runat="server">
                                        <ItemTemplate>

                                            <tr>
                                                <td><%# Eval("Id") %></td>
                                                <td><%# Eval("BranchName") %></td>
                                                <td><%# Eval("Loct_Name") %></td>
                                                <td>
                                                    <a href="RecordsAtSpesficLocation.aspx?Id=<%# Eval("Id") %>"><i class="fa fa-list" title="See Detail of this Branch"></i></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>ID</th>
                                        <th>Branch</th>
                                        <th>Location name</th>
                                        <th>See Detail</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>

