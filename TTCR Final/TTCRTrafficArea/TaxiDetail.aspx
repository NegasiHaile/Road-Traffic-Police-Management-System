<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="TaxiDetail.aspx.cs" Inherits="TTCRTrafficArea_TaxiDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .spnsFont{
            font-family: Arial;
            font-size: 12px;
            color: mediumvioletred;
        }
    </style>
    <div class="content">
        <div class=" justify-content-center">

            <div class="col-12">
                <div class=" Card">
                    <div class="card-header">
                        <h6>Everything abuot the taxi is listed bellow!</h6>
                        <hr />
                    </div>

                    <div class="row card-body">
                        <div class="col-md-4 img-container">
                            <img  height="200" src="../FileInImageForm.ashx?Phone_No=<%# TaxiPlate %>" />
                            <%--<img class="img-thumbnail" src="../ImageHandler.ashx?Phone_No=<%# Eval("Phone_No") %>" />--%>
                        </div>

                        <div class="row col-md-8">
                            <div class="col-sm-4">
                                <div class="card-separator">
                                    <h6 style="text-align: center; font-weight: bold;">Taxi</h6>
                                    <hr />
                                </div>
                                <span class="textfont"><span>* Taxi Plate : </span><span id="spnTaxiPlate" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <span class="textfont"><span>* Taxi Type :</span> <span id="spnTaxiTaype" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <span class="textfont"><span>* Taxi Level :</span> <span id="spnTaxiLevel" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <span class="textfont"><span>* Taxi Color :</span> <span id="spnTaxiColor" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <%--<span class="textfont"><span>Does this branch has Technical?</span> <span id="spnBranchOtrOffice" class="pull-right"></span></span>
                                <br />--%>
                            </div>

                            <div class="col-sm-4">
                                <div class="card-separator">
                                    <h6 style="text-align: center; font-weight: bold;">Owner</h6>
                                    <hr />
                                </div>
                                <span class="textfont"><span>* Name  : </span> <a <a href="OwnerDetail.aspx?Phone_No=<%= OwnerPhone %>" id="spnOwnerFullName" class="pull-right spnsFont"> <%= OwnerFullName %></a></span>
                                <br />
                                <span class="textfont"><span>* Gender :</span> <span id="spnOwnergender" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <span class="textfont"><span>* Phone :</span> <span id="spnOwnerPhone" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <span class="textfont"><span>* Tellephone :</span> <span id="spnOwnerTellephone" runat="server" class="pull-right spnsFont">0</span></span>
                                <br />
                                <%--<span class="textfont"><span>Does this branch has Technical?</span> <span id="spnBranchOtrOffice" class="pull-right"></span></span>
                                <br />--%>
                            </div>

                            <div class="col-sm-4">
                                <div class="card-separator">
                                    <h6 style="text-align: center; font-weight: bold;">Current Driver</h6>
                                    <hr />
                                </div>
                                <span class="textfont"><span>* Name : </span><a href="TaxiOwnerDetail.aspx?Phone_No = <%= OwnerPhone %>" id="spnDriverFullName" runat="server" class="pull-right spnsFont">Not Assigned</a></span>
                                <br />
                                <span class="textfont"><span>* License No :</span> <span id="spnDriverLicenseNo" runat="server" class="pull-right spnsFont">-----</span></span>
                                <br />
                                <span class="textfont"><span>* Phone No :</span> <span id="spnDriverPhoneNo" runat="server" class="pull-right spnsFont">-----</span></span>
                                <br />
                                <span class="textfont"><span>* Driver Status :</span> <span id="SpnDriverStatus" runat="server" class="pull-right spnsFont">-----</span></span>
                                <br />
                                <%--<span class="textfont"><span>Does this branch has Technical?</span> <span id="spnBranchOtrOffice" class="pull-right"></span></span>
                                <br />--%>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="col-12">
                    <div class="card">
                        <div class="card-header ">
                            <header class="card-header">
                                <p class="card-title float-lg-right" style="font-size: 12px;">
                                    Number of Records With this taxi = <span style="color: orangered" id="spnRecordesOnThisLocation" runat="server">3</span>
                                    <br />
                                    Total Punishment income from this taxi = <span style="color: orangered" id="spnTotalIncomePerLoct" runat="server">1250.00</span>
                                </p>

                                <h4 class="text-uppercase">Violations & Citations</h4>
                            </header>
                        </div>
                        <hr class="btn-primary" />

                        <div class="card-body table-full-width table-responsive">
                            <table id="example" class="table table-hover text-sm-left" style="width: 100%; font-size: small;">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>Vocher_No</th>
                                        <th>Driver_License</th>
                                        <th>Description.......................... </th>
                                        <th>Amount</th>
                                        <th>Payed_By</th>
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
                                                <td><%# Eval("Purpose") %></td>
                                                <td><%# Eval("Ammount_In_figure") %></td>
                                                <td><%# Eval("Payment_Status") %></td>
                                                <td><%# Eval("Date") %></td>
                                                <td>
                                                    <a href="RecordDetailSlip.aspx?Id=<%# Eval("Id") %>"><span class="fa fa-list"></span></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </tbody>
                                <tfoot class="thead-dark">
                                    <tr>
                                        <th>Vocher_No</th>
                                        <th>Driver_License</th>
                                        <th>Description.......................... </th>
                                        <th>Amount</th>
                                        <th>Payed_By</th>
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
    </div>
</asp:Content>

