<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="EditBranch.aspx.cs" Inherits="TTCRSuperAdmin_EditBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" style="padding: 20px; 2px;">
        <div class="container" style="padding: 20px 5px;">
            <div class="row justify-content-center">
                <div class="col-md-7">
                    <div class="row justify-content-center">
                        <a href="ListOfBranchs.aspx" class="btn  mt-1" title="Back To List"><i class="fa fa-backward"></i>Back To List</a>
                    </div>
                    <div class="card">
                        <%--  Alert Messages are Here--%>
                        <div>
                            <div class="alert alert-success" runat="server" id="divBranchRegistrationSuccess">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span runat="server" id="spnBranchRegistrationSuccess">This is a regular notification made with ".alert-primary"</span>
                            </div>

                            <div class="alert alert-danger" runat="server" id="divBranchRegistrationError">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span runat="server" id="spnBranchRegistrationError">This is a regular notification made with ".alert-primary"</span>
                            </div>
                        </div>
                        <%--  Alert Messages Ends Here--%>
                        <p class="mt-2 text-center"><i class="fa fa-edit"></i>You are Editting <span style="text-transform: uppercase; color: blue;" id="spnBranchName" runat="server"> We</span> Branch.</p>
                            <hr />
                        <article class="card-body">
                            

                            <div class="form-group">
                                <label>Branch Unique name</label>
                                <asp:TextBox ID="tbBranchName" runat="server" class="form-control" required="required"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Branch Telelphone</label>
                                <asp:TextBox ID="tbbranchtellephone" onkeypress="return onlyNumberKey(event)"  maxlength="13"  size="50%" runat="server" class="form-control" required="required"></asp:TextBox>
                                
                            </div>
                            <!-- form-group end.// -->

                            <!-- form-group end.// -->
                            <div class="form-group">
                                <asp:LinkButton ID="lbtnupdateBranch" CssClass="btn btn-primary btn-block" runat="server" OnClick="lbtnupdateBranch_Click1" OnClientClick="return ConfirmationForUpdate();" > <i class="fa fa-edit"></i> Update</asp:LinkButton>
                            </div>
                            <!-- form-group// -->


                        </article>
                        <!-- card-body end .// -->
                        <div class="border-top card-body text-center">
                            <small class="text-muted">Do you went to assign workers for this new branch? <a href="#">Assign Workers</a></small>

                        </div>
                    </div>
                    <!-- card.// -->
                </div>

            </div>
        </div>
    </div>
</asp:Content>

