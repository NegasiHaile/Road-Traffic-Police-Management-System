<%@ Page Language="C#" AutoEventWireup="true" CodeFile="popup.aspx.cs" Inherits="popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
     <tr>
          <th> </th>
          <th>Item Name</th>
     </tr>
     <tr>
          <td>
               <input type="submit" value="Select" onclick="javascript:SendValue('Item 1');" />
          </td>
          <td>Item 1</td>
     </tr>
     <tr>
          <td>
               <input type="submit" value="Select" onclick="javascript:SendValue('Item 2');" />
          </td>
          <td>Item 2</td>
     </tr>
</table>
<script>
function SendValue(val) {
     window.opener.document.getElementById("txtPopupValue").value = val;
     window.close();
}
</script>


        <%--in main page for the second div--%>
        <asp:DropDownList ID="ddlNames" runat="server">
        <asp:ListItem Text="Mudassar Khan" Value="Mudassar Khan"></asp:ListItem>
        <asp:ListItem Text="John Hammond" Value="John Hammond"></asp:ListItem>
        <asp:ListItem Text="Mike Stanley" Value="Mike Stanley"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Button Text="Select" runat="server" OnClientClick="return SelectName()" />
    <script type="text/javascript">
        function SelectName() {
            if (window.opener != null && !window.opener.closed) {
                var form = window.opener.document.getElementsByTagName("form")[0];
                var txtName = GetElement(form, "span", "lblName");
                txtName.innerHTML = document.getElementById("ddlNames").value;
            }
            return false;
        }
        function GetElement(parent, tagName, id) {
            var elem = parent.getElementsByTagName(tagName);
            for (var i = 0; i < parent.getElementsByTagName(tagName).length; i++) {
                if (elem[i].id.indexOf(id) != -1) {
                    return elem[i];
                }
            }
            return null;
        }
    </script>
    </div>
    </form>
</body>
</html>
