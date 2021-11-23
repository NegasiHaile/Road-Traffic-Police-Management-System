<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
         <input type="text" id="txtPopupValue" />
         <button onclick="javascript:return OpenPopup()">Select Item</button>
         <script>
              function OpenPopup() {
                  window.open("popup.aspx", "List", "scrollbars=no, resizable=no, width=400, height=280;");
                   return false;
              }
         </script>



    </div>


        <div>
                    <table border="0" cellpadding="0" cellspacing="0">
       <tr>
           <td>
               Name:
           </td>
           <td>
               <asp:Label ID="lblName" runat="server" Text="[No Name]" />
           </td>
           <td>
               <asp:Button Text="Select Name" runat="server" OnClientClick="return SelectName()" />
           </td>
       </tr>
   </table>
   <script type="text/javascript">
       var popup;
       function SelectName() {
           popup = window.open("Popup.aspx", "Popup", "width=100,height=100");
           popup.focus();
           return false
       }
   </script>
        </div>
    </form>
</body>
</html>
