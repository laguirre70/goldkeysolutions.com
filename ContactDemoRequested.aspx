<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ContactDemoRequested.aspx.cs" Inherits="DemoRequested" Title="Gold Key Solutions, Inc: Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Contact</div>
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
            <span id="heading">Online Information Request</span>
            <hr />
            <div>
                Your Information has been submited!
                <br />
                <p>
                    You will be contacted within 48 hours</p>
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
</asp:Content>
