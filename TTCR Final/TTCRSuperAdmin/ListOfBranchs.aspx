<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="ListOfBranchs.aspx.cs" Inherits="TTCRSuperAdmin_ListOfBranchs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                        
                <div class="MyCard table-full-width table-responsive">
                    <header class="card-header">
                            <a href="BranchRegistration.aspx" class="float-right btn btn-outline-success mt-1"><i class="fa fa-plus"></i>Add New </a>
                            <p class="card-title mt-2"><i class="fa fa-list-ul"></i>ዝርዝር ጨንፈራት ናይ ከተማ መቐለ ፓልስ ብሮ</p>
                        </header>
                    <table id="example" class="table  table-hover" style="width: 100%; font-size: medium;">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Branch Name</th>
                                <th>Tellephone</th>
                                <th>Edit</th>
                                <th>See Detail</th>
                            </tr>
                        </thead>

                        <tbody>

                            <asp:Repeater ID="rptrAllBranchs" runat="server">
                                <ItemTemplate>

                                    <tr>
                                        <td><%# Eval("Id") %></td>
                                        <td><%# Eval("BrancName") %></td>
                                        <td><%# Eval("BranchPhone") %></td>
                                        <td>
                                            <a href="EditBranch.aspx?Id=<%# Eval("Id") %>"><i class="fa fa-edit" title="Edit this Branch"></i></a>
                                        </td>
                                        <td>
                                            <a href="BranchDetail.aspx?BrancName=<%# Eval("BrancName") %>" style="color: green;"><i class="fa fa-expand" title="See Detail of this Branch"></i></a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                        <tfoot class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Branch Name</th>
                                <th>Tellephone</th>
                                <th>Edit</th>
                                <th>See Detail</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

