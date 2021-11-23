<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="HistoryOfBranch.aspx.cs" Inherits="TTCRBranchAdmin_HistoryOfBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="text-center" id="spnbranchName">Name Of Branch</h5>
                        <hr />
                    </div>

                    <p class="description p-3">
                        ኣብዚ ክፍለ ከተማ እዚ <span class="singleValue">345 </span> ልኣኽሉ ናይ ቕፅዓት ሰነዳት አለዉ：： ካብዝኦም ሰነዳት እዝኦም ድማ <span class="singleValue"> 30287</span> 
                         ቕርሺ ኣታዊ ከርከብ ይድለ：： ካብኣቶም ድማ <span class="singleValue"> 29422</span>  ቕርሺ ካብ <span class="singleValue"> 340</span>  ሰነዳት ኣታዊ ክግበር ተኻእሉ ፤ 
                        እቶም ዝተረፉ <span class="singleValue"> 1236</span> ዝኣክል ቕርሺ ዝሓዙ <span class="singleValue"> 5</span>  ሰነዳት ድማ ኣታዊ ዘይተገበሩ እዮም：：  
                    </p>
                   <%-- <div class="row col-12">
                        <div class="card-body col-md-6">
                            <h6>Total Number of traffics: <span runat="server" id="NoTotalTrafficsInZone" class="pull-right" style="color: blue;">0</span></h6>
                            <div class="separator">
                                <hr />
                            </div>
                            <span class="contenttextfont">* Number of Crime Identfier : <span runat="server" id="NoCrimeIdentfier" class="pull-right singleValue">0</span></span>
                            <br />
                            <span class="contenttextfont">* Number of Branch Technical : <span runat="server" id="NoTechnical" class="pull-right singleValue">0</span></span>
                            <br />
                            <span class="contenttextfont">* Number of Out offices workers : <span runat="server" id="NoOutOffice" class="pull-right singleValue">0</span></span>
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

                    </div>--%>

                </div>

                <div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <header class="card-header">
                            <h6 class="card-title text-center">List of records befor today in this branch</h6>
                        </header>

                        <hr/>
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
                                </tr
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
            </div>
        </div>
    </div>
    
</asp:Content>

