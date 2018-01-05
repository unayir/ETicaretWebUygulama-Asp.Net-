<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.UI.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- new-products -->
    <div class="new-products">
        <div class="container">
            <h3>Yeni Ürünler</h3>
            <div class="agileinfo_new_products_grids">
                <asp:DataList ID="dtListNewProducts" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-md-3 agileinfo_new_products_grid">
                            <div class="col-md-3 agileinfo_new_products_grid">
                                <div class="agile_ecommerce_tab_left agileinfo_new_products_grid1">
                                    <div class="hs-wrapper hs-wrapper1">
                                        <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                        <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                        <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                        <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                        <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                        <div class="w3_hs_bottom w3_hs_bottom_sub">
                                            <ul>
                                                <li>
                                                    <a href="#" data-toggle="modal" data-target='<%# "#" + Eval("ProductID") %>'><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <h5><a href='<%# ResolveClientUrl("ProductDetails.aspx?pID=" + Eval("ProductID")) %>'><%# Eval("ProductName") %></a></h5>
                                    <div class="simpleCart_shelfItem">
                                        <p><span><%# string.Format("{0:C}", Convert.ToInt32(Eval("UnitPrice")) + 100) %></span> <i class="item_price"><%# string.Format("{0:C}", Eval("UnitPrice")) %></i></p>
                                        <form action="#" method="post">
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="w3ls_item" value='<%# Eval("ProductName") %>' />
                                            <input type="hidden" name="amount" value='<%# Eval("UnitPrice") %>' />
                                            <button type="submit" class="w3ls-cart">Sepete Ekle</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
    <!-- Single Page -->
    <asp:DataList ID="dtListSingleProduct" runat="server">
        <ItemTemplate>
            <div class="modal video-modal fade" id='<%# Eval("ProductID") %>' tabindex="-1" role="dialog" aria-labelledby="myModal9">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <section>
                            <div class="modal-body">
                                <div class="col-md-5 modal_body_left">
                                    <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                </div>
                                <div class="col-md-7 modal_body_right">
                                    <h4><%# Eval("ProductName") %></h4>
                                    <p>
                                        <%# Eval("Description") %>
                                    </p>
                                    <div class="modal_body_right_cart simpleCart_shelfItem">
                                        <p><span><%# string.Format("{0:C}", Convert.ToInt32(Eval("UnitPrice")) + 100) %></span> <i class="item_price"><%# string.Format("{0:C}", Eval("UnitPrice")) %></i></p>
                                        <form action="#" method="post">
                                            <input type="hidden" name="cmd" value="_cart" />
                                            <input type="hidden" name="add" value="1" />
                                            <input type="hidden" name="w3ls_item" value='<%# Eval("ProductName") %>' />
                                            <input type="hidden" name="amount" value='<%# Eval("UnitPrice") %>' />
                                            <button type="submit" class="w3ls-cart">Sepete Ekle</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <!-- //Single Page -->
    <!-- //new-products -->
    <!-- top-brands -->
    <div class="top-brands">
        <div class="container">
            <h3>Markalar</h3>
            <div class="sliderfig">
                <ul id="flexiselDemo1">
                    <asp:Repeater ID="rptBrands" runat="server">
                        <ItemTemplate>
                            <li>
                                <img src='<%# Eval("PhotoPath") %>' alt=" " class="img-responsive" />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
    </div>
    <!-- //top-brands -->
</asp:Content>
