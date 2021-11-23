<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="RecordsPertaxi.aspx.cs" Inherits="TTCRTrafficArea_RecordsPertaxi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content" style="padding: 20px 1px;">


        <div class="row justify-content-center">
            <div class="col-md-8">
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
                                <th>Taxi Plate </th>
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
                                        <td><%# Eval("Plate_No") %> </td>
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
                                <th>Taxi Plate </th>
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

