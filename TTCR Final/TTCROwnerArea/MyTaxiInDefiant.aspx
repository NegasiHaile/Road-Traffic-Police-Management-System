<%@ Page Title="" Language="C#" MasterPageFile="~/TTCROwnerArea/OwnerArae.master" AutoEventWireup="true" CodeFile="MyTaxiInDefiant.aspx.cs" Inherits="TTCROwnerArea_MyTaxiInDefiant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
     <div class="content" style="padding: 20px 1px;">


        <div class="row justify-content-center">
            <div class="col-md-7">
        <div class="col-md-12">
            <div class="card strpied-tabled-with-hover">
                <div class="card-header ">
                    <header class="card-header">
                        <p class="card-title mt-2" style="text-align: center"> This of your taxi is just in deviants list, so you have to contact your driver. <span id="spnbranchname" runat="server"></span></p>
                    </header>

                </div>
                <hr class="btn-primary" />
                <div class="card-body table-full-width table-responsive">
                    <table id="example" class="table table-striped table-bordered" style="width: 100%">
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
    </div>
</asp:Content>

