
<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRSuperAdmin/SuperAdmin.master" AutoEventWireup="true" CodeFile="BranchDetail.aspx.cs" Inherits="TTCRSuperAdmin_BranchDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style>
          .textfont{
              font-size: 12px;
          }

          .divPadding{
              padding: 10px 1px;
          }
          .hidden {display:none;}
          .view {display: normal;}
      </style>
    <div class="content">
        <div class="row justify-content-center">

            <div class="col-12 ">
                <header class=" divPadding mr-4 bg-transparent">
                    <a href="ListOfBranchs.aspx" class="float-left mt-1" title="Back To List"><i class="fa fa-backward"></i>Back To List</a>
                    <h4 class="text-center" id="Branchname" runat="server">None</h4> 
                </header>
                <div class="row col-12 divPadding">
                    <%--about employees in branch starts here--%>
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-header">
                                <h6 class="card-title text-center"><i class="fa fa-address-card"></i>About Employees under this Branch</h6>
                            </div>
                            <hr />

                            <div>

                                <div class="card-body">
                                    <div>
                                    <span class="textfont"><span>* Branch Admin Assigned?</span> <span id="spnBranchAdminAssigned" class="pull-right"></span></span>
                                    <br />
                                    <span class="textfont"><span>* Crime Identifier Assigned?</span> <span id="spnBranchCrimeIdentifierAssigned" class="pull-right"></span></span>
                                    <br />
                                    <span class="textfont"><span>* Does this branch has Technical?</span> <span id="spnBranchTechinicalAssigned" class="pull-right"></span></span>
                                    <br />
                                    <%--<span class="textfont"><span>Does this branch has Technical?</span> <span id="spnBranchOtrOffice" class="pull-right"></span></span>
                                <br />--%>
                                    <span class="textfont"><span>* Does this branch has enough Employees?</span> <span id="spnBranchEnoughEmployeeAssigned" class="pull-right"></span></span>
                                    <br />
                                    </div>

                                    <div class="m-3">
                                    <%-- <i id="iconPlus" style="color: lawngreen;" class="fa fa-plus" onclick="ShowContent();" title="See list"></i><i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                    <h6 id="iconPlus" class="view" style="color: blueviolet;" onclick="ShowContent();"><i class="fa fa-plus" title="See list"></i>See More!</h6>
                                    <h6 id="iconMinus" class="hidden" style="color: orangered;" onclick="HideContent();"><i class="fa fa-minus" title="Hide list"></i>See Less!</h6>
                                   <%-- <i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                </div>
                                </div>

                                <div class="row  hidden" id="tblEmployeeList">
                                    <div class="card-body table-full-width table-responsive ml-1">

                                        <table id="example2" class="table-sm table-striped table-bordered" style="width: 100%; font-size: small;">
                                            <thead >
                                                <tr>
                                                    <th>Full Name</th>
                                                    <th>Proff-Name</th>
                                                    <th>Responsiblity</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <asp:Repeater ID="rptrEmployessperBranch" runat="server">
                                                    <ItemTemplate>

                                                        <tr>
                                                            <td>
                                                                <a href="TrafficsDetail.aspx?Phone_No=<%# Eval("Phone_No") %>" title="See Detail of this Employee."><%# Eval("FName") %> <%# Eval("MName") %></a>
                                                            </td>
                                                            <td><%# Eval("Proff_Name") %></td>
                                                            <td><%# Eval("Responsibility") %></td>
                                                            <td>
                                                                <a href="DeleteObjects.ashx?Phone_No=<%# Eval("Phone_No") %>"><i class="fa fa-trash"></i></a>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>Full Name</th>
                                                    <th>Proff-Name</th>
                                                    <th>Responsiblity</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--about employees in branch Ends here--%>

                    <%--about LOctions  in this branch list Ends here--%>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h6 class="card-title text-center"><i class="fa fa-globe"></i>About Locations under this Branch</h6>
                            </div>
                            <hr />
                            <div >
                                <div class="card-body">
                                    <div>
                                        <span class="textfont"><span>* Total number of locations =</span> <span runat="server" id="spnTotalNoLocations" class="pull-right"></span></span>
                                        <br />
                                        <span class="textfont"><span>* Total number of location workers =</span>  <span runat="server" id="spnOutOffice" class="pull-right">5</span></span>
                                        <br />
                                        <%-- <span class="textfont"><span>* Does this branch has enough Employees?</span> <span id="spnBranchEnoughEmployeeAssigned" class="pull-right"></span></span>--%>
                                        <span class="textfont"><span>* Does this branch has enough Workers?</span> <span id="spnBranchEnoughOutOfficeAssigned" class="pull-right"></span></span>
                                        <br />
                                        <span class="textfont"><span>.</span> <span id="spnBranchkEnoughEmployeeAssigned" class="pull-right"></span></span>
                                        <br />
                                    </div>
                                    <div class="m-3">
                                        <%-- <i id="iconPlus" style="color: lawngreen;" class="fa fa-plus" onclick="ShowContent();" title="See list"></i><i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                        <h6 id="iconPlusLocations" class="view" style="color: blueviolet;" onclick="ShowLocationContent();"><i class="fa fa-plus" title="See list"></i>See More!</h6>
                                        <h6 id="iconMinusLocations" class="hidden" style="color: orangered;" onclick="HideLocationContent();"><i class="fa fa-minus" title="Hide list"></i>See Less!</h6>
                                        <%-- <i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                    </div>
                                </div>

                                
                                <div class="row hidden" id="tblLocationsList">
                                    <div class="card-body table-full-width table-responsive ml-1">
                                        <table id="example1" class="table-sm table-striped table-bordered" style="width: 100%; font-size: small;">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Branch</th>
                                                    <th>Delete</th>
                                                    <th>See Detail</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <asp:Repeater ID="rptrAllLocationsInBranch" runat="server">
                                                    <ItemTemplate>

                                                        <tr>
                                                            <td><%# Eval("Id") %></td>
                                                            <td><%# Eval("Loct_Name") %></td>
                                                            <td>
                                                                <a href="DeleteLocation.ashx?Id=<%# Eval("Id") %>" style="color: orangered" onclick="return confirm('Are you sure you are about to delete this location permanently?');" ><i class="fa fa-trash" title="Delete this location."></i></a>
                                                            </td>
                                                            <td>
                                                                <a href="#"><i class="fa fa-list" title="See Detail of this Branch"></i></a>
                                                                <%--<a href="TrafficsDetail.aspx?Phone_No=<%# Eval("Id") %>"><i class="fa fa-list" title="See Detail of this Branch"></i></a>--%>
                                                            </td>

                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Location name</th>
                                                    <th>Delete</th>
                                                    <th>See Detail</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--about LOctions  in this branch list Ends here--%>

                    <%--about data anaalysi about  branch starts here--%>
                    <div class="col-md-3">
                        <div class="card">
                            <div class="card-header">
                                <h6 class="card-title text-center"><i class="fa fa-database"></i>branch Data analysis </h6>
                            </div>
                            <hr />

                            <div class="card-body">
                                    <span class="textfont"><span>You have analised data based on:
                                                           </span> <span runat="server" id="Span8" class="pull-right"></span></span>
                                    <br />
                                    <span class="textfont">* Records of this Month <span runat="server" id="Span9" class="pull-right sum"></span></span>
                                    <br />
                                     <%-- <span class="textfont"><span>* Does this branch has enough Employees?</span> <span id="spnBranchEnoughEmployeeAssigned" class="pull-right"></span></span>--%>
                                    <span class="textfont">* Records of this Year <span runat="server" id="Span10" class="pull-right sum"></span></span>
                                    <br />
                                    <span class="textfont">* Over all Records of this branch<span runat="server" id="Span11" class="pull-right sum"></span></span>
                                    <br />

                                <div class="m-3">
                                    <%-- <i id="iconPlus" style="color: lawngreen;" class="fa fa-plus" onclick="ShowContent();" title="See list"></i><i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                    <h6 id="iconPlusDataAnalysis" class="view" style="color: blueviolet;" onclick="ShowDataAnalysisContent();"><i class="fa fa-plus" title="See list"></i>See More!</h6>
                                    <h6 id="iconMinusDataAnalysis" class="hidden" style="color: orangered;" onclick="HideDataAnalysisContent();"><i class="fa fa-minus" title="Hide list"></i>See Less!</h6>
                                   <%-- <i id="iconMinus" style="color: orangered;" class="fa fa-minus hidden" onclick="HideContent();" title="Hide list"></i>--%>
                                </div>
                                     </div>
                            

                            

                            <div class="card-body hidden" id="divDataAnalysis">
                                <div class="col-12 order-4">
                                    <h6>Records in this Month <span runat="server" id="NoTotalTrafficsInZone" class="pull-right sum"></span></h6>
                                    <div class="separator">
                                        <hr />
                                    </div>
                                    <span class="textfont">* Number of Records = </span> <span  runat="server" id="NoHeadOfficers" class="textfont pull-right singleValue">10</span>
                                    <br />
                                    <span class="textfont">* Income to be handin =</span> <span runat="server" id="NoOutOffice" class="textfont pull-right singleValue">30</span>
                                    <br />
                                    <span class="textfont">* Recieved Income =</span> <span runat="server" id="Span4" class="textfont pull-right singleValue">30</span>
                                    <br />
                            </div>

                                <hr class="bg-primary" />

                                <div class="col-12 order-4">
                                    <h6 class="text-center">Records of this Your <span runat="server" id="Span1" class="pull-right sum"></span></h6>
                                    <div class="separator">
                                        <hr />
                                    </div>
                                    <span class="textfont">* Number of Records = </span> <span  runat="server" id="Span2" class="textfont pull-right singleValue">10</span>
                                    <br />
                                    <span class="textfont">* Recieved Income =</span> <span runat="server" id="Span5" class="textfont pull-right singleValue">30</span>
                                    <br />
                                    <span class="textfont">* Non-Recieved Income =</span> <span runat="server" id="Span3" class="textfont pull-right singleValue">30</span>
                                    <br />
                                    <span class="textfont">* Total Amount of Income Expected to be handedin =</span> <span runat="server" id="Span6" class="textfont pull-right singleValue">30</span>
                                    <br />
                            </div>

                                <hr class="bg-primary" />

                                <div class="col-12 order-4">
                                    <h6 class="text-center">Total Records till know <span runat="server" id="Span7" class="pull-right sum"></span></h6>
                                    <div class="separator">
                                        <hr />
                                    </div>
                                    <span class="textfont">* Number of Records = </span> <span id="spntotalrecordsTillnow" runat="server" class="textfont pull-right singleValue">0</span>
                                    <br />
                                    <span class="textfont">* Income to be handin =</span> <span id="spntotalIncomeTillnow" runat="server" class="textfont pull-right singleValue">0</span>
                                    <br />
                                    <span class="textfont">* Recieved Amount =</span> <span id="spntotalRecievedIncomeTillnow" runat="server" class="textfont pull-right singleValue">0</span>
                                    <br />
                                    <span class="textfont">* Non-Recieved Amount =</span> <span id="spntotalNonRecievedIncomeTillnow" runat="server" class="textfont pull-right singleValue">0</span>
                                    <br />
                            </div>

                            </div>
                        </div>
                    </div>
                    <%--about data anaalysi about  branch Ends here--%>
                </div>


                <div class="row col-12 divPadding">

                    <%--about All records in  branch starts here--%>
                    <div class="col-md-12">
                        
                        <div class="card">
                            
                            <div class="card-body">
                                <div class="card-header">
                                <h6 class="card-title text-center"><i class="fa fa-history"></i>All list of records under this branch listed based on the date of record (newest on top).</h6>
                            </div>
                            <hr />
                                <div class="row">
                                    <div class="card-body table-full-width table-responsive">
                                        <table id="example" class="table table-striped table-bordered" style="width: 100%; font-size: small;">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Where?</th>
                                                    <th>Plate</th>
                                                    <th>Driver</th>
                                                    <th>Amount</th>
                                                    <th>Purpose</th>
                                                    <th>Date</th>
                                                    <th>pyment Status</th>
                                                    <th>Detail</th>

                                                </tr>
                                            </thead>

                                            <tbody>

                                                <asp:Repeater ID="rptrAllRecordsInBranch" runat="server">
                                                    <ItemTemplate>

                                                        <tr>
                                                            <td><%# Eval("Id") %></td>
                                                            <td><%# Eval("Loct_Name") %></td>
                                                            <td><%# Eval("Plate_No") %></td>
                                                            <td><%# Eval("Dirver_license_No") %></td>
                                                            <td><%# Eval("Ammount_In_Figure") %></td>
                                                            <td><%# Eval("Purpose") %></td>
                                                            <td><%# Eval("Date") %></td>
                                                            <td><%# Eval("Payment_Status") %></td>
                                                            <td>
                                                    <a href="RecordDetailSlip.aspx?Id=<%# Eval("Id") %>" title="see detaile of the record"><span class="fa fa-list"></span></a>
                                                </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </tbody>
                                            <tfoot class="thead-dark">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Where?</th>
                                                    <th>Plate</th>
                                                    <th>Driver</th>
                                                    <th>Amount</th>
                                                    <th>Purpose</th>
                                                    <th>Date</th>
                                                    <th>pyment Status</th>
                                                    <th>Detail</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--about All records in  branch Ends here--%>
                </div>
            </div>
        </div>
    </div>
       
    <script type="text/javascript">
        //function branchAssigned() {
        document.body.onload = function() {
            //document.getElementById("tblEmployeeList").className = "hidden";

                var brchAss = <%= AdmiinAssigned %>;
                var crimeIdentfier = <%= CrimeIdentfirAssigned %>;
                var TechinicalAssigned = <%= BranchTechinicalAssigned %>;
            var AboutTatalEmployee = <%= EnoughOutOffice %>;
            var outOfficeOnly = <%= EnoughOutOffice %>; 
                
                if(brchAss==0){
                    document.getElementById("spnBranchAdminAssigned").innerHTML = "<img width='15' src='../assets/icons/error.png' />";
                    AboutTatalEmployee =0;
                }
                if(brchAss==1){
                    document.getElementById("spnBranchAdminAssigned").innerHTML = "<img width='15' src='../assets/icons/Success.png' />";
                }
                
                if (crimeIdentfier == 0){
                    document.getElementById("spnBranchCrimeIdentifierAssigned").innerHTML = "<img width='15' src='../assets/icons/error.png' />";
                    AboutTatalEmployee =0;
                }

                if (crimeIdentfier == 1){
                    document.getElementById("spnBranchCrimeIdentifierAssigned").innerHTML = "<img width='15' src='../assets/icons/Success.png' />";
                }

                if (TechinicalAssigned == 0){
                    document.getElementById("spnBranchTechinicalAssigned").innerHTML = "<img width='15' src='../assets/icons/error.png' />";
                    AboutTatalEmployee =0;
                }

                if (TechinicalAssigned == 1){
                    document.getElementById("spnBranchTechinicalAssigned").innerHTML = "<img width='15' src='../assets/icons/Success.png' />";
                }

                if (AboutTatalEmployee == 0){
                    document.getElementById("spnBranchEnoughEmployeeAssigned").innerHTML = "<img width='15' src='../assets/icons/error.png' />";
                }

                if (AboutTatalEmployee == 1){
                    document.getElementById("spnBranchEnoughEmployeeAssigned").innerHTML = "<img width='15' src='../assets/icons/Success.png' />";
                }
                if (outOfficeOnly == 0){
                    document.getElementById("spnBranchEnoughOutOfficeAssigned").innerHTML = "<img width='15' src='../assets/icons/error.png' />";
                }
                if (outOfficeOnly == 1){
                    document.getElementById("spnBranchEnoughOutOfficeAssigned").innerHTML = "<img width='15' src='../assets/icons/Success.png' />";
                }

            }
        //}

        

        function ShowContent(){
            document.getElementById("tblEmployeeList").className = "view";
            document.getElementById("iconPlus").className = "hidden";
            document.getElementById("iconMinus").className = "view";
        }
        
        function HideContent(){
            document.getElementById("tblEmployeeList").className = "hidden";
            document.getElementById("iconMinus").className = "hidden";
            document.getElementById("iconPlus").className = "view";
        }

        function ShowLocationContent(){
            document.getElementById("tblLocationsList").className = "view";
            document.getElementById("iconPlusLocations").className = "hidden";
            document.getElementById("iconMinusLocations").className = "view";
        }
        function HideLocationContent(){
            document.getElementById("tblLocationsList").className = "hidden";
            document.getElementById("iconMinusLocations").className = "hidden";
            document.getElementById("iconPlusLocations").className = "view";
        }

        function ShowDataAnalysisContent(){
            document.getElementById("divDataAnalysis").className = "view";
            document.getElementById("iconPlusDataAnalysis").className = "hidden";
            document.getElementById("iconMinusDataAnalysis").className = "view";
        }
        function HideDataAnalysisContent(){
            document.getElementById("divDataAnalysis").className = "hidden";
            document.getElementById("iconMinusDataAnalysis").className = "hidden";
            document.getElementById("iconPlusDataAnalysis").className = "view";
        }
    </script>
</asp:Content>

