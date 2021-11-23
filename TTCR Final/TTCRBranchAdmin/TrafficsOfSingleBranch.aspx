<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="TrafficsOfSingleBranch.aspx.cs" Inherits="TTCRBranchAdmin_TrafficsOfSingleBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>List of branch traffics</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content">
            <div class="row justify-content-center">


                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="text-center" id="spnbranchName">Name Of Branch</h5>
                            <hr />
                        </div>
                        <div class="row col-12">
                        <div class="card-body col-md-6">
                            <h6>በዝሒ ቑፅሪ ሰረሕተኛ: <span runat="server" id="NoTotalTrafficsInZone" class="pull-right" style="color: blue;">0</span></h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span class="contenttextfont ">* በዝሒ ገበን መርማሪ ሰራሕተኛ : <span runat="server" id="NoCrimeIdentfier" class="pull-right singleValue">0</span></span>
                            <br />
                            <span class="contenttextfont">* በዝሒ ተክንካል ሰራሕተኛ : <span runat="server" id="NoTechnical" class="pull-right singleValue">0</span></span>
                            <br />
                            <span class="contenttextfont">* በዝሒ ካብ ብሮ ወፃኢ ዝሰርሑ （ትራፍካት） : <span runat="server" id="NoOutOffice" class="pull-right singleValue">0</span></span>
                            <br />
                        </div>
                        <div class="card-body col-md-6">
                            <h6 class="text-center">Accounts Status:</h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span class="contenttextfont">* Active Accounts : <span runat="server" id="Span2" class="pull-right singleValue">0</span></span>
                            <br />
                            <span class="contenttextfont">* Deactivated Accounts : <span runat="server" id="Span3" class="pull-right singleValue">0</span></span>
                            <br />
                        </div>

                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card strpied-tabled-with-hover">
                        <div class="card-header ">
                            <h6 class="text-center">List of Traffics under This branch</h6>
                        </div>
                        <hr />
                        <div class="card-body table-full-width table-responsive">
                            <table id="example" class="table table-hover" style="width: 100%; font-size: smaller;">
                                <thead class="thead-dark" style="background-color: black;">
                                    <tr>
                                        <th>Id #</th>
                                        <th>Proff_name </th>
                                        <th>Full Name</th>
                                        <th>Phone #</th>
                                        <th>Gender</th>
                                        <th>Responsibility</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <asp:Repeater ID="rptrListOfBranchtraffics" runat="server">
                                        <ItemTemplate>

                                            <tr>
                                                <td><%# Eval("EplyID") %></td>
                                                <td><%# Eval("Proff_Name") %> </td>
                                                <td><%# Eval("FName") %> <%# Eval("MName") %> <%# Eval("LName") %></td>
                                                <td><%# Eval("Phone_No") %></td>
                                                <td><%# Eval("Gender") %></td>
                                                <td><%# Eval("Responsibility") %></td>
                                                <td>
                                                    <a href="TrafficDetail.aspx?Phone_No=<%# Eval("Phone_No") %>"><i class="fa fa-link" title="See Detail"></i></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tfoot class="thead-dark" style="background-color: black;">
                                    <tr>
                                        <th>Id #</th>
                                        <th>Proff_name </th>
                                        <th>Full Name</th>
                                        <th>Phone #</th>
                                        <th>Gender</th>
                                        <th>Responsibility</th>
                                        <th>Detail</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>



            </div>
    </div>
    <div class="col-sm-12 col-md-6">
        <div class="dataTables_length" id="example_length">
            <label>
                Show 
                        <select name="example_length" aria-controls="example" class="custom-select custom-select-sm form-control form-control-sm">
                            <option value="5">5</option>
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                entries
            </label>
        </div>
    </div>


   <%-- <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4">
        <div class="row">
            <div class="col-sm-12 col-md-6">
                <div class="dataTables_length" id="example_length">
                    <label>
                        Show
                                <select name="example_length" aria-controls="example" class="custom-select custom-select-sm form-control form-control-sm">
                                    <option value="3">3</option>
                                    <option value="6">6</option>
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select>
                        entries</label>
                </div>
            </div>
            <div class="col-sm-12 col-md-6">
                <div id="example_filter" class="dataTables_filter">
                    <label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"></label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table id="example_alt" class="table table-hover dataTable" style="width: 100%; font-size: smaller;" role="grid" aria-describedby="example_info">
                    <thead class="thead-dark" style="background-color: black;">
                        <tr role="row">
                            <th class="sorting_asc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Id #: activate to sort column descending" style="width: 12px;">Id #</th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Proff_name : activate to sort column ascending" style="width: 74px;">Proff_name </th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Full Name: activate to sort column ascending" style="width: 84px;">Full Name</th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Phone #: activate to sort column ascending" style="width: 53px;">Phone #</th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Email: activate to sort column ascending" style="width: 182px;">Email</th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Gender: activate to sort column ascending" style="width: 45px;">Gender</th>
                            <th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Detail: activate to sort column ascending" style="width: 37px;">Detail</th>
                        </tr>
                    </thead>


                    <tbody>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>

                        </tr>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>aaa</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>bbb</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>ccc</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                        <tr>
                            <td>wwwwwwww</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                            <td>eeeeeeee</td>
                            <td>rrrrrrrr</td>
                            <td>tttttttt</td>
                        </tr>
                    </tbody>
                </table>
            </div>



        </div>
    </div>--%>


</asp:Content>

