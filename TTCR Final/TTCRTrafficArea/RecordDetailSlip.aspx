<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="RecordDetailSlip.aspx.cs" Inherits="TTCRTrafficArea_RecordDetailSlip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content" >
        <div class="row  justify-content-center" style="padding: 20px 1px;">
               
                    <div class="col-md-8">
                        <div class="card card-user">
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
                                            <p class="fontchange">ኣብ ብሄራዊ ክልላዊ መንግስቲ ትግራይ</p>
                                            <p class="fontchange">Regional National Regional Government</p>
                                            <p class="fontchange">ብሮ ትልምን ፋይናንስን</p>
                                            <p class="fontchange">Bureau of Plan and Finance</p>
                                            <p class="fontchange" style="border-bottom: solid 1px gray;">RECEIPT VOCHER</p>
                                        </div>
                                        <div class="form-group col-4">
                                            <p class="fontchange">ሰሪ  ት/10/ሀ</p>
                                            <p class="fontchange">Sreia: TG/10/A</p>
                                            
                                            <p class="fontchange mt-3">ዕለት/Date: <span id="spnDate" style="border-bottom: solid 1px gray;" runat="server">25/3/2012</span></p>
                                            <p class="fontchange">ወረዳ/Wereda: <span id="spnWereda" style="border-bottom: solid 1px gray;" runat="server"> ዓይደር</span> </p>
                                        </div>
                                    </div>
                                </div>



                                <div style="border: solid 1px gray; padding: 5px; margin: -15px; margin-top: 0px; border-radius: 5px;">
                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label1" runat="server" CssClass="Lablestyle float-right" Text="ሽም መንግስታዊ ቤት/ፅሕፈት <br> Name of Public Body"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbBranchName" CssClass="textBoxstyle text-capitalize" Style="color: black; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                        </div>
                                    </div>


                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label2" runat="server" CssClass="Lablestyle float-right" Text="ተቐብለ ካብ  Recieve From"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbDriverLicenseNO" CssClass="textBoxstyle text-capitalize" Style="color: orangered; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required" placeholder="Driver license Number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label11" runat="server" CssClass="Lablestyle float-right" Text="ታርጋ ቑፅሪ ናይ ታክሲ   <br> Taxi Plate.No"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbTaxiPlateNumber" CssClass="textBoxstyle text-capitalize" Style="color: orangered; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
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
                                        <div class="form-group col-3" style="border: solid 1px black; text-align: center; border-radius: 5px;">
                                            <h5 style="margin-top:30%">ኣታዊ <br /> ዝተገበረሉ <br /> ሜላ</h5>
                                        </div>

                                        <div class="form-row col-9 ml-1">
                                            <div class="form-row">
                                                <div class="form-group col-3">
                                                    <asp:Label ID="Label6" runat="server" CssClass="Lablestyle float-right" Text="Cash"></asp:Label>
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
                                                    <asp:Label ID="Label7" runat="server" CssClass="Lablestyle float-right" Text="Check"></asp:Label>
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
                                                    <asp:Label ID="Label8" runat="server" CssClass="Lablestyle float-right" Text="Slip"></asp:Label>
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
                                                    <asp:Label ID="Label9" runat="server" CssClass="Lablestyle float-right" Text="Transfer"></asp:Label>
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
                                                <div class="form-group col-3">
                                                    <asp:Label ID="Label10" runat="server" CssClass="Lablestyle float-right" Text="Holding"></asp:Label>
                                                </div>
                                                <div class="form-group col-1">
                                                    <asp:RadioButton ID="rbHolding" CssClass="radio" GroupName="Paymenttype" runat="server" />
                                                </div>
                                                <div class="form-group col-4">
                                                    
                                                </div>
                                                <div class="form-group col-4">
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br /> 

                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label3" runat="server" CssClass="Lablestyle float-right" Text="ገንዘብ ልክዕ ብኣሃዝ ብር <br> Amount in figure Birr"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbAmountInFigure" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label4" runat="server" CssClass="Lablestyle float-right" Text="ገንዘብ ልክዕ ብፊደል ብር <br> Amount in word Birr"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbAmmountInWords" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label5" runat="server" CssClass="Lablestyle float-right" Text="ኣታ ኣታዊ ምኽንያት <br> Incom Purpose"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbPunishmentPurpose" CssClass="textBoxstyle text-capitalize" Style="color: green; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server" required="required"></asp:TextBox>
                                        </div>
                                    </div>
                                    <hr />

                                    <div class="form-row col-12">
                                        <div class="form-group col-4 col-lg-3">
                                            <asp:Label ID="Label12" runat="server" CssClass="Lablestyle float-right" Text="ተቐባሊ ኣካል ሽም <br/> Reciever Name:"></asp:Label>
                                        </div>
                                        <div class="form-group col-8 col-lg-9">
                                            <asp:TextBox ID="tbpreparedBy" CssClass="textBoxstyle text-capitalize" Style="color: royalblue; font-weight: bold; font-family: Cambria; font-size: 12px;" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-row col-12">
                                        <div class="form-row col-7">
                                            <span class="btn  btn-danger textBoxstyle"><span>Payer Confirmation :</span> <span class="text-uppercase" style="text-align: center" runat="server" id="spnPunishmentAgreementStatus"></span></span>
                                        </div>

                                        <div class="form-row col-5 ml-1">
                                            <span class="btn  btn-danger textBoxstyle"><span>Payment :</span> <span class="text-uppercase" style="text-align: center" runat="server" id="spnPaymentStatus"></span></span>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
    </div>
    </div>
</asp:Content>

