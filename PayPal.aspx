<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PayPal.aspx.cs" Inherits="PayPal" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


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
                PayPal Payment</h1>
            <hr />

            
<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="5439418">
<p align="center">
<table>
<tr><td><input type="hidden" name="on0" value="Amounts">Amounts</td></tr><tr><td><select name="os0">
	<option value="1">1 $600.00
	<option value="2">2 $1,000.00
	<option value="3">3 $1,200.00
	<option value="4">4 $1,500.00
	<option value="5">5 $1,800.00
	<option value="6">6 $2,000.00
	<option value="7">7 $4,000.00
	<option value="8">8 $5,000.00
</select> </td></tr>
<tr><td><input type="hidden" name="on1" value="Invoice Number">Invoice Number</td></tr><tr><td><input type="text" name="os1" maxlength="60"></td></tr>
<tr><td><input type="hidden" name="on2" value="Company">Company</td></tr><tr><td><input type="text" name="os2" maxlength="60"></td></tr>
</table>
<input type="hidden" name="currency_code" value="USD">
<input type="image" src="https://www.paypal.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
</p>
</form>

               
               
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

