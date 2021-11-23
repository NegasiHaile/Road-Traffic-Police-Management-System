<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="OwnerDetail.aspx.cs" Inherits="TTCRTrafficArea_OwnerDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content">
        <div class="justify-content-center">
                
            
            <div class=" row col-md-12">
                <div class="col-md-7">
                    <div class="card">
                    <header class="card-header">
                        <asp:LinkButton ID="LbtnEnableOwnerDetailEditing" runat="server" class="float-right btn btn-outline-primary mt-1" title="Enable Owner editing" OnClick="LbtnEnableOwnerDetailEditing_Click"><i class="fa fa-edit"></i></asp:LinkButton>
                        <h6 class="card-title mt-2">You can edit the owner detail by clicking
                            <br />
                            the  edit icon on the right corner.</h6>
                    </header>
                    <hr />

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
                            <div class="form-group col-md-4">
                                <label>Phone number</label>
                                <asp:TextBox ID="tbOwnerPhone" class="form-control" MaxLength="10" onkeypress="return onlyNumberKey(event)" runat="server" required="required"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <label>tellephone Number</label>
                                <asp:TextBox ID="tbOwnerTellephone" class="form-control" MaxLength="13" onkeypress="return onlyNumberKey(event)" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Gender</label>
                                <asp:DropDownList ID="ddlOwnerGender" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>


                        <div class="form-row">
                            <div class="form-group col-md-7">
                                <label>Email address</label>
                                <asp:TextBox ID="tbOwnerEmail" class="form-control" runat="server"></asp:TextBox>
                                <small class="form-text text-muted">This email is neccessary to update the phone #.</small>
                            </div>

                            <div class="form-group col-md-5" id="divTradelicense" runat="server">
                                <label>Trade Licens (In Image)</label>
                                <asp:FileUpload ID="fupldOwnerTradeLicens" CssClass="form-control" runat="server" />
                                <small class="form-text text-muted">This trade licens must be transportation license.</small>
                            </div>
                        </div>

                        <div class="form-row" id="divButtonUpdatedetail" runat="server">
                            <div class="form-group col-md-12">
                        <asp:LinkButton ID="LbtnUpdateOwnerDetail" runat="server" class="btn btn-primary btn-block" OnClick="LbtnUpdateOwnerDetail_Click" > <i class="fa fa-edit"></i> Update Profile </asp:LinkButton>

                            </div>
                        </div>
                    </article>
                    <!-- card-body end .// -->
                    <%--<div class="border-top card-body text-center">
                        <small class="text-muted">By clicking the 'view List' button, you can see the list of traffics that have registered.</small>
                    </div>--%>
                </div>
                </div>
               
                <div class="col-md-5">
                    <div class="card">
                            <header class="card-header">
                                <p class="card-title float-lg-right" style="font-size: 12px;">
                                    Number of Taxis With this Owner = <span style="color: orangered" id="spnRecordesOnThisLocation" runat="server">3</span>
                                </p>

                                <h5 class="text-uppercase">List of taxis with Owner</h5>
                            </header>
                        <hr class="btn-primary" />

                        <div class="card-body table-full-width table-responsive">
                            <table class="table table-hover text-sm-left" style="width: 100%; font-size: small;">
                                <thead style="background-color: #333;">
                                    <tr>
                                        <th>No</th>
                                        <th>Plate</th>
                                        <th>Level</th>
                                        <th>Color</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:Repeater ID="rptrListOfTaxisPerOwner" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("Id") %></td>
                                            <td>
                                                <a href="TaxiDetail.aspx?Plate=<%# Eval("Plate") %>" title="See libre of the taxi"><span runat="server" id="Span1"><%# Eval("Plate") %></span></a>
                                            </td>
                                                <td><%# Eval("Level") %></td>
                                                <td><%# Eval("Color") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>No</th>
                                        <th>Plate</th>
                                        <th>Level</th>
                                        <th>Color</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

                <div class="col-md-12">
                    <header class="header">
                        <h4 class="header-title"> Tarade license</h4>
                    </header>
                <div class="img-container">
                    <img  class="img-thumbnail" src="../FileInImageForm.ashx?Phone_No=<%# OwnerPhone %>" />
                </div>
            </div>
        </div>

    </div>
</asp:Content>

