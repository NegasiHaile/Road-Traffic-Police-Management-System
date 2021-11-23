<%@ Page Title="" Language="C#" MasterPageFile="~/TTCROwnerArea/OwnerArae.master" AutoEventWireup="true" CodeFile="TaxiDetailToOwner.aspx.cs" Inherits="TTCROwnerArea_TaxiDetailToOwner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div class="content" style="padding: 20px 5px;">

        <div class="row justify-content-center">
            <%--<asp:repeater runat="server" id="rptrDrirverDetail">
                 <ItemTemplate>--%>
            <div class="col-md-5">
              
                <img class="img-thumbnail" width="600" src="../FileInImageForm.ashx?Phone_No=<%# TaxiPlate %>" />
                <%--<img class="img-thumbnail" src="../ImageHandler.ashx?Phone_No=<%# Eval("Phone_No") %>" />--%>
            
               </div>

            <div class="col-md-7">
                 <div class="card strpied-tabled-with-hover">
                <div class="card-header ">
                    <header class="card-header">
                        <p class="card-title mt-2" style="font-size: 12px;">
                            Number of Records With this taxi = <span style="color: orangered" id="spnRecordesOnThisLocation" runat="server">3</span> <br /> 
                            Total Punishment income from this taxi = <span style="color: orangered" id="spnTotalIncomePerLoct" runat="server">1250.00</span> </p>
                    </header>
                </div>
                    <hr class="btn-primary" />
                
                     <div class="card-body table-full-width table-responsive">
                         <table id="example" class="table table-striped table-bordered" style="width: 100%">
                             <thead>
                                 <tr>
                                     <th>No</th>
                                     <th>Driver License</th>
                                     <th>Wher (branch)?</th>
                                     <th>Where (Location)?</th>
                                     <th>Amount (Figure)</th>
                                     <th>Payed By</th>
                                     <th>Date</th>
                                     <th>Deatil</th>
                                 </tr>
                             </thead>

                             <tbody>
                                 <asp:Repeater ID="rptrRecordsPerLoct" runat="server">
                                     <ItemTemplate>
                                         <tr>
                                             <td><%# Eval("Id") %></td>
                                             <td><%# Eval("Dirver_license_No") %></td>
                                             <td><%# Eval("Branch_Name") %></td>
                                             <td><%# Eval("Loct_Name") %></td>
                                             <td><%# Eval("Ammount_In_figure") %></td>
                                             <td><%# Eval("Payment_Status") %></td>
                                             <td><%# Eval("Date") %></td>
                                             <td>
                                                 <a href="RecordDetailAfterrecorded.aspx?Id=<%# Eval("Id") %>"><span class="fa fa-list"></span></a>
                                             </td>
                                         </tr>
                                     </ItemTemplate>
                                 </asp:Repeater>

                             </tbody>
                             <tfoot>
                                 <tr>
                                     <th>No</th>
                                     <th>Driver License</th>
                                     <th>Wher (branch)?</th>
                                     <th>Where (Location)?</th>
                                     <th>Amount (Figure)</th>
                                     <th>Payed By</th>
                                     <th>Date</th>
                                     <th>Deatil</th>
                                 </tr>
                             </tfoot>
                         </table>
                     </div>
            </div>
            </div>


        </div>
    </div>
</asp:Content>

