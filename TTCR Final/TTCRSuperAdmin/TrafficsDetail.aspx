 <%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="TrafficsDetail.aspx.cs" Inherits="TTCRSuperAdmin_TrafficsDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="content">

        <div class="row">

            <div class="col-12">
                <div class="alert alert-danger" runat="server" id="divTrafficRegistrationError">
                    <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                        <i class="nc-icon nc-simple-remove"></i>
                    </button>
                    <span runat="server" id="pEditingError">This is a regular notification made with ".alert-primary"</span>
                </div>
                <div class="alert alert-success" runat="server" id="divTrafficRegistrationSuccs">
                    <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                        <i class="nc-icon nc-simple-remove"></i>
                    </button>
                    <span runat="server" id="spnEditingSuccess">This is a regular notification made with ".alert-primary"</span>
                </div>
            </div>

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card card-user">
                            <div class="card-image">
                                <asp:Image ID="Image1" runat="server" src="../assets/img/full-screen-image-3.jpg" />
                            </div>

                            <div class="card-body">
                                <div class="author">

                                    <a class="text-uppercase text-primary">
                                        <img class="avatar border-gray" src="../ImageHandler.ashx?Phone_No=<%# Eval("Phone_No") %>" />
                                        <h5 class="title"><%# Eval("Proff_Name") %><span>-<%# Eval("FName") %> </span><span><%# Eval("MName") %></span> </h5>
                                        <%-- <h5 class="tim-note"><%# Eval("Proff_Name") %></h5>--%>
                                    </a>

                                </div>

                                <p class="description text-center">
                                    "<%# Eval("Responsibility") %> of
                                        <br />
                                    <%# Eval("Branch") %> Kifle Ketema
                                    <br />
                                    From Jan 2010 - still today"
                                </p>
                                <p class="description text-center">
                                    <span id="spnFileOfTraffic" runat="server"><a href="#divSkillCertification">Click Here</a> to get About '<%# Eval("Proff_Name") %> <%# Eval("FName") %>' </span>
                                </p>
                            </div>
                            <hr />

                            <div class="button-container mr-auto ml-auto">
                                <asp:LinkButton ID="LinkButton1" runat="server" href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-facebook-square"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton2" runat="server" href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-twitter"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" href="#" class="btn btn-simple btn-link btn-icon">
                                        <i class="fa fa-google-plus-square"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <div class="float-right">
                            <asp:LinkButton ID="lbAcctivateAccount" runat="server" class="btn btn-outline-primary" OnClick="lbAcctivateAccount_Click" title="Activate This Account"><i class="fa fa-eye"></i></asp:LinkButton>
                            <asp:LinkButton ID="lbDeactivateAccount" runat="server" class="btn btn-outline-danger" OnClick="lbDeactivateAccount_Click" title="Deactivate This Account"><i class="fa fa-deaf"></i></asp:LinkButton>
                            <asp:LinkButton ID="lbEnableTrafficDetailEditting" runat="server" class="btn btn-outline-success" OnClick="lbEnableTrafficDetailEditting_Click" title="Enable editing of detail"><i class="fa fa-edit"></i></asp:LinkButton>
                        </div>
                        <h6 class="card-title">You can edit this whole detail by clicking
                                    <br />
                            the edit icon on the right corner.</h6>
                    </div>

                    <div class="separator">
                        <hr />
                    </div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="tbTrafficFName" MaxLength="20" onkeypress="return onlyLetterKey(event)" name="tbNFName" runat="server" class="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" disabled="" placeholder="Company" value="Creative Code Inc.">--%>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Father's Name</label>
                                    <asp:TextBox ID="tbTrafficMName" MaxLength="20" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Grandfather's Name</label>
                                    <asp:TextBox ID="tbTrafficLName" MaxLength="20" onkeypress="return onlyLetterKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <asp:TextBox ID="tbTrafficPhoneNo" MaxLength="10" onkeypress="return onlyNumberKey(event)" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Emaile Address</label>
                                    <asp:TextBox ID="tbTrafficEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Gender</label>
                                    <asp:DropDownList ID="ddlTrafficGender" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true">Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-12 px-2">
                                <div class="form-group">
                                    <label>Proffesional Name</label>

                                    <asp:DropDownList ID="ddlTrafficProffName" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>Sellect the Proffesional Name</asp:ListItem>
                                        <asp:ListItem>Sagin</asp:ListItem>
                                        <asp:ListItem>Vice Sagin</asp:ListItem>
                                        <asp:ListItem>Assistant Sagin</asp:ListItem>
                                        <asp:ListItem>Konstabile</asp:ListItem>
                                        <asp:ListItem>Inspector</asp:ListItem>
                                        <asp:ListItem>Assistant Inspectore</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Brith Date (mm/dd/yyyy)</label>
                                    <asp:TextBox ID="tbTrafficBrithDate" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Branch</label>
                                    <asp:DropDownList ID="ddlTrafficsBranch" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>//// Not Assigned ////</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Responsibility</label>
                                    <asp:DropDownList ID="ddlResponsibility" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>//// No Responsibilty ////</asp:ListItem>
                                        <asp:ListItem>Branch Officer</asp:ListItem>
                                        <asp:ListItem>Techinical</asp:ListItem>
                                        <asp:ListItem>Crime Identifier</asp:ListItem>
                                        <asp:ListItem>Out Office</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 px-2">
                                <div class="form-group" id="divPhotoUpload" runat="server">
                                    <label>Photo (3X4)</label>
                                    <asp:FileUpload ID="fupldTrafficPhoto" runat="server" CssClass="form-control" required="require" />
                                </div>
                            </div>
                            <div class="col-md-6 px-2">
                                <div class="form-group" id="divFileUpload" runat="server">
                                    <label>Skill Certificate</label>
                                    <asp:FileUpload ID="fupldTrafficSkillCertificate" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </div>


                        <div class="form-row col-12 border-top mt-3">
                            <div class="col-md-12 px-2" id="divSaveNewDetail" runat="server">
                                <asp:LinkButton ID="lbSaveNewDetail" runat="server" class="btn btn-primary btn-block" OnClick="lbSaveNewDetail_Click"><i class="fa fa-save"></i> Update Profile</asp:LinkButton>
                                <%--<div class="clearfix"></div>--%>
                            </div>
                        </div>

                        <div class="form-row col-12 border-top">
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <div class="card strpied-tabled-with-hover">
            <div class="card-header ">
                <header class="card-header">
                    <h4 class="card-title mt-2 align-content-lg-center">Work history</h4>
                </header>

                <hr class="btn-primary" />
            </div>
            <div class="card-body table-full-width table-responsive">
                <table id="example" class="table-sm table-striped table-bordered" style="width: 100%; font-size: smaller;">
                    <thead>
                        <tr>
                            <th>Id #</th>
                            <th>Where? </th>
                            <th>Taxi plate</th>
                            <th>Amount</th>
                            <th>ምኽንያት</th>
                            <th>ዕልት</th>
                            <th>Detail</th>
                        </tr>
                    </thead>

                    <tbody>

                        <asp:Repeater ID="rptrListOfSingleTrafficWorkHistory" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("Id") %></td>
                                    <td><%# Eval("Loct_name") %> </td>
                                    <td><%# Eval("Plate_No") %></td>
                                    <td><%# Eval("Ammount_In_figure") %></td>
                                    <td><%# Eval("Purpose") %></td>
                                    <td><%# Eval("Date") %></td>
                                    <td>
                                        <a href="RecordDetailSlip.aspx?Id=<%# Eval("Id") %>"><span class="fa fa-list"></span></a>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Id #</th>
                            <th>Where? </th>
                            <th>Taxi plate</th>
                            <th>Amount</th>
                            <th>ምኽንያት</th>
                            <th>ዕልት</th>
                            <th>Detail</th>
                        </tr>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>


        <div class="img-container" id="divSkillCertification" runat="server">
            <div class="row justify-content-center">
                <h5>ናይ ሞያ መረጋገፂ ወረቐት</h5>
            </div>
            <img class="img-thumbnail" title="Skill Certificate Not Inserted ናይ ሞያ መረጋገፂ ወረቐት ኣየእተወን" src="../FileInImageForm.ashx?Phone_No=<%= OrginalPhoneNo %>" />
        </div>
    </div>

</asp:Content>

