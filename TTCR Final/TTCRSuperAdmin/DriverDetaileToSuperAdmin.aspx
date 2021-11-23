<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="DriverDetaileToSuperAdmin.aspx.cs" Inherits="TTCRSuperAdmin_DriverDetaileToSuperAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="content" >
        <div class="justify-content-center">
            <div class="alert alert-danger" runat="server" id="divnotaxiDriverMessage">
                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                <h5 class="text-center"> This Taxi has not Assigned a driver.</h5>
            
            </div>
            <div class="row">

                <asp:repeater runat="server" id="rptrDrirverDetail">
                 <ItemTemplate>
                     <div class="col-md-4">
                <%--<img class="img-thumbnail" width="600" src="../ImageHandler.ashx?Phone_No=0987654321" />--%>
                <img class="img-thumbnail" style="width:100%; " src="../ImageHandler.ashx?Phone_No=<%# Eval("Phone_No") %>" />
            </div>
                     </ItemTemplate>
            </asp:repeater>



                <div class="col-md-7" runat="server" id="divDriverDeatil">
                    <div class="card">
                        <%--  Alert Messages are Here--%>
                        <div class="m-4">
                            <div class="alert alert-success" runat="server" id="divDriverRegistrationSuccess">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span runat="server" id="spnDiverRegistrationSuccess">This is a regular notification made with ".alert-primary"</span>
                            </div>

                            <div class="alert alert-danger" runat="server" id="divDriverRegistrationError">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span runat="server" id="spnDroiverRegistrationError">This is a regular notification made with ".alert-primary"</span>
                            </div>
                        </div>
                        <%--  Alert Messages Ends Here--%>

                        <article class="card-body">

                            <div class="form-group">
                                <label>License_No</label>
                                <asp:textbox id="tbLicense_No" runat="server" textmode="Number" class="form-control" required="required"></asp:textbox>
                            </div>

                            <div class="form-group">
                                <label>Driver Name</label>
                                <asp:textbox id="tbDriver_Name" runat="server" class="form-control"></asp:textbox>
                                <%-- <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="tbDriver_Name" ErrorMessage="Error" />--%>
                            </div>

                            <div class="form-group">
                                <label>Driver Ftehr'sname</label>
                                <asp:textbox id="tbDriver_Ftehrsname" runat="server" class="form-control"></asp:textbox>
                            </div>

                            <%--<div class="form-group">
                                <label>Driver Email</label>
                                <asp:textbox id="tbDriver_Email" textmode="Email" runat="server" class="form-control"></asp:textbox>
                            </div>--%>
                            <div class="form-group">
                                <label>Driver Phone NUmber</label>
                                <asp:textbox id="tbDriverPhone" textmode="Number" runat="server" class="form-control" required="required"></asp:textbox>
                            </div>

                            <%--<div class="form-group">
                                <label>Driver license Card (In IMAGE)</label>
                                <asp:fileupload id="fuplDriverLicenseCard" runat="server" required="required" />
                            </div>--%>

                            <div class="form-group">
                                <asp:dropdownlist id="dlTaxisperOwner" cssclass="form-control" runat="server" datatextfield="CHOOSE" datavaluefield="BACK" required="required">
                                               
                            </asp:dropdownlist>
                            </div>
                            <!-- form-group end.// -->

                            <!-- form-group end.// -->
                            <div class="form-group">
                                <asp:button id="btnAddDriver" cssclass="btn btn-primary btn-block" runat="server" text="Assigne" />
                            </div>

                            <!-- form-group// -->

                        </article>
                        <small class="text-muted">You can edit the detail of the driver here.</small>
                    </div>
                    <!-- card.// -->
                </div>
            </div>
        </div>
    </div>
</asp:Content>

