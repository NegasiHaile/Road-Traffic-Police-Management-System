<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Loginpage.aspx.cs" Inherits="Loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TTCR Login page</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    
    <link href="css/bootstrap.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet"/>
  
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <img class="wave" src="img/wave.png" />
        <div class="container">

            <div class="img">
                <img src="img/Insertdata.svg" />
            </div>
            <div class="login-content">
                <div class="form">
                    <img src="img/avatar.svg" />
                    <h3 class="title">
                        Welcome</h3>

                    <br />
                    <div class="div">
                        <asp:Label ID="lblLogInError" runat="server" class="alert alert-danger" 
                            Text="User name or password Error, Please try again!"></asp:Label>

                        <br />
                        <div class="input-group mb-2 mr-sm-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i></div>
                            </div>
                            <asp:TextBox ID="tbLogInUserName" onkeypress="return onlyNumberKey(event)" 
                                MaxLength="10" size="50%" runat="server" class="form-control" value="" 
                                placeholder="ቁጥር ስልክ Phone Number"></asp:TextBox>
                        </div>

                    </div>
                    <br />
                    <div class="div">

                        <div class="input-group mb-2 mr-sm-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text"><i class="fa fa-unlock" aria-hidden="true"></i></div>
                            </div>
                            <asp:TextBox ID="tbLogInPassword" TextMode="password" runat="server" 
                                class="form-control" value="" placeholder="የይለፍ ቃል PassWord"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-check">
                        <asp:CheckBox ID="cbLogInRememberPassword" runat="server" TabIndex="3" />
                        <span>Remember me</span>
                    </div>

                    <asp:Button ID="btnLogIn" runat="server" Text="LogIn" value="Login" class="btn " OnClick="btnLogIn_Click1" />
                    <asp:LinkButton ID="LbtnForgatePassword" CssClass="btn-link" runat="server"
                         PostBackUrl="#" TabIndex="6">Forgot Password?</asp:LinkButton>

                </div>
            </div>
            <%--login Content end is here!!!!!!!!!!!!!!!!!--%>
        </div>

        <div class="container-fluid">
            <div class="d-flex justify-content-center">
                <div class="col-8 col-md-12">
                     <div class="card shadow-lg">
                         <div class="card-header">

                         </div>
                         <div class="card-body">
                             <h1> athis is traffic</h1>
                         </div>
                         <div class="card-footer">
                             <a href="#"> forgate password? </a>
                         </div>
                     </div>
                </div>
            </div>
        </div>


    </form>
</body>

    <script type="text/javascript" src="js/main.js"></script>
    <script src="../assets/js/formValidation.js"></script>
</html>
