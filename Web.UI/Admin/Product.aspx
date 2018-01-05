<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Web.UI.Admin.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <!-- TABLE STRIPED -->
            <div class="panel-heading">                               
                <asp:Button ID="btnNewProduct" runat="server" CssClass="btn btn-default" Text="Yeni Ürün" OnClick="btnNewProduct_Click" />
            </div>
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Kategori Adı </th>
                            <th>Açıklama</th>
                            <th>Kategori</th>
                            <th>Fiyat</th>
                            <th>Stok</th>
                            <th>Fotoğraf</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptProduct" runat="server" ViewStateMode="Enabled" OnItemCommand="rptProduct_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductID") %></td>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("Description") %></td>
                                    <td><%# Eval("CategoryName") %></td>
                                    <td><%# Eval("UnitPrice") %></td>
                                    <td><%# Eval("UnitsInStock") %></td>
                                    <td><%# Eval("SmallPhotoPath") %></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnUpdate" runat="server" Text="Güncelle" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("ProductID") %>' CommandName="btnUpdate" />
                                    </td>
                                    <td>

                                        <asp:Button ID="btnDelete" runat="server" Text="Sil" CssClass="btn btn-danger" CommandArgument='<%# Eval("ProductID") %>' CommandName="btnDelete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <!-- END TABLE STRIPED -->
        </div>
</asp:Content>
