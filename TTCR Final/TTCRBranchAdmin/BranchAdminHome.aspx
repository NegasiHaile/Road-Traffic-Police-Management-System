<%@ Page Title="" Language="C#" MasterPageFile="~/TTCRBranchAdmin/BranchAdmin.master" AutoEventWireup="true" CodeFile="BranchAdminHome.aspx.cs" Inherits="TTCRBranchAdmin_BranchAdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div class="content">
       <div class="container-fluid">
            <h5 class="description text-center" >Welcome <span style="color:blue;" class="description text-center" id="traffic" runat="server"></span>Adminstrator of <span style="color:blue;" class="description text-center" id="branch" runat="server"></span> Branch of Mekelle City.</h5> 
        
            <p style="color:green" class="description text-center"> Login Successfull <br /> as a Branch Adminstrator</p>
        </div>
    </div>
</asp:Content>

