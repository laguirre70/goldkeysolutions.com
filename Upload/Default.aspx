<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Upload_Default" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="Captcha" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GKS Upload Page</title>
</head>
<body>
    <!-- Declaration of server side form.Note the enctype attribute of the form has to be set to multipart/form-data -->
    <form id="FrmFileUploadDemo" name="FrmFileUploadDemo" method="post" enctype="multipart/form-data"
    runat="server">
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" />
    <!--

TOP INFORMATION

-->
    <div id="top-information">
        <div id="logo">
            <a href="Default.aspx">
                <img src="../images/GKS-Long.jpg" alt="Gold Key Solutions, Inc." /></a></div>
        <div id="top-information-home">
            <a href="Default.aspx">Home</a>|<a href="http://tutorial.goldkeysolutions.com">Tutorial</a>|<a
                href="http://support.goldkeysolutions.com">Support</a>
        </div>
        <div id="top-information-phone">
            818-865-0006<br />
            <a href="../Contact.aspx">info@goldkeysolutions.com</a><br />
            <a href="../ContactDemo.aspx">Request Demo</a></div>
    </div>
    <!--

TOP NAV

-->
    <div class="none">
        <a href="#maincontent">skip to the main content area of this page</a></div>
    <div id="nav-main">
        <asp:Menu ID="Menu1" runat="server" DataSourceID="SiteMapDataSource1" Orientation="Horizontal"
            Width="400px" CssClass="menu-main" MaximumDynamicDisplayLevels="0" StaticSelectedStyle-CssClass="StaticSelectedStyle" />
        <div>
            &nbsp;</div>
    </div>
    <a id="maincontent"></a>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li><a href="../Contact.aspx">Contact Us</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Upload Page</h1>
            <hr />
            <h2 align="center">
                File uploading
            </h2>
            <asp:Panel ID="Authenticate" runat="server">
                <table align="center" cellspacing="5">
                    <tr>
                        <td style="width: 155px">
                            <asp:Label ID="Label1" runat="server" Text="Type Password: "></asp:Label><asp:TextBox
                                ID="UpldPwd" runat="server" TabIndex="1"></asp:TextBox>
                        </td>
                        <td style="width: 30px">
                            &nbsp;<asp:RequiredFieldValidator ID="InvalidPwd" runat="server" ControlToValidate="UpldPwd"
                                ErrorMessage="Code is required." ToolTip="Password is required." ValidationGroup="Upld">*</asp:RequiredFieldValidator><br />
                            <asp:Label ID="WrongPwd" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 155px">
                            Type the Code Below:<br />
                            <asp:TextBox ID="CaptchaCode" runat="server" TabIndex="2"></asp:TextBox>
                        </td>
                        <td style="width: 30px">
                            &nbsp;<asp:RequiredFieldValidator ID="Captchainvalid" runat="server" ControlToValidate="CaptchaCode"
                                ErrorMessage="Code is required." ToolTip="Code is required." ValidationGroup="Upld">*</asp:RequiredFieldValidator><br />
                            <asp:Label ID="CaptchaError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 155px; vertical-align: top">
                            <Captcha:CaptchaControl ID="ccJoin" runat="server" CaptchaBackgroundNoise="None"
                                CaptchaLength="4" CaptchaHeight="31" CaptchaWidth="80" CaptchaLineNoise="None"
                                CaptchaMinTimeout="5" CaptchaMaxTimeout="240" CaptchaChars="ABCDEFGHJKLMNPQRSTUVWXYZ23456789#@*"
                                CustomValidatorErrorMessage="The code that you type does not match the image!"
                                FontColor="#818181" BackColor="White" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="UpldAccess" runat="server" Text="Access" OnClick="UpldAccess_Click"
                                ValidationGroup="Upld" TabIndex="3" /><br />
                            <asp:ValidationSummary ID="UpldValidationSummary" runat="server" ValidationGroup="Upld" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="UploadPanel" runat="server" Visible="false">
                <table align="center" cellspacing="5">
                    <tr>
                        <td>
                            <font size="2">Select a file to upload</font>
                            <input type="file" id="File1" name="File1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="2">Select a file to upload</font>
                            <input type="file" id="File2" name="File2" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <font size="2">Select a file to upload</font>
                            <input type="file" id="File3" name="File3" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button value="Upload" Text="Upload" runat="server" ID="CmdUpload" OnClick="UploadFile" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="ResultsPane" runat="server" Visible="false">
                <table align="center" cellspacing="5">
                    <tr>
                        <td>
                            <asp:Label ID="UploadResult1" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="UploadResult2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="UploadResult3" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Button ID="UpldMore" runat="server" Text="Upload More Files" OnClick="UpldMore_Click" />
                            &nbsp;
                            <asp:Button ID="Done" runat="server" Text="Exit File Upload" OnClick="Done_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                Customer quotes</h3>
            <blockquote>
                <p>
                    The system's customization capabilities were extremely important to me,</p>
                <p>
                    <cite><a href="http://www.prweb.com/releases/conciergesoftware/conciergeassistant/prweb1728164.htm"
                        target="_blank">PR Web</a>, December, 10 2008</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    We are providing better service because we have better, faster, more effective communication
                    between departments,
                </p>
                <p>
                    <cite><a href="http://www.hotel-online.com/News/PR2008_4th/Oct08_GroveParkInn.html"
                        target="_blank">PR Web</a>, October 08, 2008</cite></p>
            </blockquote>
            <blockquote>
                <p>
                    manage guest relationships, develop itineraries for guest scheduling for dining,
                    spa and other services to give guests the most personalized attention,</p>
                <cite><a href="http://www.hotel-online.com/News/PR2007_2nd/Jun07_GoldKeyCapella.html"
                    target="_blank">Hotel-Online</a>, June 18, 2007 </cite>
            </blockquote>
        </div>
        <div class="clear">
        </div>
    </div>
    <!--

FOOTER

-->
    <div id="footer">
        Copyright &copy; 2009 Gold Key Solutions, Inc. <a href="../LegalNotice.aspx">Terms of
            Use</a>
        <div>
            &nbsp;</div>
    </div>
    <div id="footer-sub">
        <asp:Menu ID="Menu2" runat="server" DataSourceID="SiteMapDataSource1" Orientation="Horizontal"
            Width="350px" CssClass="menu-main" MaximumDynamicDisplayLevels="0" />
    </div>
    </form>
    <!-- Yahoo! Web Analytics - All rights reserved -->

    <script type="text/javascript" src="http://d.yimg.com/mi/eu/ywa.js"></script>

    <script type="text/javascript">
/*globals YWA*/
var YWATracker = YWA.getTracker("10001795711771");
//YWATracker.setDocumentName("");
//YWATracker.setDocumentGroup("");
YWATracker.submit();
    </script>

    <noscript>
        <div>
            <img src="http://s.analytics.yahoo.com/p.pl?a=10001795711771&amp;js=no" width="1"
                height="1" alt="" /></div>
    </noscript>
    <!-- End of Yahoo! Web Analytics  -->
    <!-- Google Analitics-->

    <script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>

    <script type="text/javascript">
var pageTracker = _gat._getTracker("UA-6194120-1");
pageTracker._trackPageview();
    </script>

    <!-- End of Google Analitics-->
</body>
</html>
