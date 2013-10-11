<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="RemoteSupport.aspx.cs" Inherits="RemoteSupport" Title="Gold Key Solutions, Inc: Legal Notice" %>

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
                <li><a href="About.aspx">About Us</a></li>
                <li><a href="People.aspx">Our Team</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Remote Support Access</h1>
            <hr />
            
           <script type="javascript" 
            src="https://goldkeysolutions.webex.com/goldkeysolutions/sc30/t.php?
            action=join&event=generate&backurl="></script>

            
                
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h2>
                Recent News</h2>
            <ul class="list-of-links no-lines">
                <li><a href="News.aspx?newsId=22">Five Diamond Venetian Resort-Hotel-Casino in Las Vegas
                    Romances Guests with High Tech Concierge System</a></li>
                <li><a href="News.aspx?newsId=21">New Caribbean Luxury Destination Reaches for the Stars
                    with High-Touch Service</a></li>
                <li><a href="News.aspx?newsId=20">Legend Alive at The Grove Park Inn</a></li>
                <li><a href="News.aspx?newsId=19">A 120-Year History of Service to the Stars Sets the
                    Scene for Tradition at San Diego’s famed Hotel del Coronado</a></li>
                <li><a href="News.aspx?newsId=18">Staff utilizes The Concierge Assistant® software to
                    deliver superlative service in a luxury environment</a></li>
            </ul>
            <h2>
                Products</h2>
            <ul class="list-of-links no-lines">
                <li><a href="Products.aspx?catId=c02">CA Web</a></li>
                <li><a href="Products.aspx?catId=c01">The Concierge Assistant</a></li>
                <li><a href="Products.aspx?catId=c03">Voucher Assistant</a></li>
            </ul>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
