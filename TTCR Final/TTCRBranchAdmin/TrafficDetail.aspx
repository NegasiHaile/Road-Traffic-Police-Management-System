<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="TrafficDetail.aspx.cs" Inherits="TTCRBranchAdmin_TrafficDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">

        <div class="row justify-content-center">
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
                                    <span id="spnFileOfTraffic" runat="server"><a href="#divSkillCertification" >Click Here</a> to get About '<%# Eval("Proff_Name") %> <%# Eval("FName") %>' </span> 
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

                    <div class="card-body">

                        <div class="row">
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Name</label>
                                    <asp:TextBox ID="tbTrafficFName" name="tbNFName" runat="server" class="form-control"></asp:TextBox>
                                    <%--<input type="text" class="form-control" disabled="" placeholder="Company" value="Creative Code Inc.">--%>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Father's Name</label>
                                    <asp:TextBox ID="tbTrafficMName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Grandfather's Name</label>
                                    <asp:TextBox ID="tbTrafficLName" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3 px-2">
                                <div class="form-group">
                                    <label>Phone Number</label>
                                    <asp:TextBox ID="tbTrafficPhoneNo" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6 px-2">
                                <div class="form-group">
                                    <label>Emaile Address</label>
                                    <asp:TextBox ID="tbTrafficEmail" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-3 px-2">
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
                                    <label>Brith Date</label>
                                    <asp:TextBox ID="tbTrafficBrithDate" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Branch</label>
                                    <asp:DropDownList ID="ddlTrafficsBranch" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>Assign the Branch</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4 px-2">
                                <div class="form-group">
                                    <label>Responsibility</label>
                                    <asp:DropDownList ID="ddlResponsibility" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                        <asp:ListItem Selected="true" disabled>Resposibility?</asp:ListItem>
                                        <asp:ListItem>Branch Officer</asp:ListItem>
                                        <asp:ListItem>Vice Officer</asp:ListItem>
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
                            <div class="col-md-4 px-2">
                                <div class="form-group" id="divFileUpload" runat="server">
                                    <label>Skill Certificate</label>
                                    <asp:FileUpload ID="fupldTrafficSkillCertificate" runat="server" CssClass="form-control" />
                                </div>
                            </div>
                        </div>


                        <div class="row justify-content-center col-12">
                            <div class="form-row col-8">
                                <asp:LinkButton ID="lbAcctivateAccount" runat="server" class="float-left btn btn-outline-primary mt-1" OnClick="lbAcctivateAccount_Click"><i class="fa fa-eye"></i> Activate this Account</asp:LinkButton>

                            </div>
                            <div class="form-row col-8">
                                <asp:LinkButton ID="lbDeactivateAccount" runat="server" class="float-right btn btn-outline-danger mt-1" OnClick="lbDeactivateAccount_Click"><i class="fa fa-deaf"></i> Deactivate this Account</asp:LinkButton>

                            </div>
                        </div>

                        <hr />
                        <small id="smlStatus_Of_Account" runat="server" class="text-center">This account is in <span id="spnStatus_Of_Account" runat="server">OFF</span>  status! Then hit the top button to change it's status. </small>
                        <%--<div class="row mt-4 justify-content-center">
                                        <div class="col-md-6">
                                            <div class="card" id="divSaveNewDetail" runat="server">
                                                <asp:LinkButton ID="lbSaveNewDetail" runat="server" class="btn btn-info btn-fill" OnClick="lbSaveNewDetail_Click"><i class="fa fa-save"></i> Update Profile</asp:LinkButton>
                                                
                                            </div>
                                        </div>
                                    </div>--%>
                    </div>
                </div>
            </div>
        </div>



            <div class="card strpied-tabled-with-hover">
                <div class="card-header ">
                    <header class="card-header">
                        <h6 class="card-title mt-2 text-center">Work history</h6>
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
                        </tfoot>
                    </table>
                </div>
            </div>


                    <div class="img-container" id="divSkillCertification" runat="server">
                        <div class="row justify-content-center">
                            <h5>ናይ ሞያ መረጋገፂ ወረቐት</h5>
                        </div>
                        <img class="img-thumbnail" title="Skill Certificate Not Inserted ናይ ሞያ መረጋገፂ ወረቐት ኣየእተወን" src="../FileInImageForm.ashx?Phone_No=<%= TrafficPhoneNo %>" />
                    </div>

    </div>
</asp:Content>

