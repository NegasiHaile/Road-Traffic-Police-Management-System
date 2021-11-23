<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="TaxiRegistration.aspx.cs" Inherits="TTCRSuperAdmin_TaxiRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="content" style="padding: 20px 1px;">
        <div class="row justify-content-center">

                <div class="col-12">
                    <div class="form-row">
                        <div class="col-6 ml-5">
                            <div class="form-group">
                                <label>Existing Owner</label>
                                <asp:DropDownList ID="ddlExisttingOwnersPhone" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                    <asp:ListItem Selected="true" disabled>Select Owner's Phone Number</asp:ListItem>

                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="form-group">
                                <label>.</label>
                                <asp:LinkButton ID="lbtnSearchOwner" class="btn btn-primary btn-block" runat="server" OnClick="lbtnSearchOwner_Click1">Search Owner</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>

            <div class="col-12">
                <div class="bs-example">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Carousel indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                    </ol>
                    <!-- Wrapper for carousel items -->

                    <%--<a class="carousel-control-prev" href="#" data-slide="prev">
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                    </a>--%>
                    <div class="carousel-inner">
                        <div class="carousel-item active" id="divOwnerDetailForm" runat="server">
                            <div class="container">
                                <br />
                                <div class="row justify-content-center">
                                    <div class="col-md-11">
                                        <div class="card">
                                            <%-- <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />--%>

                                            <header class="card-header">
                                                <a href="#myCarousel" data-slide="next">
                                                    <span class="float-right btn btn-outline-primary mt-1">Nexit <i class="fa fa-forward"></i></span>
                                                </a>
                                                <h4 class="card-title mt-2">First Fill the owner Detaile bellow.</h4>
                                            </header>


                                            <article class="card-body">

                                                <div class="form-row">
                                                    <div class="col-md-4 px-1">
                                                        <div class="form-group">
                                                            <label>Name</label>
                                                            <asp:TextBox ID="tbOwnerFName" MaxLength="20" onkeypress="return onlyLetterKey(event)" class="form-control" runat="server" required="required"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 px-1">
                                                        <div class="form-group">
                                                            <label>Father's name</label>
                                                            <asp:TextBox ID="tbOwnerMName" MaxLength="20" onkeypress="return onlyLetterKey(event)" class="form-control" runat="server" required="required"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 px-1">
                                                        <div class="form-group">
                                                            <label>grandfather's Name</label>
                                                            <asp:TextBox ID="tbOwnerLName" MaxLength="20" onkeypress="return onlyLetterKey(event)" class="form-control" runat="server" required="required"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Phone number</label>
                                                        <asp:TextBox ID="tbOwnerPhone" class="form-control" MaxLength="10" onkeypress="return onlyNumberKey(event)" runat="server" required="required" placeholder="This number must be on service!"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>tellephone Number</label>
                                                        <asp:TextBox ID="tbOwnerTellephone" class="form-control" MaxLength="13" onkeypress="return onlyNumberKey(event)" runat="server"></asp:TextBox>

                                                    </div>
                                                </div>


                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Email address</label>
                                                        <asp:TextBox ID="tbOwnerEmail" class="form-control" runat="server"></asp:TextBox>
                                                        <small class="form-text text-muted">This email is neccessary to update the phone #.</small>
                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>Trade Licens (In Image)</label>
                                                        <asp:FileUpload ID="fupldOwnerTradeLicens" CssClass="form-control" runat="server" />
                                                        <small class="form-text text-muted">This trade licens must be transportation license.</small>
                                                    </div>
                                                </div>

                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Gender </label>
                                                        <div class="ml-3">
                                                            <label class="form-check form-check-inline">
                                                                <asp:RadioButton ID="rbOwnerMale" class="form-check-input" runat="server" GroupName="gender" value="Male" />
                                                                <span class="form-check-label">Male </span>
                                                            </label>
                                                            <label class="form-check form-check-inline">
                                                                <asp:RadioButton ID="rbOwnerfemale" class="form-check-input" runat="server" GroupName="gender" value="Female" />
                                                                <span class="form-check-label">Female</span>
                                                            </label>
                                                        </div>

                                                    </div>

                                                    <div class="form-group col-md-6">
                                                        <label>Create password OR default (TTCR@123)</label>
                                                        <asp:TextBox ID="tbOwnerPassword" class="form-control" MaxLength="15" runat="server" required="required" Text="TTCR@123"></asp:TextBox>
                                                        <small class="form-text text-muted">Create password to the user.</small>
                                                    </div>
                                                </div>

                                                <%-- <div class="form-group col-12">
                                                    <div class="form-group">
                                                        <a href="#myCarousel" data-slide="next">
                                                            <asp:Button ID="btnSaveAllTaxiAndOwnerDetail" class="btn btn-primary btn-block" runat="server" Text="Hold the data and Nexit" />
                                                        </a>

                                                    </div>
                                                </div>--%>
                                            </article>
                                            <!-- card-body end .// -->
                                            <div class="border-top card-body text-center">
                                                <small class="text-muted">By clicking the 'view List' button, you can see the list of traffics that have registered.</small>
                                            </div>
                                        </div>
                                        <!-- card.// -->
                                    </div>
                                    <!-- col.//-->

                                </div>
                                <!-- row.//-->


                            </div>
                        </div>



                        <div class="carousel-item">
                            <div class="content" style="padding: 20px 1px;">
                                <div class="container-fluid">

                                    <div>
                                        <br />
                                        <div class="row justify-content-center">
                                            <div class="col-md-11">
                                                <div class="card">

                                                    <header class="card-header">
                                                        <a href="#myCarousel" data-slide="prev">
                                                            <span class="float-left btn btn-outline-primary mt-1"><i class="fa fa-backward"></i>Prevous</span>
                                                        </a>

                                                        <h4 class="card-title mt-2 float-right">Now Fill the Taxi Detaile also.</h4>
                                                    </header>


                                                    <article class="card-body">

                                                        <div class="form-row">
                                                            <div class="col-md-4 px-1">
                                                                <div class="form-group">
                                                                    <label>Plate number</label>
                                                                    <asp:TextBox ID="tbTaxiPlateNumber" class="form-control" runat="server" required="required"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 px-1">
                                                                <div class="form-group">
                                                                    <label>Taxi Type (Taxi)</label>
                                                                    <asp:DropDownList ID="ddltaxiType" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                                                        <asp:ListItem Selected="true" disabled>Select Type of Taxi</asp:ListItem>
                                                                        <asp:ListItem>type A</asp:ListItem>
                                                                        <asp:ListItem>type B</asp:ListItem>
                                                                        <asp:ListItem>type C</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4 px-1">
                                                                <div class="form-group">
                                                                    <label>Taxi Level (1, 2, 3)</label>
                                                                    <asp:DropDownList ID="ddlTaxiLevel" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                                                        <asp:ListItem Selected="true" disabled>Select Level</asp:ListItem>
                                                                        <asp:ListItem>Level 1</asp:ListItem>
                                                                        <asp:ListItem>Level 2</asp:ListItem>
                                                                        <asp:ListItem>Level 3</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>

                                                        </div>

                                                        <div class="form-row">
                                                            <div class="col-md-6 px-1">
                                                                <div class="form-group">
                                                                    <label>Taxi Level (1, 2, 3)</label>
                                                                    <asp:DropDownList ID="ddlTaxiColor" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                                                        <asp:ListItem Selected="true" disabled>Select Color</asp:ListItem>
                                                                        <asp:ListItem>Blue</asp:ListItem>
                                                                        <asp:ListItem>White</asp:ListItem>
                                                                        <asp:ListItem>Bule & White</asp:ListItem>
                                                                        <asp:ListItem>Yellow</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 px-1">
                                                                <div class="form-group">
                                                                    <label>Taxi File (Image)</label>
                                                                    <asp:FileUpload ID="fupldtaxiDetail" runat="server" CssClass="form-control" />
                                                                    <small class="form-text text-muted">A file about detail of the taxi in image.</small>
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="form-group col-12 form-inline">

                                                            <div class="form-group col-md-6">

                                                                <asp:Button ID="btnSaveAllTaxiAndOwnerDetail" class="btn btn-primary btn-block" runat="server" Text="Register New" OnClick="btnSaveAllTaxiAndOwnerDetail_Click" OnClientClick="return confirm('Are you sure about the detail, and save it all?');" />
                                                                <asp:Button ID="btnSaveAllTaxiAndOldOwnerDetail" class="btn btn-primary btn-block" runat="server" Text="Register Old" OnClick="btnSaveAllTaxiAndOldOwnerDetail_Click" OnClientClick="return confirm('Are you sure about the detail, and save it all?');"/>

                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <asp:LinkButton ID="btnCleanAllTaxiAndOwnerDetail" class="btn btn-warning btn-block" runat="server" OnClick="btnCleanAllTaxiAndOwnerDetail_Click" OnClientClick="return confirm('Are you sure you want to clean all the fields?');"> <span class="fa fa-eraser"></span> Clean All</asp:LinkButton>

                                                            </div>
                                                        </div>
                                                    </article>
                                                    <!-- card-body end .// -->
                                                    <div class="border-top card-body text-center">
                                                        <small class="text-muted">By clicking the 'view List' button, you can see the list of traffics that are still now registered.</small>
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

                        </div>
                    </div>
                    <!-- Carousel controls -->

                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>

