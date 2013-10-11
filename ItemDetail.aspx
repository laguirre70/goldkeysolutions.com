<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ItemDetail.aspx.cs" Inherits="ItemDetail" Title="Gold Key Solutions, Inc: Program Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Items</div>
    <div id="content-container-three-column">
        <!--
ixml
  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <h2>
                <a href="Products.aspx">Products</a></h2>
            <ul class="list-of-links">
                <li><a href="Products.aspx?catId=c02">CA Web</a></li>
                <li><a href="Products.aspx?catId=c01">The Concierge Assistant</a></li>
                <li><a href="Products.aspx?catId=c03">Voucher Assistant</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <asp:ObjectDataSource ID="ObjectDataSourceItem" runat="server" SelectMethod="GetItem"
                TypeName="Catalog">
                <SelectParameters>
                    <asp:QueryStringParameter Name="itemId" QueryStringField="itemId" Type="string" DefaultValue="" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" AllowPaging="false"
                BorderWidth="0" BorderColor="white" DataSourceID="ObjectDataSourceItem">
                <Fields>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <h1>
                                <%# Eval("Title").ToString() %>
                            </h1>
                            <br />
                            <asp:Image ID="Image1" CssClass="photo-border" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                AlternateText='<%# (string)Eval("ImageAltText")%>' />
                            <%--<h2>
                                <%# Eval("Price","{0:C}")%>
                            </h2>--%>
                            <br />
                            <%# Eval("Description")%>
                            <br />
                            <br />
                            <%# Eval("Functions") %>
                            <br />
                            <br />
                            <a href="#demo">
                                <%# Eval("Title").ToString() %>
                                Demo</a><img src="images/arrow.gif" alt="" />
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <p align="center">
                <a href="Products.aspx">Return to All Products</a> | <a href="Contact.aspx">Request
                    Info</a> | <a href="ContactDemo.aspx">Request Demo</a></p>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Testimonials.aspx">Our customer rave about our programs</asp:HyperLink></h3>
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
            

  CONTENT SIDE 2 COLUMN VIDEO

  -->
    <div id="videotitle">
        <a name="demo" id="demo"></a>Video Demo</div>
    <div id="content-container-video">
        <asp:DetailsView ID="VideoDetailsView" runat="server" AutoGenerateRows="false" AllowPaging="false"
            BorderWidth="0" BorderColor="white" DataSourceID="ObjectDataSourceItem">
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                        <div id="content-side1-three-column">
                            <h2>
                                <a href="Products.aspx">Products</a></h2>
                            <ul class="list-of-links">
                                <li><a href="Products.aspx?catId=c02">CA Web</a></li>
                                <li><a href="Products.aspx?catId=c01">The Concierge Assistant</a></li>
                                <li><a href="Products.aspx?catId=c03">Voucher Assistant</a></li>
                            </ul>
                        </div>
                        <div id="content-main-three-column">
                            <h1 id="videotitle" runat="server">
                                <%# "Demo of " + Eval("Title").ToString()%>
                            </h1>
                            <hr />
                            <asp:TextBox ID="YouTubeTB" runat="server" Text='<%# (string)Eval("YouTubeID")%>' Visible="false"></asp:TextBox>
                            <asp:Panel ID="PanelYouTube" runat="server">
                                <iframe width="640" height="390" src="http://www.youtube-nocookie.com/embed/<%# (string)Eval("YouTubeID")%>?rel=0"
                                    frameborder="0" allowfullscreen id="youtubeiframe" ></iframe>
                            </asp:Panel>
                        </div>
                        <p align="center">
                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0"
                                width='<%# (string)Eval("VideoWidth")%>' height='<%# (string)Eval("VideoHeight")%>'
                                id='<%# (string)Eval("VideoUrl")%>'>
                                <param name="movie" value='<%# "Videos/" + (string)Eval("VideoUrl") + ".swf"  %>' />
                                <param name="quality" value="best" />
                                <param name="bgcolor" value="#FFFFFF" />
                                <embed src='<%# "Videos/" + (string)Eval("VideoUrl") + ".swf"  %>' quality="best"
                                    bgcolor="#FFFFFF" width='<%# (string)Eval("VideoWidth")%>' height='<%# (string)Eval("VideoHeight")%>'
                                    name='<%# (string)Eval("VideoUrl")%>' align="" type="application/x-shockwave-flash"
                                    pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
                            </object>
                        </p>
                        <br />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
        <p align="center">
            <a href="ContactDemo.aspx">Schedule a live demo of this feature</a><br />
            <br />
            Tel. 818-865-0006
            <br />
            <a href="mailto:info@goldkeysolutions.com/Subject=Demo">info@goldkeysolutions.com</a>
        </p>
    </div>
</asp:Content>
