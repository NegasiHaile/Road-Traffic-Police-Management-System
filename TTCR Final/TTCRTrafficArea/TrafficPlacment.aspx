<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRTrafficArea/TrafficArea.master" AutoEventWireup="true" CodeFile="TrafficPlacment.aspx.cs" Inherits="TTCRTrafficArea_TrafficPlacment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="content" style="padding: 10px 1px;">
        <div class="card-body table-full-width table-responsive">
           

            <div class="row justify-content-center">
                <div class="col-md-7">
                    <div class="card">
                        <article class="card-body">
                            <div style="text-align: center">
                                <p>Kifle Ketema: <span id="spnKifleketema" runat="server" style="color: royalblue; text-decoration: initial underline; font-size: smaller;"> None </span></p>
                                <p>Shift: <span id="spnShift" runat="server" style="color: royalblue; ">None</span> </p>
                                <p>From <span id="spnFromTo" runat="server"  style="color: royalblue; text-decoration: initial underline; font-size: smaller;"></span></p>
                            </div>
                            <hr />
                            <div class="form-row">

                                <div class="col-md-6 px-1">
                                    <div class="form-group">
                                        <label>Placment</label>
                                        <asp:DropDownList ID="ddlLocationName" CssClass="form-control" runat="server" DataTextField="CHOOSE" DataValueField="BACK" required="required">
                                            <asp:ListItem Selected="true" disabled>Not Placed!</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6 px-1">
                                    <div class="form-group" id="Attendance" runat="server">
                                        <label>.</label>
                                        <div>
                                            <asp:CheckBox ID="cbTrafficAttendance" runat="server" Checked="true" />
                                            <asp:Label ID="lblCbTrafficAttendance" runat="server" CssClass="control-label" Text="I am Agree withis placment!"></asp:Label>

                                        </div>
                                    </div>
                                </div>


                            </div>



                            <div class="form-group">
                                <asp:LinkButton ID="lbtnTrafficAttending" class="btn btn-primary btn-block" runat="server" OnClick="lbtnTrafficAttending_Click"> <span class="fa fa-save"></span>Attend</asp:LinkButton>
                            </div>

                            <div class="alert alert-success" runat="server" id="divAttendance">
                                <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                    <i class="nc-icon nc-simple-remove"></i>
                                </button>
                                <span class=""></span>
                                <span runat="server" id="spnAttendanceSuccess">You Attended!"</span>
                            </div>

                        </article>
                        <!-- card-body end .// -->
                        <div class="border-top card-body text-center">
                            <small class="text-muted">  <span style="color:red; text-transform:uppercase;">Note</span>: By selcting the above agreement checkbox you are agreering to take responsibility for any of risk happend at 
                                <span id="spnDescrLocation" runat="server" style="color: royalblue; "> None </span>, just for today From <span id="spnDescrtimeInterval" runat="server"  style="color: royalblue; "></span>.</small>

                        </div>
                    </div>
                    <!-- card.// -->
                </div>
                <!-- col.//-->

            </div>

        </div>
    </div>
</asp:Content>

