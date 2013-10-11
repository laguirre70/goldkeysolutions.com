<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="People.aspx.cs" Inherits="PeoplePage" Title="Gold Key Solutions, Inc: People" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        People</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li><a href="About.aspx">About Us</a></li>
                <li class="current"><a href="People.aspx">Our Employees</a></li>
                <li><a href="About.aspx">Our History</a></li>
                <li><a href="Contact.aspx">Contact Us</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                The Gold Key Solutions Team</h1>
            <hr />
            <%--Data Source Controls--%>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllPersons"
                TypeName="People"></asp:ObjectDataSource>
            <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                AllowPaging="True" PageSize="10" OnRowCreated="GridViewAllNews_RowCreated" BorderWidth="0"
                BorderColor="white">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <hr />
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                AlternateText='<%# (string)Eval("ImageAltText")%>' CssClass="photo-float-left photo-border"
                                Width="100" /><br />
                            <h2>
                                <%# Eval("FirstName").ToString() + " " +  Eval("MiddleName").ToString() + " " + Eval("LastName").ToString() %>
                            </h2>
                            <h3>
                                <i>
                                    <%# Eval("Title")%>
                                </i>
                            </h3>
                            <p>
                                <%# Eval("Description")%></p>
                            <div>
                                <ul>
                                    <li>Phone:
                                        <%#Eval("Phone")%>
                                    </li>
                                    <li>Fax:
                                        <%#Eval("Fax")%>
                                    </li>
                                    <li>Email:
                                        <%# Eval("Email")%>
                                    </li>
                                </ul>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
            </asp:GridView>
            <p align="center">
                <a href="Contact.aspx">Request Info</a> | <a href="ContactDemo.aspx">Request Demo</a></p>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                Life at Gold Key Solutions</h3>
            <p>
                Our products connect knowledge workers in a shared web of information and ideas.
                We innovate in order to inspire and delight. We revel in the “Wow” response. We
                do this with boundless energy. We invest passion, enthusiasm, reverence and joy
                in all we do. We are fearless in our pursuit of excellence. We are fast yet attentive,
                expert while never exclusive. We are responsive, rigorous and respectful. We dream
                and we create.
            </p>
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
        <div class="clear">
        </div>
    </div>
</asp:Content>
