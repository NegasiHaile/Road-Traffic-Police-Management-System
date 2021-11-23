<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="ListOfTaxiOwners.aspx.cs" Inherits="TTCRSuperAdmin_ListOfTaxiOwners" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
        <div class="container-fluid">
            <div class="row justify-content-center" style="border-radius: 5px;">
                <div class="MyCard table-full-width table-responsive">
                        <header class="card-header mb-1" >
                            <h6 class="card-title mt-2" style="text-align: center">List of all taxi owners</h6>
                        </header>
                    <table id="example" class="table  table-hover" style="width: 100%; font-size: small;">
                        <thead class="thead-dark">
                            <tr>
                                <th>No #</th>
                                <th>Full Name </th>
                                <th>Phone Number</th>
                                <th>Telephone</th>
                                <th>Emaile</th>
                                <th>Trade License</th>
                                <th>Detail</th>
                            </tr>
                        </thead>

                        <tbody>
                            <asp:Repeater ID="rptrAllTaxiOwners" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("Owner_id") %></td>
                                        <td><%# Eval("FName") %> <%# Eval("MName") %></td>
                                        <td><%# Eval("Phone_No") %></td>
                                        <td><%# Eval("Tellephone") %></td>
                                        <td><%# Eval("Email") %></td>
                                        <td>Renewed</td>
                                        <td>
                                            <a href="TaxiOwnerDetail.aspx?Phone_No=<%# Eval("Phone_No") %>"><i class="fa fa-list" title="See Detail of this owner"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>


                        </tbody>
                        <tfoot class="thead-dark">
                            <tr>
                                <th>No #</th>
                                <th>Full Name </th>
                                <th>Phone Number</th>
                                <th>Telephone</th>
                                <th>Trade License</th>
                                <th>Emaile</th>
                                <th>Detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

