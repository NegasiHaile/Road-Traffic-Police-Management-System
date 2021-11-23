<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="BranchRegistration.aspx.cs" Inherits="TTCRSuperAdmin_BranchRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="content" style="padding: 20px 1px;">
        <div>
            <div class="container">

                <div class="row justify-content-center">
                    <div class="col-7 m-1">
                        <p class="text-center" title="List of branchs are here."><span class="fa fa-3x fa-eidt"></span></p>
                    </div>
                    <div class="col-md-7">
                        <div class="card">
                            <%--  Alert Messages are Here--%>

                            <%--  Alert Messages Ends Here--%>

                            <article class="card-body">

                                <header class="card-header">
                                    <a href="ListOfBranchs.aspx" class="float-right btn btn-outline-primary mt-1"><i class="fa fa-list"></i>Go to List </a>
                                    <p class="card-title mt-2"><i class="fa fa-plus-circle"></i>Add New Branch Here</p>
                                </header>

                                <hr />

                                <div class="form-group">
                                    <label>Branch Unique name</label>
                                    <asp:TextBox ID="tbBranchName" runat="server" MaxLength="25" class="form-control" required="required"></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <label>Branch Telelphone</label>
                                    <asp:TextBox ID="tbbranchtellephone" onkeypress="return onlyNumberKey(event)" MaxLength="13" size="50%" runat="server" class="form-control" required="required"></asp:TextBox>
                                </div>
                                <!-- form-group end.// -->

                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <asp:Button ID="btnAddBranch" CssClass="btn btn-primary btn-block" runat="server" Text="Open Branch" OnClick="btnAddBranch_Click" />
                                </div>
                                <!-- form-group// -->


                            </article>
                            <!-- card-body end .// -->
                            <div class="border-top card-body text-center">
                                <small class="text-muted">Do you went to assign workers for this new branch? <a href="ListOfAllTraffics.aspx">Assign Workers</a></small>

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

