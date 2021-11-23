<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="GenerateSchedule.aspx.cs" Inherits="TTCRBranchAdmin_GenerateSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content">
        <div class="row justify-content-center">

            <div class="col-12">
                <asp:LinkButton ID="lbtnRefreshScheduleTable" CssClass="btn btn-outline-warning mb-1 float-left" runat="server" OnClick="lbtnRefreshScheduleTable_Click"><i class="fa fa-recycle"></i>Referesh Table</asp:LinkButton>
                <asp:LinkButton ID="lbtnGenerateSchedule" runat="server" class="btn btn-outline-success mb-1 float-right" OnClick="lbtnGenerateSchedule_Click"><i class="fa fa-plus"></i>New Schedule </asp:LinkButton>
            </div>

            <div class="col-12">
                <div class="card">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div>
                                    <article class="card-body text-center">
                                        <h5 class="h5">ክፍለ ከተማ: <span style="color: blue;" id="spnScheduletitleBranchName" runat="server">Branch name</span></h5>
                                        <h6 class="h6">ዕለት： <span id="spnDate" runat="server">Date</span></h6>
                                        <h6 class="card-title mt-2">ናይ'ዚ ዕለት ናይ ቦታ ምደባ</h6>
                                    </article>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                <hr />
                    <div class="row">
                    <div class="col-md-4">
                        <div class="card-header">
                            <h5 class="card-title text-center">Shift: A</h5>
                        </div>
                        <hr />
                        <div class="card-body">
                            <span class="textfont"><span>* Number of Attended Employes:</span> <span id="spnAttendedShifA" runat="server" class="float-right">4</span></span>
                            <br />
                            <span class="textfont"><span>* Number of missed Employes:</span> <span id="spnMissedShiftA" runat="server" class="pull-right">2</span></span>
                            <br />
                        </div>
                    </div>
                        <div class="col-md-4">
                        <div class="card-header">
                            <h5 class="card-title text-center">Shift: B</h5>
                        </div>
                        <hr />
                        <div class="card-body">
                            <span class="textfont"><span>* Number of Attended Employes:</span> <span id="spnAttendedShifB" runat="server" class="float-right">4</span></span>
                            <br />
                            <span class="textfont"><span>* Number of missed Employes:</span> <span id="spnMissedShiftB" runat="server" class="pull-right">2</span></span>
                            <br />
                        </div>
                    </div>
                        <div class="col-md-4">
                        <div class="card-header">
                            <h5 class="card-title text-center">በዚ ዕለት</h5>
                        </div>
                        <hr />
                        <div class="card-body">
                            <span class="textfont"><span>* በዝሒ ኣተንዳንስ ዝወሰዱ:</span> <span id="spnAttendedTotal" runat="server" class="float-right">4</span></span>
                            <br />
                            <span class="textfont"><span>* በዝሒ ኣተንዳንስ ዘይወሰዱ:</span> <span id="spnMissedTotal" runat="server" class="pull-right">2</span></span>
                            <br />
                        </div>
                    </div>


                </div>

                <%-- <div class="card-header ">
                            <header class="card-header">
                                <div class="col-3 ">
                                
                                </div>
                                <div class="col-9 float-lg-left">
                                    <h6 class="card-title mt-2">ናይ ሎማዕንቲ ናይ ቦታ ምደባ</h6>
                                </div>
                            </header>
                        </div>--%>

                




                

                <div class="strpied-tabled-with-hover mt-2">
                    <div class="card-body table-full-width table-responsive">
                        <table id="example" class="table-sm table-hover  " style="width: 100%; font-size: 14px;">
                            <thead style="background-color: #333; color: white; font-family: 'Times New Roman';">
                                <tr>
                                    <th>id</th>
                                    <th>Proff_name</th>
                                    <th>Name</th>
                                    <th>Phone #</th>
                                    <th>Placement</th>
                                    <th>Shift</th>
                                    <th>Attendance</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptrNewSchedule" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("Id") %></td>
                                            <td><%# Eval("Proff_Name") %></td>
                                            <td><%# Eval("FName") %> <%# Eval("MName") %></td>
                                            <td><%# Eval("Traffic_Phone") %></td>
                                            <td><%# Eval("Loct_Name") %></td>
                                            <td><%# Eval("Shift") %></td>
                                            <td><%# Eval("Attendance") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                            <tfoot style="background-color: #333; color: white;">
                                <tr>
                                    <th>id</th>
                                    <th>Proff_name</th>
                                    <th>Name</th>
                                    <th>Phone #</th>
                                    <th>Placement</th>
                                    <th>Shift</th>
                                    <th>Attendance</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>

