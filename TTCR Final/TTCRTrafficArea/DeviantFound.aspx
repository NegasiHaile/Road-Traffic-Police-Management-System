<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="DeviantFound.aspx.cs" Inherits="TTCRTrafficArea_DeviantFound" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content" style="padding: 20px 5px;">


        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="card card-user">
                    <article class="card-body">
                        <div style="border: solid 1px gray; padding: 5px; margin: -15px; margin-bottom: 0px; border-radius: 5px;">
                            <div class="form-row col-12">
                                <div class="form-group col-2">
                                </div>
                                <div class="form-group col-6 author" style="margin-top: 0px;">
                                    <img class="thelogo" width="60" src="../assets/img/SchooloOfComputingLogo.png" />
                                </div>

                                <div class="form-group col-4">
                                    <p class="fontchange" style="color: orangered; font-size: 15px; font-family: 'Modern No. 20';">No : <span id="spnReceiptVocherNo" runat="server">499252</span></p>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-2" style="border: solid 1px gray;">
                                    <h6 class="fontchange"><span id="spnMH1" runat="server">ME/HE/1</span></h6>
                                </div>
                                <div class="form-group col-6">
                                    <p class="fontchange">Regional National Regional Government</p>
                                    <p class="fontchange">Bureau of Plan and Finance</p>
                                    <p class="fontchange" style="border-bottom: solid 1px black;">DEVIANTS EXPOSING PAPER</p>
                                </div>
                                <div class="form-group col-4">
                                    <p class="fontchange">Sreia: TG/10/A</p>
                                    <p class="fontchange">Date: <span id="spnDate" style="border-bottom: solid 1px gray;" runat="server">25/3/2012</span></p>
                                    <p class="fontchange">Wereda: <span id="spnWereda" style="border-bottom: solid 1px gray;" runat="server">No 03148</span> </p>
                                </div>
                            </div>
                        </div>


                        <div style="border: solid 1px gray; padding: 5px; margin: -15px; margin-top: 0px; border-radius: 5px;">
                            <div class="mt-3">
                                <div class="form-row col-12">
                                    <div class="form-group col-3">
                                        <asp:Label ID="Label1" runat="server" CssClass="Lablestyle" Text="Public Body"></asp:Label>
                                    </div>
                                    <div class="form-group col-9">
                                        <asp:TextBox ID="ddlBranchname" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-row col-12">
                                    <div class="form-group col-3">
                                        <asp:Label ID="Label4" runat="server" CssClass="Lablestyle" Text="Location"></asp:Label>
                                    </div>
                                    <div class="form-group col-9">
                                        <asp:TextBox ID="ddlLocationName" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>

                                    </div>
                                </div>


                                <div class="form-row col-12">
                                    <div class="form-group col-3">
                                        <asp:Label ID="Label2" runat="server" CssClass="Lablestyle" Text="Taxi Plate.No"></asp:Label>
                                    </div>
                                    <div class="form-group col-9">
                                        <asp:TextBox ID="tbTaxiPlateNO" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row col-12">
                                    <div class="form-group col-3">
                                        <asp:Label ID="Label3" runat="server" CssClass="Lablestyle" Text="Description"></asp:Label>
                                    </div>
                                    <div class="form-group col-9">
                                        <asp:TextBox ID="tbDefiantDescription" TextMode="MultiLine" Rows="2" CssClass="form-control" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row col-12">
                                    <div class="form-group col-3">
                                        <asp:Label ID="Label5" runat="server" CssClass="Lablestyle" Text="Recording By:"></asp:Label>
                                    </div>
                                    <div class="form-group col-9">
                                        <asp:TextBox ID="tbRecorderName" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <br />
                        <%--<div class="form-group">
                            <asp:Button ID="btnDefiateSubmition" class="btn btn-danger btn-block" runat="server" Text="Expose" OnClick="btnDefiateSubmition_Click" />
                        </div>--%>

                        <!-- form-group// -->

                    </article>
                    <div class="border-top" style="margin: 3px;">
                        <small class="text-muted"><span style="color: red; text-transform: uppercase;">Note</span>: By selcting the above agreement checkbox you are agreering to take responsibility for any of risk happend at 
                                <span id="spnDescrLocation" runat="server" style="color: royalblue;">None </span>, just for today From <span id="spnDescrtimeInterval" runat="server" style="color: royalblue;"></span>.</small>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

