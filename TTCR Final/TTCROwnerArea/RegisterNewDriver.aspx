<%@ Page Title="" Language="C#" MasterPageFile="~/TTCROwnerArea/OwnerArae.master" AutoEventWireup="true" CodeFile="RegisterNewDriver.aspx.cs" Inherits="TTCROwnerArea_RegisterNewDriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

    <div class="content" style="padding: 20px 5px;">

        <div class="row justify-content-center">
            <%--<div class="col-5 m-3">
                <p class="text-center" title="List of branchs are here."><span class="fa fa-3x fa-registered"></span></p>
            </div>--%>
            <div class="col-md-7">
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
                        <p class="text-center"><i class="fa fa-plus-circle"></i>ASssigne Driver to your taxi</p>
                        <hr />

                        <div class="form-group">
                            <label>License_No</label>
                            <asp:TextBox ID="tbLicense_No" runat="server" TextMode="Number" class="form-control" required="required"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Driver Name</label>
                            <asp:TextBox ID="tbDriver_Name"  runat="server" class="form-control" ></asp:TextBox>
                           <%-- <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="tbDriver_Name" ErrorMessage="Error" />--%>
                        </div>

                         <div class="form-group">
                            <label>Driver Ftehr'sname</label>
                            <asp:TextBox ID="tbDriver_Ftehrsname"  runat="server" class="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Driver Email</label>
                            <asp:TextBox ID="tbDriver_Email" TextMode="Email"  runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Driver Phone NUmber</label>
                            <asp:TextBox ID="tbDriverPhone" TextMode="Number"  runat="server" class="form-control" required="required"></asp:TextBox>
                        </div>

                        <div class="form-group">
                            <label>Driver license Card (In IMAGE)</label>
                            <asp:FileUpload ID="fuplDriverLicenseCard" runat="server" required ="required"/>
                        </div>

                        <div class="form-group">
                                <asp:DropDownList ID="dlTaxisperOwner" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                                <asp:ListItem Selected="true" disabled>To which taxi is this driver</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <!-- form-group end.// -->

                        <!-- form-group end.// -->
                        <div class="form-group">
                            <asp:Button ID="btnAddDriver" CssClass="btn btn-primary btn-block" runat="server" Text="Assigne" OnClick="btnAddDriver_Click" />
                        </div>

                        <!-- form-group// -->

                    </article>
                    <small class="text-muted">Defualt password for drivers is 'TTCR@Driver' Password is casesensitive.</small>
                </div>
                <!-- card.// -->
            </div>
        </div>

    </div>
</asp:Content>

