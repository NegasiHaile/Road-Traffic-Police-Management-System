<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="../assets/img/favicon.ico" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Mekelle city Taxi Traffic Crimes Recoding</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
    <!--     Fonts and icons     -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap.min.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.6/css/fixedHeader.bootstrap4.min.css" />



    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
    <!-- CSS Files -->
    <link href="../fa-5.12.1/css/fontawesome.css" rel="stylesheet" />

    <link href="../assets/css/dataTables.min.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../assets/css/light-bootstrap-dashboard.css?v=2.0.0 " rel="stylesheet" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link href="../fa-5.12.1/css/fontawesome.css" rel="stylesheet" />

    <link href="../css/TrafficRegistratio.css" rel="stylesheet" />
    <link href="../css/bootstrap.css" rel="stylesheet" />

    <link href="../assets/css/demo.css" rel="stylesheet" />
    <link href="../assets/css/Main.css" rel="stylesheet" />

    <style>
        .fontchange {
            text-align: center;
        }

        .textBoxstyle {
            display: inline;
            outline: 0;
            border-width: 0 0 1px;
            border-color: gray;
            font-size: 15px;
            text-align: left;
            width: 100%;
        }

            .textBoxstyle:focus {
                border-color: green;
                border: solid 1px gray;
                padding: 5px;
                border-radius: 5px;
                border-top: none;
            }

        @media screen and (max-width: 576px) {
            .thelogo {
                width: 50px;
            }

            .fontchange {
                font-size: 9px;
                margin: 0px;
                padding: 0px;
            }

            .Lablestyle {
                font-size: 12px;
            }

            .textBoxstyle {
                display: inline;
                outline: 0;
                border-width: 0 0 1px;
                border-color: gray;
                font-size: 9px;
                text-align: left;
                width: 100%;
                margin-left: 0;
                padding: 3px;
                border-radius: 3px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" onsubmit="return NewPasswordValidation()">
        <div class="content" style="padding: 20px 3px;">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <%--  Alert Messages are Here--%>
                    <div>
                        <div class="alert alert-success" runat="server" id="divChangePasswordSuccess">
                            <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span runat="server" id="spndivChangePasswordSuccess">This is a regular notification made with ".alert-primary"</span>
                        </div>

                        <div class="alert alert-danger" runat="server" id="divdivChangePasswordError">
                            <button type="button" runat="server" aria-hidden="true" class="close" data-dismiss="alert">
                                <i class="nc-icon nc-simple-remove"></i>
                            </button>
                            <span runat="server" id="spndivChangePasswordError">This is a regular notification made with ".alert-primary"</span>
                        </div>
                    </div>
                    <%--  Alert Messages Ends Here--%>
                    <div class="card">
                        <div class="card-header ">
                            <header class="card-header">
                                <a href="javascript: history.go(-1)" class="float-left btn btn-outline-primary" title="Get back to the prevous page."><i class="fa fa-backward"></i>Go Back</a>
                                <p class="card-title float-right ml-2"><i class="fa fa-recycle"></i>Change Password!</p>
                            </header>

                        </div>

                        <hr />
                        <article class="card-body justify-content-center">
                            <div>
                                <div class="form-group">
                                    <label>Old Password</label>
                                    <asp:TextBox ID="tbBOldPasswordd" TextMode="Password" runat="server" class="form-control" required="required"></asp:TextBox>
                                </div>

                                <div class="form-group">

                                    <label>Your New Password</label>
                                    <asp:TextBox ID="tbYourNewPassword" TextMode="Password" runat="server" class="form-control" required="required"></asp:TextBox>
                                    <asp:CompareValidator runat="server" CssClass="textBoxstyle" ID="CompareValidator1" Operator="NotEqual" Type="String" ControlToCompare="tbBOldPasswordd"
                                        ControlToValidate="tbYourNewPassword" ForeColor="Red" SetFocusOnError="false" ErrorMessage="New & old password must be different!" />
                                    <asp:RangeValidator ID="RangeValidator1" CssClass="textBoxstyle" ForeColor="Red" ControlToValidate="tbYourNewPassword" MaximumValue="30" MinimumValue="06" Type="String" runat="server"></asp:RangeValidator>
                                    <small runat="server" id="spnshortpassword"></small>
                                    <%-- <asp:CompareValidator runat="server" id="vcNewPssword" Operator="DataTypeCheck" Type="Integer"  ControlToValidate="tbYourNewPassword" ErrorMessage="numbrt only!" />--%>
                                </div>

                                <div class="form-group">
                                    <label>Retaype Password</label>
                                    <asp:TextBox ID="tbRetypePasssword" TextMode="Password" runat="server" class="form-control" required="required"></asp:TextBox>
                                    <asp:CompareValidator runat="server" ID="vcRetypePssword" Operator="Equal" Type="String" ControlToCompare="tbYourNewPassword"
                                        ControlToValidate="tbRetypePasssword" ForeColor="Red" SetFocusOnError="false" ErrorMessage="Password Not match!" />
                                </div>
                                <!-- form-group end.// -->

                                <!-- form-group end.// -->
                                <div class="form-group">
                                    <asp:Button ID="btnChangePassword" CssClass="btn btn-primary btn-block" runat="server" Text="Execute" OnClick="btnChangePassword_Click" OnClientClick="return DeleteConfirmation();" />
                                </div>

                            </div>
                            <!-- form-group// -->


                        </article>
                        <!-- card-body end .// -->
                        <div class="border-top card-body text-center">
                            <small class="text-muted">Pleas make sure new password is retyped correctly!</small>

                        </div>
                    </div>
                    <!-- card.// -->
                </div>
            </div>
        </div>
    </form>

    <script>

        function NewPasswordValidation() {
            var oldpassword = document.getElementById("tbBOldPasswordd").value;
            var firstpassword = document.getElementById("tbYourNewPassword").value;
            var secondpassword = document.getElementById("tbRetypePasssword").value;

            if (oldpassword != firstpassword) {
                if (firstpassword == secondpassword) {
                    if (firstpassword.length >= 6) {
                        //return confirm('Are you sure you want to save the new password!');
                        return true;
                    }

                    else {
                        alert("password is to Short, please add some characters to make it strong!");
                        document.getElementById("RangeValidator1").innerText = "Short PassWord!";
                        return false;
                    }

                }
                else {
                    alert("password must be same!");
                    return false;
                }
            }

            else {
                return false;
            }
        }

        function DeleteConfirmation() {
            return confirm('Are you sure you want to save the new password!');
        }
    </script>
</body>

<script src="../js/bootstrap.js"></script>
<script src="../assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="../assets/js/plugins/chartist.min.js"></script>
\
</html>
