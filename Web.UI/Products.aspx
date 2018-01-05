<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Web.UI.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- breadcrumbs -->
    <div class="breadcrumb_dress">
        <div class="container">
            <ul>
                <li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Anasayfa</a> <i>/</i></li>
                <li>Ürünler</li>
            </ul>
        </div>
    </div>
    <!-- //breadcrumbs -->
    <!-- mobiles -->
    <div class="mobiles">
        <div class="container">
            <div class="w3ls_mobiles_grids">
                <div class="col-md-4 w3ls_mobiles_grid_left">
                    <div class="w3ls_mobiles_grid_left_grid">
                        <h3>Kategoriler</h3>
                        <div class="w3ls_mobiles_grid_left_grid_sub">
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="headingOne">
                                        <h4 class="panel-title asd">
                                            <a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span><i class="glyphicon glyphicon-minus" aria-hidden="true"></i>Kategoriler
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                        <div class="panel-body panel_text">
                                            <ul>
                                                <asp:Repeater ID="rptCategory" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href='<%# ResolveClientUrl("Products.aspx?cID=" + Eval("CategoryID")) %>'><%# Eval("CategoryName") %></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 w3ls_mobiles_grid_right">
                    <div class="clearfix"></div>
                    <div class="w3ls_mobiles_grid_right_grid3">
                        <asp:DataList ID="dtListProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="col-md-4 agileinfo_new_products_grid agileinfo_new_products_grid_mobiles">
                                    <div class="agile_ecommerce_tab_left mobiles_grid">
                                        <div class="hs-wrapper hs-wrapper2">
                                            <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                            <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                            <img src='<%# Eval("LargePhotoPath") %>' alt=" " class="img-responsive" />
                                            <div class="w3_hs_bottom w3_hs_bottom_sub1">
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
                                                <button type="submit" class="w3ls-cart">Sepet</button>
                                                <br />
                                                <br />
                                            </form>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <br />
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- Single Page -->
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
    <!-- //Single Page -->
</asp:Content>
