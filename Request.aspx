﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Request.aspx.cs" Inherits="Request" Title="Guest Request Portal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li><a href="Contact.aspx">Contact Us</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Sample of Guest Request Portal</h1>
            <hr />
            We integrate our customers website using the Inline Frame (IFrame) technology which
            is just a way of loading one web page (The CA Web Portal controls shown below the
            blue line) inside another website page. This page is hosted at the goldkeysolutions.com
            server but the controls below are hosted at our PCI-DSS CA Web data center as part
            our CA Web Application.
            <hr />
            

            <script type="text/javascript">
function showBorder()
{
document.getElementById("GuestPortaliFrame").frameBorder="1";
}
            
            function removeBorder()
{
document.getElementById("GuestPortaliFrame").frameBorder="0";
}
            </script>

            <input type="button" onclick="showBorder()" value="Show IFrame Border" /><br />
            <br />
            <input type="button" onclick="removeBorder()" value="Hide IFrame Border" /><br />
            <br />
            <a href="https://staging3.gksca.com/guest/Pages/iframe/MyRequest.aspx" target="_blank">
                Show me only the controls hosted at CA Web</a><br />
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
        </div>
        <div class="clear">
        </div>
    </div>
    <div id="videotitle">
        <a name="demo" id="demo"></a>In-Line Frame Demo</div>
    <div id="content-container-video">
        <iframe src="https://staging3.gksca.com/guest/Pages/iframe/myrequest.aspx" width="850"
            height="400" frameborder="0" scrolling="auto" id="GuestPortaliFrame">
            <p>
                Your browser does not support iframes.</p>
        </iframe>
    </div>
</asp:Content>
