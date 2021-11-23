<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRDriverArae/DriverArae.master" AutoEventWireup="true" CodeFile="PunishmentConformation.aspx.cs" Inherits="TTCRDriverArae_PunishmentConformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">

    <div class="row justify-content-center">
            <div class="col-md-7" > 
                <div class="card card-user" runat="server" id ="divrecordDetail">
                    <article class="card-body" id="divPunishmentPaper" runat="server">


                        <div style="border: solid 1px gray; padding: 1px; margin: -15px; margin-bottom: 0px; border-radius: 5px;">
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
                                    <p class="fontchange" style="border-bottom: solid 1px black;">RECEIPT VOCHER</p>
                                </div>
                                <div class="form-group col-4">
                                    <p class="fontchange">Sreia: TG/10/A</p>
                                    <p class="fontchange">Date: <span id="spnDate" style="border-bottom: solid 1px gray;" runat="server">25/3/2012</span></p>
                                    <p class="fontchange">Wereda: <span id="spnWereda" style="border-bottom: solid 1px gray;" runat="server">No 03148</span> </p>
                                </div>
                            </div>
                        </div>



                        <div style="border: solid 1px gray; padding: 5px; margin: -15px; margin-top: 0px; border-radius: 5px;">
                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label1" runat="server" CssClass="Lablestyle" Text="Public Body"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbBranchName" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                </div>
                            </div>


                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label2" runat="server" CssClass="Lablestyle" Text="Recieve From"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbDriverLicenseNO" CssClass="textBoxstyle text-capitalize" Style="color: orangered; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required" placeholder="Driver license Number"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:TextBox ID="tbAddressregion" CssClass="form-control textBoxstyle text-capitalize" runat="server" placeholder="Address region"></asp:TextBox>
                                </div>
                                <div class="form-group col-3">
                                    <asp:TextBox ID="tbZone" CssClass="form-control textBoxstyle text-capitalize" runat="server" placeholder="Zone"></asp:TextBox>
                                </div>
                                <div class="form-group col-3">
                                    <asp:TextBox ID="tbWereda" CssClass="form-control textBoxstyle text-capitalize" runat="server" placeholder="Wereda"></asp:TextBox>
                                </div>
                                <div class="form-group col-3">
                                    <asp:TextBox ID="tbKebele" CssClass="form-control textBoxstyle text-capitalize" runat="server" placeholder="Kebele"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label11" runat="server" CssClass="Lablestyle" Text="Taxi Plate.No"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbTaxiPlateNumber" CssClass="textBoxstyle text-capitalize" Style="color: orangered; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-4" style="border: solid 1px black; text-align: center; border-radius: 5px;">
                                    <h5>Way of Payment</h5>
                                    
                                </div>

                                <div class="form-row col-8" style="margin-left: 2px;">
                                    <div class="form-row">
                                        <div class="form-group col-3">
                                            <asp:Label ID="Label6" runat="server" CssClass="Lablestyle" Text="Cash"></asp:Label>
                                        </div>
                                        <div class="form-group col-1">
                                            <asp:RadioButton ID="rbCash" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInCashRefNo" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Check No"></asp:TextBox>

                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInCashDate" TextMode="DateTime" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Date"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-3">
                                            <asp:Label ID="Label7" runat="server" CssClass="Lablestyle" Text="Check"></asp:Label>
                                        </div>
                                        <div class="form-group col-1">
                                            <asp:RadioButton ID="rbCheck" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInCheckrefNo" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Ref.No"></asp:TextBox>

                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInCheckrefDate" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Date"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-3">
                                            <asp:Label ID="Label8" runat="server" CssClass="Lablestyle" Text="Slip"></asp:Label>
                                        </div>
                                        <div class="form-group col-1">
                                            <asp:RadioButton ID="rbSlip" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInSlipRefNo" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Ref.No"></asp:TextBox>

                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInSlipRefDate" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Date"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-3">
                                            <asp:Label ID="Label9" runat="server" CssClass="Lablestyle" Text="Transfer"></asp:Label>
                                        </div>
                                        <div class="form-group col-1">
                                            <asp:RadioButton ID="rbTransfer" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInTransferRefNo" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Ref.No"></asp:TextBox>

                                        </div>
                                        <div class="form-group col-4">
                                            <asp:TextBox ID="tbInTransferRefDate" CssClass="textBoxstyle text-capitalize" runat="server" placeholder="Date"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-row col-12">
                                        <div class="form-group col-5">
                                            <asp:Label ID="Label10" runat="server" CssClass="Lablestyle" Text="Holding"></asp:Label>
                                        </div>
                                        <div class="form-group col-2">
                                            <asp:RadioButton ID="rbHolding" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label3" runat="server" CssClass="Lablestyle" Text="Birr (Figure)"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbAmountInFigure" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label4" runat="server" CssClass="Lablestyle" Text="Birr (Words)"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbAmmountInWords" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label5" runat="server" CssClass="Lablestyle" Text="Purpose"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbPunishmentPurpose" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                </div>
                            </div>
                            <hr />

                            <div class="form-row col-12">
                                <div class="form-group col-3">
                                    <asp:Label ID="Label12" runat="server" CssClass="Lablestyle" Text="Prepare By:"></asp:Label>
                                </div>
                                <div class="form-group col-9">
                                    <asp:TextBox ID="tbpreparedBy" CssClass="textBoxstyle text-capitalize" Style="color: royalblue; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                </div>
                                    <asp:LinkButton ID="lbtnConfirmPunshiment" CssClass="btn btn-block btn-primary textBoxstyle" style="text-align: center" runat="server" OnClick="lbtnConfirmPunshiment_Click">Confrim?</asp:LinkButton>
                            </div>

                        </div>



                        <!-- form-group// -->

                    </article>
                </div>


                <h3 runat="server" id="hShowEmptyMessage"> No unpaid Punishment </h3>
            </div>
        </div>
        
    </div>
</asp:Content>

