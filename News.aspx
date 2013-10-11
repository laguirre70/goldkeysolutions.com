<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="News.aspx.cs" Inherits="NewsPage" Title="Gold Key Solutions, Inc: News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        News</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="News.aspx">All News</a></li>
            </ul>
            Media Contact:
            <br />
            Julie Keyser-Squires<br />
            Softscribe Inc.<br />
            (404)256-5512
            <br />
            Email:Julie@Softscribeinc.com<br />
            <a href="http://www.softscribeinc.com" target="_blank">www.softscribeinc.com</a>
            <hr />
            <p>
                Follow us in:<br />
            </p>
            <p>
                <a href="http://twitter.com/Gold_Key" target="_blank">
                    <img alt="Twitter Logo" src="images/twitterapi_logo.png" /></a></p>
            <p>
                <a href="http://www.facebook.com/pages/The-Concierge-Assistant-R/99977457301" target="_blank">
                    <img src="images/Fblogo-big.jpg" alt="Facebook logo" /></a></p>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Gold Key Solutions News</h1>
            <hr />
            <!-- END MAIN COLUMN -->
            <asp:Panel ID="AllNewsPanel" runat="server">
                <%--Data Source Controls--%>
                <asp:ObjectDataSource ID="ObjectDataSourceAllNews" runat="server" SelectMethod="GetAllNews"
                    TypeName="News"></asp:ObjectDataSource>
                <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSourceAllNews"
                    AllowPaging="True" PageSize="5" OnRowCreated="GridViewAllNews_RowCreated" BorderWidth="0"
                    BorderColor="white" DataKeyNames="Id">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                    AlternateText='<%# (string)Eval("ImageAltText")%>' Width="160" Height="120" CssClass="photo-border photo-float-left" />
                                <h2>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>'> 
                                    <%# Eval("Title").ToString()%>
                                    </asp:HyperLink>
                                </h2>
                                <p class="news-date">
                                    <%# Eval("Date").ToString()%>
                                </p>
                                <p>
                                    <%# Eval("Content").ToString().PadRight(256,' ').Substring(0, 256) %>
                                </p>
                                <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="images/arrow.gif" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>' />
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "News.aspx?newsId=" + (string)Eval("Id") %>'> 
                                    Read More
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
                <p align="center">
                    <a href="Contact.aspx">Request Info</a> | <a href="ContactDemo.aspx">Request Demo</a></p>
            </asp:Panel>
            <asp:Panel ID="NewsDetailPanel" runat="server" Visible="false">
                <asp:ObjectDataSource ID="ObjectDataSourceNewsDetails" runat="server" SelectMethod="GetNewsItem"
                    TypeName="News">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="newsItemId" QueryStringField="newsId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" AllowPaging="false"
                    BorderWidth="0" BorderColor="white" DataSourceID="ObjectDataSourceNewsDetails">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                    AlternateText='<%# (string)Eval("ImageAltText")%>' Width="160" Height="120" CssClass="photo-border photo-float-left" />
                                <h2>
                                    <%# Eval("Title").ToString()%>
                                </h2>
                                <p class="news-date">
                                    <%# Eval("Date").ToString() %>
                                </p>
                                <p>
                                    <%# Eval("Content").ToString()%>
                                </p>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
                <p align="center">
                    <a href="News.aspx">Return to All News</a> | <a href="Contact.aspx">Request Info</a>
                    | <a href="ContactDemo.aspx">Request Demo</a></p>
            </asp:Panel>
        </div>
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
</asp:Content>
