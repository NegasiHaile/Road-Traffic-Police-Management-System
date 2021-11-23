<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="TrafficRegistration.aspx.cs" Inherits="TTCRSuperAdmin_TrafficRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content" style="padding: 20px 1px;">

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">

                    <header class="card-header">
                        <div class="alert alert-success" runat="server" id="divTrafficRegistrationSuccess">
                            <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span class="fa fa-question"></span>
                            <span runat="server" id="spnTrafficRegistrationSuccess">This is a regular notification made with ".alert-primary"</span>
                        </div>
                        <div class="alert alert-danger" runat="server" id="divTrafficRegistrationError">
                            <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span class="fa fa-exclamation-triangle"></span>
                            <span runat="server" id="spnTrafficRegistrationError">This is a regular notification made with ".alert-primary"</span>
                        </div>
                        <a href="ListOfAllTraffics.aspx" class="float-right btn btn-outline-primary mt-1"><i class="fa fa-list"></i>Go to List </a>
                        <h6 id="dvtitle" class="card-title mt-2 text-uppercase">Add the new traffic's Detail bellow</h6>
                    </header>


                    <hr style="color: dimgray;" />
                    <article class="card-body">

                        <div class="form-row">
                            <div class="form-group col-sm-4">
                                <label>First name </label>
                                <asp:TextBox ID="tbTrafficFName" runat="server" MaxLength="20" onkeypress="return onlyLetterKey(event)" CssClass="form-control" placeholder="*" required="require"></asp:TextBox>

                            </div>


                            <div class="form-group col-sm-4">
                                <label>Midle name</label>
                                <asp:TextBox ID="tbTrafficMName" runat="server" MaxLength="20" onkeypress="return onlyLetterKey(event)"  class="form-control" placeholder="*" required="require"></asp:TextBox>

                            </div>
                            <div class="form-group col-sm-4">
                                <label>Last. name</label>
                                <asp:TextBox ID="tbTrafficLName" runat="server" MaxLength="20" onkeypress="return onlyLetterKey(event)" class="form-control" placeholder="*" required="require"></asp:TextBox>

                            </div>

                        </div>

                        <div class="form-row">

                            <div class="form-group col-sm-6">
                                <label>Phone No</label>
                                <asp:TextBox ID="tbTrafficPhoneNo" onkeypress="return onlyNumberKey(event)" maxlength="10" runat="server" class="form-control" placeholder="*" required="require"></asp:TextBox>
                            </div>

                            <div class="form-group col-sm-6">
                                <label>Email address</label>
                                <asp:TextBox ID="tbTrafficEmail" TextMode="Email" runat="server" class="form-control" placeholder=""></asp:TextBox>
                            </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group col-sm-6">
                                <label>Proffesional Name</label>

                                <asp:DropDownList ID="ddlTrafficProffName" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="require">
                                    <asp:ListItem Selected="true" disabled>Sellect the Proffesional Name</asp:ListItem>
                                    <asp:ListItem>Sagin</asp:ListItem>
                                    <asp:ListItem>Vice Sagin</asp:ListItem>
                                    <asp:ListItem>Assistan Sagin</asp:ListItem>
                                    <asp:ListItem>Konstabile</asp:ListItem>
                                    <asp:ListItem>Inspector</asp:ListItem>
                                    <asp:ListItem>Assistant Inspectore</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Brith Date</label>
                                <asp:TextBox ID="tbTrafficBrithDate" TextMode="Date" runat="server" class="form-control" placeholder=""></asp:TextBox>
                            </div>
                        </div>

                        



                        <div class="form-row">
                            <div class="form-group col-sm-3">
                            <label>Gender</label>
                            <div class="maxl">
                                <label class="radio inline">
                                    <asp:RadioButton runat="server" ID="rbTrafficMaleGender" type="radio" GroupName="gender" Checked="true" />
                                    <span>Male </span>
                                </label>
                                <label class="radio inline">
                                    <asp:RadioButton runat="server" ID="rbTrafficFemaleGender" type="radio" GroupName="gender" />
                                    <span>Female </span>
                                </label>
                            </div>
                        </div>

                            <div class="form-group col-sm-5">
                                <label>To which branch?</label>

                                <asp:DropDownList ID="ddlTrafficBrach" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK">
                                    <asp:ListItem Selected="true" disabled>Assign work branch</asp:ListItem>
                                    <%-- <asp:ListItem>Adi Haki</asp:ListItem>
                                            <asp:ListItem>Ayder</asp:ListItem>
                                            <asp:ListItem>Hawelti</asp:ListItem>
                                            <asp:ListItem>Kedamay weyane</asp:ListItem>
                                            <asp:ListItem>Midregenet</asp:ListItem>
                                            <asp:ListItem>Branch 6</asp:ListItem>
                                            <asp:ListItem>Branch 7</asp:ListItem>--%>
                                </asp:DropDownList>
                            </div>


                            <div class="form-group col-sm-4">
                                <label>Responsibility</label>

                                <asp:DropDownList ID="ddlTrafficResponsibility" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK">
                                    <asp:ListItem Selected="true" class="bg-secondary" disabled>Responsibility in branch</asp:ListItem>
                                    <asp:ListItem>Branch Officer</asp:ListItem>
                                    <asp:ListItem>Techinical</asp:ListItem>
                                    <asp:ListItem>Crime Identifier</asp:ListItem>
                                    <asp:ListItem>Out Office</asp:ListItem>
                                    <asp:ListItem disabled>...................................................</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>



                        <div class="form-row">
                            <div class="form-group col-6">
                                <label>Photo (3X4)</label>
                                <asp:FileUpload ID="fupldTrafficPhoto" runat="server" CssClass="form-control" required="require" />
                            </div>
                            <div class="form-group col-6">
                                <label>Skill Certificate</label>
                                <asp:FileUpload ID="fupldTrafficSkillCertificate" runat="server" CssClass="form-control" />
                            </div>
                        </div>


                        <div class="form-row">

                            <div class="form-group col-6">
                                <label>Create Password Defualt (TTCR@123)</label>
                                <asp:TextBox ID="tbTrafficCreatePassword" TextMode="Password" CssClass="form-control" runat="server" BorderColor="#CC0099" Text="TTCR@123" Placeholder="TTCR@123"></asp:TextBox>
                                
                            </div>
                            <div class="form-group col-6">
                                <label>Retype password Defualt (TTCR@123)</label>
                                <asp:TextBox ID="tbTrafficRetypePassword" TextMode="Password" CssClass="form-control" runat="server" BorderColor="#CC0099" Text="TTCR@123" Placeholder="TTCR@123"></asp:TextBox>
                            </div>
                        </div>
                        <small class="form-text text-muted">Create a Password for the user Or Leave default = TTCR@123</small>
                        



                        <!-- form-group// -->

                    </article>
                    <!-- card-body end .// -->
                    <div class="border-top text-center mt-2">
                        <div class="form-group form-inline">
                            <div class="form-group col-6">
                                <asp:Button ID="lbtnSaveTrafficDetail" class="btn btn-primary btn-block btnFont" runat="server" OnClientClick="return checkFields_Of_TrafficRegis();" OnClick="lbtnSaveTrafficDetail_Click" Text="Register"></asp:Button>

                            </div>
                            <div class="form-group col-6">
                                <asp:LinkButton ID="lbtnCleanTrafficDetail" class="btn btn-warning btn-block btnFont" runat="server" OnClick="lbtnCleanTrafficDetail_Click" OnClientClick="return confirm('Are you sure you want to clean all the fields?')"> <span class="fa fa-eraser"></span> Clean All</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <!-- card.// -->
                </div>
            </div>
            <!--container end.//-->



            <script>
                function checkFields_Of_TrafficRegis() {
                  //  document.getElementById("dvtitle").innerHTML ="The text from the intro paragraph is ";
                    var ProffName = 4;//document.getElementById("ddlTrafficProffName").tabIndex;
                    alert(ProffName * ProffName * ProffName);
                    //return confirm(ProffName);
                }
                function getcube() {
                    var number = document.getElementById("tbTrafficPhoneNo").value;
                    alert(number * number * number);
                }
            </script>







            <div class="container">
                <br />
                <p class="text-center">More bootstrap 4 components on <a href="http://bootstrap-ecommerce.com/">Bootstrap-ecommerce.com</a></p>
                <hr />


                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <header class="card-header">
                                <a href="#" class="float-right btn btn-outline-primary mt-1">Log in</a>
                                <h4 class="card-title mt-2">Sign up</h4>
                            </header>
                            <article class="card-body">

                                <div class="form-row">
                                    <div class="col form-group">
                                        <label>First name </label>
                                        <input type="text" class="form-control" placeholder="">
                                    </div>
                                    <!-- form-group end.// -->
                                    <div class="col form-group">
                                        <label>Last name</label>
                                        <input type="text" class="form-control" placeholder=" ">
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <!-- form-row end.// -->
                                <div class="form-group">
                                    <label>Email address</label>
                                    <input type="email" class="form-control" placeholder="">
                                    <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="option1">
                                        <span class="form-check-label">Male </span>
                                    </label>
                                    <label class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" value="option2">
                                        <span class="form-check-label">Female</span>
                                    </label>
                                </div>
                                <!-- form-group end.// -->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label>City</label>
                                        <input type="text" class="form-control">
                                    </div>
                                    <!-- form-group end.// -->
                                    <div class="form-group col-md-6">
                                        <label>Country</label>
                                        <select id="inputState" class="form-control">
                                            <option>Choose...</option>
                                            <option>Uzbekistan</option>
                                            <option>Russia</option>
                                            <option selected="">United States</option>
                                            <option>India</option>
                                            <option>Afganistan</option>
                                        </select>
                                    </div>
                                    <!-- form-group end.// -->
                                </div>
                                <!-- form-row.// -->
                                <div class="form-group">
                                    <label>Create password</label>
                                    <input class="form-control" type="password">
                                </div>
                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block">Register  </button>
                                </div>
                                <!-- form-group// -->
                                <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our
                                    <br>
                                    Terms of use and Privacy Policy.</small>

                            </article>
                            <!-- card-body end .// -->
                            <div class="border-top card-body text-center">Have an account? <a href="">Log In</a></div>
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

