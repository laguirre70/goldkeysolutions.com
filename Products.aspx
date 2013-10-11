<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Items" Title="Gold Key Solutions Inc: Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--

Title Under Menu

-->
    <div id="pagetitle">
        Products</div>
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <h2>
                <a href="Products.aspx">All Products</a></h2>
            <asp:TreeView ID="TreeViewCategories" runat="server" ShowLines="True" ExpandDepth="0"
                LineImagesFolder="~/TreeLineImages" NodeIndent="0" LeafNodeStyle-CssClass="LeafNodesStyle"
                CssClass="TreeView" NodeStyle-CssClass="NodeStyle" ParentNodeStyle-CssClass="ParentNodeStyle"
                RootNodeStyle-CssClass="RootNodeStyle" SelectedNodeStyle-CssClass="SelectedNodeStyle"
                LeafNodeStyle-Width="100%" NodeStyle-Width="100%" ParentNodeStyle-Width="100%"
                RootNodeStyle-Width="100%" SelectedNodeStyle-Width="100%">
                <Nodes>
                    <asp:TreeNode Text="All Items" SelectAction="Expand" PopulateOnDemand="True" Value="All Items">
                        <asp:TreeNode Text="New Node" Value="New Node" SelectAction="Expand" PopulateOnDemand="True">
                        </asp:TreeNode>
                    </asp:TreeNode>
                </Nodes>
                <%--<HoverNodeStyle ForeColor="RoyalBlue" />--%>
                <SelectedNodeStyle BackColor="Transparent" CssClass="SelectedNodeStyle" Width="100%" />
                <RootNodeStyle Font-Bold="True" Font-Size="Larger" HorizontalPadding="5px" CssClass="RootNodeStyle"
                    Width="100%" />
                <ParentNodeStyle CssClass="ParentNodeStyle" Width="100%" />
                <LeafNodeStyle CssClass="LeafNodesStyle" Width="100%" />
                <NodeStyle CssClass="NodeStyle" Width="100%" />
            </asp:TreeView>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <h2>
                <asp:Label ID="LabelCurrentCategory" runat="server" Visible="true" Text=""></asp:Label></h2>
            <asp:Panel ID="PanelCategories" runat="server" Visible="true">
                &nbsp;<asp:ObjectDataSource ID="ObjectDataSourceCategories" runat="server" SelectMethod="GetChildCategories"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="parentCategoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False"
                    AllowPaging="true" PageSize="10" DataSourceID="ObjectDataSourceCategories" BorderWidth="0"
                    BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="photo-border photo-float-left" runat="server" Width="90px"
                                    Height="90px" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>' AlternateText='<%#(string)Eval("ImageAltText")%>' />
                                <b>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "Products.aspx?catId=" + (string)Eval("id") %>'> 
                                                                            <%# Eval("Title").ToString()%>
                                    </asp:HyperLink>
                                </b>
                                <br />
                                <%#Eval("Description").ToString()%>
                                <br />
                                <br />
                                <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="images/arrow.gif" NavigateUrl='<%# "Products.aspx?catId=" + (string)Eval("id") %>' />
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# "Products.aspx?catId=" + (string)Eval("id") %>'> 
                                    Read More
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
            <!-- Child Items -->
            <asp:Panel ID="PanelItems" runat="server" Visible="false">
                <hr />
                <asp:ObjectDataSource ID="ObjectDataSourceItems" runat="server" SelectMethod="GetChildItems"
                    TypeName="Catalog">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="categoryId" QueryStringField="catId" Type="string"
                            DefaultValue="" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" AllowPaging="true"
                    PageSize="10" DataSourceID="ObjectDataSourceItems" OnRowCreated="GridViewItems_RowCreated"
                    BorderWidth="0" BorderColor="white">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="photo-border photo-float-left" runat="server" Width="90px"
                                    Height="90px" ImageUrl='<%# "images/" + (string)Eval("ImageUrl") %>' AlternateText='<%# (string)Eval("ImageAltText")%>' />
                                <h2>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "ItemDetail.aspx?itemId=" + (string)Eval("Id") %>'> 
                                                                            <%# Eval("Title").ToString()%>
                                    </asp:HyperLink></h2>
                                <br />
                                <%# Eval("Description")%>
                                <br />
                                <img src="images/arrow.gif" alt="arrow" />
                                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "ItemDetail.aspx?itemId=" + (string)Eval("Id") %>'> 
                                            Read More
                                </asp:HyperLink>
                                <hr />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                </asp:GridView>
            </asp:Panel>
            <p align="center">
                <a href="Contact.aspx">Request Info</a> | <a href="ContactDemo.aspx">Schedule Live Demo</a> | <a href="DemoVideo.aspx">View Online Demo</a></p>
        </div>
        <!-- END MAIN COLUMN -->
        <!--

  CONTENT SIDE 2 COLUMN

  -->
        <div id="content-side2-three-column">
            <h3 class="small">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Testimonials.aspx">Our 
                customers say:</asp:HyperLink></h3>
            <blockquote>
                <p>
                    It is an accurate reflection of the trends in our ship-board community, which among
                    other things, makes it easier for us to identify where our attention should be focused
                    to meet and, hopefully, anticipate the needs of our Residents and Guests.”
                </p>
                <p>
                    <cite>Ceci Leger, <a href="http://www.hotel-online.com/News/PR2009_3rd/Aug09_GoldKeyWorld.html"
                        target="_blank">ResidenSea, The World</a></cite></p>
            </blockquote>
            <blockquote>
                <p>
                    It really impresses guests that we provide that scope of information for them in
                    seconds.
                </p>
                <p>
                    <cite>Eddie Rose, <a href="http://www.hotel-online.com/News/PR2008_2nd/Jun08_DelService.html"
                        target="_blank">Hotel del Coronado</a></cite></p>
            </blockquote>
            <blockquote>
                <p>
                    The system prints out driving directions, reservation times and contact information
                    on the spot. Our busy guests always value this because it saves them time.</p>
                <p>
                    <cite>Hameed Jasat, <a href="http://www.hotel-online.com/News/PR2007_4th/Oct07_PeabodyGoldKey.html"
                        target="_blank">Peabody Orlando</a> </cite>
                </p>
            </blockquote>
            <blockquote>
                <p>
                    Superior technology is the perfect complement to Capella’s unsurpassed service standards.</p>
                <p>
                    <cite>Scott Rohm , <a href="http://www.hotel-online.com/News/PR2007_2nd/Jun07_GoldKeyCapella.html"
                        target="_blank">Capella Hotels & Resorts </a></cite>
                </p>
            </blockquote>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
