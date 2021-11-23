<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="ListOfLocations.aspx.cs" Inherits="TTCRSuperAdmin_ListOfLocations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="content">
        <div class="container-fluid">
            <div class="row justify-content-center" style="border-radius: 5px;">
                <div class="MyCard table-full-width table-responsive">
                    <header class="card-header mb-1">
                        <a href="LocationRegistration.aspx" class="float-right btn btn-outline-success mt-1"><i class="fa fa-plus"></i>Add New </a>
                        <h6 class="card-title mt-2"> list of The Whole Locations </h6>
                    </header>
                    <table id="example" class="table  table-hover" style="width: 100%; font-size: small;">
                        <thead class="thead-dark">
                            <tr>

                                <th>ID</th>
                                <th>Branch</th>
                                <th>Location name</th>
                                <th>Delete</th>
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
                                            <a href="DeleteLocation.ashx?Id=<%# Eval("Id") %>" style="color: orangered" onclick="return confirm('Are you sure you are about to delete this location permanently?');"><i class="fa fa-trash" title="Delete this location."></i></a>
                                            <%-- <a href="TrafficsDetail.aspx?Phone_No=<%# Eval("Id") %>"><i class="fa fa-edit" title="Edit this location"></i></a>--%>
                                            
                                        </td>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                        <tfoot class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Branch</th>
                                <th>Location name</th>
                                <th>Delete</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

