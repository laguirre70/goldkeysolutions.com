<%@ Page Language="C#" MasterPageFile="~/Mobile/mobile.master" AutoEventWireup="true"
    CodeFile="Support.aspx.cs" Inherits="Mobile_Support" Title="GKS-Support" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="LoginPanel" runat="server" Visible="false">
        <div style="text-align: center;">
            Support in not available for mobile devices at this time please contact us at:<br />
            <br />
            Tel: 818-865-0006<br />
            Email:<a href="mailto:info@GoldKeySolutions.com">info@GoldKeySolutions.com</a><br />
            <br />
            <asp:Login ID="SLLogin" runat="server" DestinationPageUrl="Support.aspx"
                DisplayRememberMe="False" UserNameLabelText="Email:">
                <LayoutTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2" style="height: 40px;">
                                            GKS Mobile SL Login<br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Width="180px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="SLLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
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
        </div>
    </asp:Panel>
    <asp:Panel ID="PwdPanel" runat="server" Visible="false">
        <p>
            <asp:Label ID="DisplayPwd" runat="server"></asp:Label>
        </p>
        <asp:Button ID="LogoutBtn" runat="server" Text="Logout" 
            onclick="LogoutBtn_Click" />
    </asp:Panel>
    <asp:Panel ID="NotAuthorized" runat="server" Visible="false">
        <p>
            You are not authorized to view the Support Log!</p>
        
        <asp:LoginStatus ID="LoginStatus2" runat="server" LoginText="" LogoutPageUrl="~/SL.aspx" />
    </asp:Panel>
</asp:Content>
