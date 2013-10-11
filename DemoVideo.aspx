﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DemoVideo.aspx.cs" Inherits="DemoVideo" Title="CA Web Demo" EnableEventValidation="False" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="Captcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        CA Web Demo</div>
    <asp:Panel ID="PanelDemoInfo" runat="server">
        <div id="content-container-three-column">
            <!--

  CONTENT SIDE 1 COLUMN

  -->
            <div id="content-side1-three-column">
                <h3>
                    Corporate Headquaters
                </h3>
                <p>
                    28118 Agoura Road,
                    <br />
                    Suite 202<br />
                    Agoura Hills, CA 91301<br />
                    USA<br />
                    Tel: 818-865-0006
                    <br />
                    Fax: 818-597-2389<br />
                    <a href="mailto:info@GoldKeySolutions.com">info@GoldKeySolutions.com</a>
                </p>
                <ul class="list-of-links">
                    <li class="current"><a href="Contact.aspx">Contact Us</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                    <li><a href="People.aspx">Our Team</a></li>
                </ul>
            </div>
            <!--

  CENTER COLUMN

  -->
            <div id="content-main-three-column">
                <span id="heading">Online Demo Request</span>
                <hr />
                <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    After providing us with your contact information below, you can view a video with
                    the highlights of CA Web.<br />
                    <br />
                    <table style="width: 90%;">
                        <tr>
                            <td style="width: 146px">
                                First Name:<br />
                                <asp:TextBox ID="FnameTBx" runat="server" ValidationGroup="OIR" TabIndex="1"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="FNameRequired" runat="server" ControlToValidate="FnameTBx"
                                    ErrorMessage="First Name is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 155px">
                                &nbsp;Country:<br />
                                <asp:DropDownList ID="CountryDDL" runat="server" Width="170" ValidationGroup="OIR"
                                    TabIndex="7" />
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="CountryRequired" runat="server" ControlToValidate="CountryDDL"
                                    ErrorMessage="Country is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px">
                                &nbsp;Last Name:<br />
                                <asp:TextBox ID="LNameTBx" runat="server" TabIndex="2" ValidationGroup="OIR"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="LNameRequired" runat="server" ControlToValidate="LNameTBx"
                                    ErrorMessage="Last Name is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 155px">
                                &nbsp;State:<br />
                                <asp:DropDownList ID="StateDDL" runat="server" Width="170" ValidationGroup="OIR"
                                    TabIndex="8" />
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px; margin-left: 40px">
                                Email:<br />
                                <asp:TextBox ID="EmailTBx" runat="server" TabIndex="3" ValidationGroup="OIR"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="EmailTBx"
                                    ErrorMessage="Email is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="EmailTBx"
                                    ErrorMessage="A valid email is required" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="OIR">*</asp:RegularExpressionValidator>
                            </td>
                            <td style="width: 155px">
                                Job Function:<br />
                                <asp:DropDownList ID="TitleDDL" runat="server" TabIndex="9" ValidationGroup="OIR">
                                    <asp:ListItem Selected="True" Value="none">Please select one</asp:ListItem>
                                    <asp:ListItem>Concierge</asp:ListItem>
                                    <asp:ListItem>Chef Concierge</asp:ListItem>
                                    <asp:ListItem>Concierge Manager</asp:ListItem>
                                    <asp:ListItem>Guest Services Manager/Director</asp:ListItem>
                                    <asp:ListItem>Front Office Manager</asp:ListItem>
                                    <asp:ListItem>Room Executive</asp:ListItem>
                                    <asp:ListItem>IT/MIS Manager</asp:ListItem>
                                    <asp:ListItem>Controller</asp:ListItem>
                                    <asp:ListItem>Director Of Operations</asp:ListItem>
                                    <asp:ListItem>General Manager</asp:ListItem>
                                    <asp:ListItem>Partner</asp:ListItem>
                                    <asp:ListItem>Owner</asp:ListItem>
                                    <asp:ListItem>Corporate Position</asp:ListItem>
                                    <asp:ListItem>Consultant</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="TitleRequired" runat="server" ControlToValidate="TitleDDL"
                                    ErrorMessage="Title is required." ValidationGroup="OIR" InitialValue="none">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px; margin-left: 40px">
                                Phone:<br />
                                <asp:TextBox ID="PhoneTBx" runat="server" TabIndex="4" ValidationGroup="OIR"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="PhoneRequired" runat="server" ControlToValidate="PhoneTBx"
                                    ErrorMessage="Phone is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 155px">
                                Relationship to GKS:<br />
                                <asp:DropDownList ID="RelTypeDDL" runat="server" ValidationGroup="OIR" TabIndex="10">
                                    <asp:ListItem Value="none" Selected="True">Select one..</asp:ListItem>
                                    <asp:ListItem>Previous User</asp:ListItem>
                                    <asp:ListItem>Customer</asp:ListItem>
                                    <asp:ListItem>Analist/Consultant</asp:ListItem>
                                    <asp:ListItem>Just Looking</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RelationRequired" runat="server" ControlToValidate="RelTypeDDL"
                                    ErrorMessage="Relationship with GKS is required." ValidationGroup="OIR" InitialValue="none">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 146px; margin-left: 40px">
                                Company:<br />
                                <asp:TextBox ID="FirmTBx" runat="server" TabIndex="5" ValidationGroup="OIR"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;
                                <asp:RequiredFieldValidator ID="FirmRequired" runat="server" ControlToValidate="FirmTBx"
                                    ErrorMessage="Company is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
                            </td>
                            <td style="width: 155px">
                                Type the Code Below:<br />
                                <asp:TextBox ID="CaptchaCode" runat="server" TabIndex="11"></asp:TextBox>
                            </td>
                            <td style="width: 30px">
                                &nbsp;<asp:RequiredFieldValidator ID="Captchainvalid" runat="server" ControlToValidate="CaptchaCode"
                                    ErrorMessage="Code is required." ToolTip="Code is required." ValidationGroup="OIR">*</asp:RequiredFieldValidator>
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
                            <td style="width: 30px">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-left: 80px" colspan="4">
                                <br />
                                <ajaxToolkit:CollapsiblePanelExtender ID="cpe" runat="Server" TargetControlID="ContentPanelOptionalInfo"
                                    ExpandControlID="TitlePanelOptionalInfo" CollapseControlID="TitlePanelOptionalInfo"
                                    Collapsed="True" TextLabelID="TitleOptionalInfoLabel" ExpandedText="I want to provide more information."
                                    CollapsedText="I want to provide more information." ImageControlID="DownUpArrowImg"
                                    ExpandedImage="~/images/collapse_blue.jpg" CollapsedImage="~/images/expand_blue.jpg"
                                    SuppressPostBack="true">
                                </ajaxToolkit:CollapsiblePanelExtender>
                                <asp:Panel ID="TitlePanelOptionalInfo" runat="server" CssClass="collapsePanelHeader">
                                    <asp:Image ID="DownUpArrowImg" runat="server" ImageUrl="~/images/expand_blue.jpg" />
                                    &nbsp;&nbsp;
                                    <asp:Label ID="TitleOptionalInfoLabel" runat="server"></asp:Label>
                                </asp:Panel>
                                <asp:Panel ID="ContentPanelOptionalInfo" runat="server" CssClass="collapsePanel">
                                    <b>Optional Information</b><br />
                                    I'm interested in finding more about:
                                    <br />
                                    <asp:TextBox ID="OptionalInfoTB" runat="server" TextMode="MultiLine" Rows="5" Width="350px"
                                        Font-Overline="False" ToolTip="Type what you are interested in finding more about:"></asp:TextBox><br />
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-left: 80px" colspan="4" align="center">
                                <asp:ValidationSummary ID="OIRValidationSummary" runat="server" ValidationGroup="OIR" />
                                <asp:Label ID="CaptchaError" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-left: 80px; text-align: center;" colspan="4">
                                <br />
                                <asp:Button ID="OIRSubmit" runat="server" Text="View Demo" ValidationGroup="OIR"
                                    OnClick="OIRSubmit_Click" TabIndex="12" />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                    <ajaxToolkit:CascadingDropDown ID="CascadingDropDown1" runat="server" TargetControlID="CountryDDL"
                        Category="Country" PromptText="Please select a Country" LoadingText="[Loading Countries...]"
                        ServicePath="CountryService.asmx" ServiceMethod="GetDropDownContents" />
                    <ajaxToolkit:CascadingDropDown ID="CascadingDropDown2" runat="server" TargetControlID="StateDDL"
                        Category="State" LoadingText="[Loading States...]" PromptText="Please select a State"
                        ServiceMethod="GetDropDownContents" ParentControlID="CountryDDL" ServicePath="CountryService.asmx" />
                </div>
            </div>
            <!-- END MAIN COLUMN -->
            <!--

  CONTENT SIDE 2 COLUMN

  -->
            <div id="content-side2-three-column">
                <span id="subheading">Life at Gold Key Solutions</span>
                <p>
                    We innovate in order to inspire and delight. We revel in the “Wow” response. We
                    do this with boundless energy. We invest passion, enthusiasm, reverence and joy
                    in all we do. We are fearless in our pursuit of excellence. We are fast yet attentive,
                    expert while never exclusive. We are responsive, rigorous and respectful. We dream
                    and we create.
                </p>
                <p>
                    We enable your staff to spend more time interacting with your guests and focus less
                    on the time-consuming paperwork of the desk. Your staff is able to better anticipate
                    the needs of your guests by having information that is easily accessible and well
                    organized.
                </p>
            </div>
            <div class="clear">
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="PanelVideo" runat="server" Visible="false">
        <div id="content-container-two-column">
            <!--

CONTENT MAIN COLUMN

-->
            <div id="content-main-two-column">
                <div id="containerDiv" style="text-align: center;">
                    <div id="centeredDiv" style="width: 80%; margin: auto; text-align: left;">
                        <iframe width="560" height="345" src="http://www.youtube-nocookie.com/embed/51nRjfehn_w?rel=0"
                            frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <!--

CONTENT SIDE COLUMN

-->
            <div id="content-side-two-column">
                <h3>
                    Corporate Headquaters
                </h3>
                <p>
                    28118 Agoura Road,
                    <br />
                    Suite 202<br />
                    Agoura Hills, CA 91301<br />
                    USA<br />
                    Tel: 818-865-0006
                    <br />
                    Fax: 818-597-2389<br />
                    <a href="mailto:info@GoldKeySolutions.com">info@GoldKeySolutions.com</a>
                </p>
                <ul class="list-of-links">
                    <li class="current"><a href="Contact.aspx">Contact Us</a></li>
                    <li><a href="About.aspx">About Us</a></li>
                    <li><a href="People.aspx">Our Team</a></li>
                </ul>
            </div>
            <div class="clear">
            </div>
        </div>
    </asp:Panel>
</asp:Content>