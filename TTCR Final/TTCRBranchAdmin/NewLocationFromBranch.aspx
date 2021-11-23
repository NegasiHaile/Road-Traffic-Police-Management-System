<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="NewLocationFromBranch.aspx.cs" Inherits="TTCRBranchAdmin_NewLocationFromBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content">

        <div>

            <div class="alert alert-success" runat="server" id="divTrafficRegistrationSuccess">
                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                    <i class="nc-icon nc-simple-remove"></i>
                </button>
                <span runat="server" id="spnLocationReisteredSuccesfuly"></span>
            </div>

            <div class="alert alert-warning" runat="server" id="divTrafficRegistrationErorr">
                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                    <i class="nc-icon nc-simple-remove"></i>
                </button>
                <span runat="server" id="spnLocationReisteredError"></span>
            </div>



            <div class="card">
                <article class="card-body">
                    <p class="text-center">Add New work area under this branch</p>
                    <hr />
                    <div class="form-row">
                        <div class="col-md-4 px-1">
                            <div class="form-group">
                                <label>under which branch?</label>

                                <asp:DropDownList ID="ddlLocationBranch" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4 px-1">
                            <div class="form-group">
                                <label>Location unique Name</label>
                                <asp:TextBox ID="tbLocationName" class="form-control" runat="server" required="required"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4 px-1">
                            <div class="form-group">
                                <label>Location Addtional Address (Information)</label>
                                <asp:TextBox ID="tbLocationAddtionalInfo" TextMode="MultiLine" Rows="1" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <!-- form-group end.// -->

                    <!-- form-group end.// -->
                    <div class="form-group">
                        <asp:Button ID="btnregisterLocation" type="submit" class="btn btn-primary btn-block" runat="server" Text="Register" OnClick="btnregisterLocation_Click" />
                    </div>
                    <!-- form-group// -->


                </article>
                <!-- card-body end .// -->
                <div class="border-top card-body text-center">
                    <small class="text-muted">Note: The branch  is about in which branch is this location going to be included.</small>

                </div>
            </div>
            <!-- card.// -->
        </div>
        <div class="card strpied-tabled-with-hover">
            <div class="card-body table-full-width table-responsive ml-1">
                <table id="example" class="table table-striped table-bordered" style="width: 100%; font-size: 13px;">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Branch Name</th>
                            <th>Location Name</th>
                            <th>Description</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptrBranchLocations" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("BranchName") %></td>
                                    <td><%# Eval("Loct_name") %></td>
                                    <td><%# Eval("Loca_info") %></td>
                                    <td>
                                        <a href="NewLocationFromBranch.aspx?Id=<%# Eval("Id") %>" onclick="return confirm('Are you sure to delete this location?')"><i class="fa fa-list" title="See Detail of this Branch"></i></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>


                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Branch Name</th>
                            <th>Location Name</th>
                            <th>Description</th>
                            <th>Delete</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

