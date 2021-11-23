<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="TodayRecords.aspx.cs" Inherits="TTCRTrafficArea_TodayRecords" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="content" style="padding: 20px 1px;">
          <div class="row  justify-content-center">

              <span id="spn123" runat="server"></span>
              <div class="col-12">
                  <div class="card strpied-tabled-with-hover">
                      <div class="card-header ">
                          <header class="card-header">
                              <p class="card-title mt-2 text-center" style="font-size: 12px;">
                                  You have <span style="color: orangered" id="spnTodayRecordsPerTraffic" runat="server">3</span> recordes on Today. 
                            And from these  You have <span style="color: orangered" id="spnTodayRecoTotalIncomePerTraf" runat="server">1250.00</span> BIRR to be Handin.
                              </p>
                          </header>
                      </div>
                      <hr />

                      <div class="card-body table-responsive">
                          <table id="example" class=" table-sm table-striped table-bordered" style="width: 100%; font-size: smaller;">
                              <thead>
                                  <tr>
                                      <th>No</th>
                                      <th>Taxi Plate </th>
                                      <th>Driver License</th>
                                      <th>Wher (branch)?</th>
                                      <th>Where (Location)?</th>
                                      <th>Amount (Figure)</th>
                                      <th>Driver</th>
                                      <th>Payed By</th>
                                      <th>Deatil</th>
                                  </tr>
                              </thead>

                              <tbody>

                                  <asp:Repeater ID="rptrtodaysRecordesPertraffic" runat="server">
                                      <ItemTemplate>

                                          <tr>
                                              <td><%# Eval("Id") %></td>
                                              <td><%# Eval("Plate_No") %> </td>
                                              <td><%# Eval("Dirver_license_No") %></td>
                                              <td><%# Eval("Branch_Name") %></td>
                                              <td><%# Eval("Loct_Name") %></td>
                                              <td><%# Eval("Ammount_In_figure") %></td>
                                              <td><%# Eval("Driver_Agreement") %></td>
                                              <td><%# Eval("Payment_Status") %></td>
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
                                      <th>Driver</th>
                                      <th>Payed By</th>
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

