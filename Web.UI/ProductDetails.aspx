<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Web.UI.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner -->
    <div class="banner banner10">
        <div class="container">
            <h2>Ürün Sayfası</h2>
        </div>
    </div>
    <!-- //banner -->
    <!-- breadcrumbs -->
    <div class="breadcrumb_dress">
        <div class="container">
            <ul>
                <li><a href="Products.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Ürünler</a><i>/</i></li>
                <li><%= selectedProduct.ProductName %></li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- single -->
    <div class="single">
        <div class="container">
            <div class="col-md-4 single-left">
                <div class="flexslider">
                    <ul class="slides">
                        <li data-thumb='<%= selectedProduct.LargePhotoPath %>'>
                            <div class="thumb-image">
                                <img src='<%= selectedProduct.LargePhotoPath %>' data-imagezoom="true" class="img-responsive" alt="" />
                            </div>
                        </li>
                        <li data-thumb='<%= selectedProduct.LargePhotoPath %>'>
                            <div class="thumb-image">
                                <img src='<%= selectedProduct.LargePhotoPath %>' data-imagezoom="true" class="img-responsive" alt="" />
                            </div>
                        </li>
                        <li data-thumb='<%= selectedProduct.LargePhotoPath %>'>
                            <div class="thumb-image">
                                <img src='<%= selectedProduct.LargePhotoPath %>' data-imagezoom="true" class="img-responsive" alt="" />
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8 single-right">
                <h3><%= selectedProduct.ProductName %></h3>
                <div class="description">
                    <h5><i>Açıklama</i></h5>
                    <p><%= selectedProduct.Description %></p>
                </div>
                <div class="simpleCart_shelfItem">
                    <p><span><%= string.Format("{0:C}", selectedProduct.UnitPrice + 100) %></span> <i class="item_price"><%= string.Format("{0:C}", selectedProduct.UnitPrice) %></i></p>
                    <form action="#" method="post">
                        <input type="hidden" name="cmd" value="_cart" />
                        <input type="hidden" name="add" value="1" />
                        <input type="hidden" name="w3ls_item" value='<%= selectedProduct.ProductName %>' />
                        <input type="hidden" name="amount" value='<%= selectedProduct.UnitPrice %>' />
                        <button type="submit" class="w3ls-cart">Sepete Ekle</button>
                    </form>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- Related Products -->
    <div class="w3l_related_products">
        <div class="container">
            <h3>Benzer Ürünler</h3>
            <ul id="flexiselDemo2">

                <%foreach (var item in RelatedProductsList)
                    {%>
                <li>
                    <div class="w3l_related_products_grid">
                        <div class="agile_ecommerce_tab_left mobiles_grid">
                            <div class="hs-wrapper hs-wrapper3">
                                <img src='<%= item.LargePhotoPath %>' alt=" " class="img-responsive" />
                                <img src='<%= item.LargePhotoPath %>' alt=" " class="img-responsive" />
                                <img src='<%= item.LargePhotoPath %>' alt=" " class="img-responsive" />
                                <img src='<%= item.LargePhotoPath %>' alt=" " class="img-responsive" />
                                <img src='<%= item.LargePhotoPath %>' alt=" " class="img-responsive" />
                                <div class="w3_hs_bottom">
                                    <div class="flex_ecommerce">
                                        <a href="#" data-toggle="modal" data-target='<%= "#" + item.ProductID %>'><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></a>
                                    </div>
                                </div>
                            </div>
                            <h5><a href='<%= ResolveClientUrl("ProductDetails.aspx?pID=" + item.ProductID) %>'><%= item.ProductName %></a></h5>
                            <div class="simpleCart_shelfItem">
                                <p class="flexisel_ecommerce_cart"><span></span><i class="item_price"><%= string.Format("{0:C}", item.UnitPrice) %></i></p>
                                <form action="#" method="post">
                                    <input type="hidden" name="cmd" value="_cart" />
                                    <input type="hidden" name="add" value="1" />
                                    <input type="hidden" name="w3ls_item" value='<%= item.ProductName %>' />
                                    <input type="hidden" name="amount" value='<%= item.UnitPrice %>' />
                                    <button type="submit" class="w3ls-cart">Sepete Ekle</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </li>

                <% } %>
            </ul>
            <script type="text/javascript">
                $(window).load(function () {
                    $("#flexiselDemo2").flexisel({
                        visibleItems: 4,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 1
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 2
                            },
                            tablet: {
                                changePoint: 768,
                                visibleItems: 3
                            }
                        }
                    });

                });
            </script>
            <script type="text/javascript" src="Content/User/js/jquery.flexisel.js"></script>
        </div>
    </div>
    <!-- //Related Products -->
    <asp:DataList ID="dtListSinglePopup" runat="server">
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
    <!-- //single -->
</asp:Content>
