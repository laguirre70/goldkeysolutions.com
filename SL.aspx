<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SL.aspx.cs" Inherits="SL"
    Title="Support Log" %>

<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>GKS SL-Password</title>
    <meta name="MobileOptimized" />
    <style type="text/css">
        .style1
        {
            height: 38px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; margin-top: 15px">
        <img src="images/GKSmobile-Long.jpg" alt="Gold Key Solutions, Inc." /></div>
    <div>
        <hr />
        <h1>
            Support Log</h1>
        <hr />
        <asp:Panel ID="LoginPanel" runat="server" Visible="false" Font-Size="X-Large">
            <asp:Login ID="SLLogin" runat="server" DestinationPageUrl="~/SL.aspx" DisplayRememberMe="False"
                UserNameLabelText="Email:">
                <LayoutTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2" class="style1">
                                            Log In<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="SLLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="SLLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="SLLogin" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </asp:Panel>
        <asp:Panel ID="PwdPanel" runat="server" Visible="false">
            <p>
                <asp:Label ID="DisplayPwd" runat="server"></asp:Label>
            </p>
            <p>
                <a href="Mobile/Default.aspx">Mobile Home</a>
            </p>
        </asp:Panel>
        <asp:Panel ID="NotAuthorized" runat="server" Visible="false">
            <p>
                You are not authorized to view the Support Log!</p>
            <br />
            <a href="Default.aspx">Home Page</a><br />
            <br />
            <asp:LoginStatus ID="LoginStatus2" runat="server" LoginText="" 
                LogoutPageUrl="~/SL.aspx" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
