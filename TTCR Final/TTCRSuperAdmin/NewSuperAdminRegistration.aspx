<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="NewSuperAdminRegistration.aspx.cs" Inherits="TTCRSuperAdmin_NewSuperAdminRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content" style="padding: 20px 1px;">
        <div>
             <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-7">
                        <div class="card">
                           <div class="border-bottom card-body text-center">Add New Super Administrator here!</div>
                            <article class="card-body">
                                <div class="form-row">
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                            <label>EmailAddress </label>
                                        <asp:TextBox ID="tbSuperAdminEmail" class="form-control" runat="server" placeholder="Email" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                           <label>Phone number</label>
                                        <asp:TextBox ID="tbSuperAdminPhone" TextMode="Number" class="form-control" runat="server" placeholder="Phone number" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                           <label>First name </label>
                                        <asp:TextBox ID="tbSuperAdminPassword" TextMode="Password" class="form-control"  runat="server" placeholder="Create Password" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                            <label>Retype Password</label>
                                        <asp:TextBox ID="tbSuperAdminRepeatpassword" TextMode="Password" class="form-control" runat="server" placeholder="Retype password" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                    <!-- form-group end.// -->
                                
                                <!-- form-row end.// -->
                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <asp:Button ID="btnRegisterSuperAdmin" class="btn btn-primary btn-block" runat="server" Text="Register" OnClick="btnRegisterSuperAdmin_Click" />
                                   
                                </div>
                            </article>
                            <!-- card-body end .// -->
                            <div class="border-top card-body text-center">Have an account? <a href="">Log In</a></div>
                        </div>
                        <!-- card.// -->
                    </div>
                    <!-- col.//-->
                  
                     
                    <div class="MyCard table-full-width table-responsive col-10">
                         <div class="border-bottom card-body text-center"> <h3>List of the registered Super admins!</h3></div>
                        <table id="example" class="table table-striped table-bordered" style="width: 100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Phone No</th>
                                    <th>Account Status</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>

                            <tbody>
                                
                                <asp:Repeater ID="rptrAllSupers" runat="server">
                                    <ItemTemplate>

                                        <tr>
                                            <th><%# Eval("Account_ID") %></th>
                                            <th><%# Eval("Email") %></th>
                                            <th><%# Eval("Phone_No") %></th>
                                            <th><%# Eval("Account_Status") %></th>
                                            <td>
                                                <a href="DeleteObjects.ashx?Phone_No=<%# Eval("Phone_No") %>"><i class="fa fa-trash" title="Delete this Admin"></i></a>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Email</th>
                                    <th>Phone No</th>
                                    <th>Account Status</th>
                                    <th>Delete</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                </div>
                <!-- row.//-->


            </div>



        </div>
    </div>
</asp:Content>

