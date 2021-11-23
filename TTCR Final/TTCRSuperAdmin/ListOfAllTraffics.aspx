<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="ListOfAllTraffics.aspx.cs" Inherits="TTCRSuperAdmin_ListOfAllTraffics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" >

        <div class=" justify-content-center">
            <div class="row">


                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h6>Total Number of traffics: <span runat="server" id="NoTotalTrafficsInZone" class="pull-right" style="color: blue;">0</span></h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span class="contenttextfont" >* Number of Branch Officers : <span runat="server" id="NoHeadOfficers" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont" >* Number of Crime Identfier : <span runat="server" id="NoCrimeIdentfier" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont" >* Number of Branch Technical : <span runat="server" id="NoTechnical" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont" >* Number of Out offices workers : <span runat="server" id="NoOutOffice" class="pull-right singleValue">0</span></span> 
                            <br />
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 ">
                    <div class="card">
                        <div class="card-body">
                            <h6>Traffics with no responsibility (Unassined Traffics) : <span runat="server" id="NoOfNone_WorkerTraficsInZone" class="pull-right" style="color: blue;">0</span></h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span class="contenttextfont" >* Branch unassined Employees : <span runat="server" id="No_of_BranchUnassineg" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont">* Responsibility Unassined Employees : <span runat="server" id="NoResponsibiltyUnassineg" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont" >* Both branch & Responsibility unassined : <span runat="server" id="NoBothUnassineg" class="pull-right singleValue">0</span></span> 
                            <br />
                            <span class="contenttextfont" >* Accounts In OFF (Inactive) Status : <span runat="server" id="NoOffAccounts" class="pull-right singleValue">0</span></span> 
                            <br />
                            <%--<span>* On Accounts :</span> <span runat="server" id="Span5" class="pull-right singleValue">0</span>
                            <br />--%>
                        </div>
                    </div>
                </div>
               <%-- <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <h6> Responsbility unassigned traffics : <span runat="server" id="Span5" class="pull-right sum"></span></h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span>* Head Officers :</span> <span runat="server" id="Span6" class="pull-right singleValue">0</span>
                            <br />
                            <span>* Vice Officers:</span> <span runat="server" id="Span7" class="pull-right singleValue">0</span>
                            <br />
                            <span>* Out of offices:</span> <span runat="server" id="Span8" class="pull-right singleValue">0</span>
                            <br />
                        </div>
                    </div>
                </div>--%>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card strpied-tabled-with-hover">
                        
                            <header class="card-header">
                                <a href="TrafficRegistration.aspx" class="float-right btn btn-outline-success mt-1"><i class="fa fa-plus"></i>Add New </a>
                                <h6 class="card-title mt-2">All list of registered Traffics</h6>
                            </header>

                        
                        <hr class="btn-secondary" />
                        <div class="card-body table-full-width table-responsive">
                            <table id="example" class="table table-hover text-sm-left" style="width: 100%; font-size: small;">
                                <thead style="background-color: #333;">
                                    <tr >

                                        <th>ID</th>
                                        <th>Full_Name</th>
                                        <th>Phone_No</th>
                                        <th>Proff-Name</th>
                                        <th>Branch</th>
                                        <th>Responsiblity</th>
                                       <%-- <th>Delete</th>--%>
                                        <th >Detail</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <asp:Repeater ID="rptrAllTraffics" runat="server">
                                        <ItemTemplate>

                                            <tr>
                                                <td><%# Eval("EplyID") %></td>
                                                <td><%# Eval("FName") %> <%# Eval("MName") %></td>
                                                <td><%# Eval("Phone_No") %></td>
                                                <td><%# Eval("Proff_Name") %></td>
                                                <td><%# Eval("Branch") %></td>
                                                <td><%# Eval("Responsibility") %></td>
                                                <%--<td>
                                                    <a href="DeleteObjects.ashx?Phone_No=<%# Eval("Phone_No") %>" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
                                                </td>--%>
                                                <td>
                                                    <a href="TrafficsDetail.aspx?Phone_No=<%# Eval("Phone_No") %>">See Detail</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Full Name</th>
                                        <th>Phone No</th>
                                        <th>Proff-Name</th>
                                        <th>Branch</th>
                                        <th>Responsiblity</th>
                                      <%--  <th>Delete</th>--%>
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

