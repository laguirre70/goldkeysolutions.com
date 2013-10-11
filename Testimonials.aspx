<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Testimonials.aspx.cs" Inherits="TestimonialsPage" Title="Gold Key Solutions, Inc: Testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Testimonials</div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <ul class="list-of-links">
                <li class="current"><a href="Testimonials.aspx">Client Testimonials</a></li>
            </ul>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h1>
                Why Our Customers Love The Concierge Assistant®</h1>
            <hr />
            <%--Data Source Controls--%>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAllTestimonials"
                TypeName="Testimonials"></asp:ObjectDataSource>
            <asp:GridView ID="GridViewAllNews" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
                BorderWidth="0" BorderColor="white" OnRowCreated="GridViewAllNews_RowCreated">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <blockquote>
                                <h2>
                                    <%# Eval("Title").ToString() %>
                                </h2>
                                <%# Eval("Date").ToString() %>
                                <asp:Image ID="ImageNewsItem" runat="server" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>'
                                    AlternateText='<%# (string)Eval("ImageAltText")%>' CssClass="photo-border photo-float-left" />
                                <p>
                                    <br />
                                    <%# Eval("Content")%>
                                </p>
                            </blockquote>
                            <br />
                            <p>
                                <i>
                                    <%# Eval("Testifier")%>
                                    <br />
                                    <%# Eval("testifierTitle")%>
                                    <br />
                                    <%#Eval("TestifierCompany") %>
                                </i>
                            </p>
                            <hr />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
                The World is Their Oyster</h3>
            <p>
                To say that Resident Owners of a customized 12-deck ship are accustomed to a very
                high level of personal service is an understatement. “CA is a great tool because
                we have hundreds and hundreds of variables that our Resident Owners list as preferences,”
                said Leger. “These may be preferred transportation, currency, hobbies, flower preferences,
                and how they want their apartments prepared prior to their arrival. We input these
                in our Concierge Assistant database for each Resident and update the information
                through regularly distributed questionnaires and onboard meetings.”
            </p>
            <h3 class="small">
                A bride in panic!</h3>
            <p>
                A bride was in a panic and needed a last minute alteration on her wedding dress
                the night before the wedding. The Concierge team used the system’s services database
                to find a seamstress that worked all night and the next day the bride had the wedding
                of her dreams in her custom tailored wedding dress that fit her like a glove.
            </p>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
