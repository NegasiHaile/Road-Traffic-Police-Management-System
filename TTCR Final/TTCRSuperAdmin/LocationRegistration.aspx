<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="LocationRegistration.aspx.cs" Inherits="TTCRSuperAdmin_LocationRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" style="padding: 20px 1px;">
        <div>

            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-md-9">

                        <div>
                            <div class="alert alert-danger" runat="server" id="divLocationRegistrationError">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span class="fa fa-exclamation-triangle"></span>
                                <span runat="server" id="spnLocationRegistrationError">This is a regular notification made with ".alert-primary"</span>
                            </div>

                            <div class="alert alert-success" runat="server" id="divLocationRegistrationSuccess">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span class="fa fa-exclamation-triangle"></span>
                                <span runat="server" id="spnLocationRegistrationSuccess">This is a regular notification made with ".alert-primary"</span>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header ">
                                <header class="card-header">
                                    <a href="ListOfLocations.aspx" class="float-right btn btn-outline-primary mt-1"><i class="fa fa-list"></i>Go to List </a>
                                    <p class="card-title mt-2">Add NeW Locations Here</p>
                                </header>
                            </div>
                            <hr />
                            <article class="card-body">
                                <div class="form-row">
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                            <label>under which branch?</label>

                                            <asp:DropDownList ID="ddlLocationBranch" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                                <asp:ListItem Selected="true" disabled>Select location branch</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6 px-1">
                                        <div class="form-group">
                                            <label>Location unique Name</label>
                                            <asp:TextBox ID="tbLocationName" class="form-control" runat="server" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Location Addtional Address (Information)</label>
                                    <asp:TextBox ID="tbLocationAddtionalInfo" TextMode="MultiLine" Rows="2" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <!-- form-group end.// -->

                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <asp:Button ID="btnregisterLocation" type="submit" class="btn btn-primary btn-block" runat="server" Text="Register" OnClick="btnregisterLocation_Click" OnClientClick="return confirm('The detail in the form is about to save to the database?');" />
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
                    <!-- col.//-->

                </div>
                <!-- row.//-->


            </div>



        </div>
    </div>
</asp:Content>

