<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Web.UI.Admin.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
            <div class="col-md-6" style="float: left">
                <!-- TABLE STRIPED -->
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">Kategoriler</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Kategori Adı </th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptCategory" runat="server" ViewStateMode="Enabled" OnItemCommand="rptCategory_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("CategoryID") %></td>
                                            <td><%# Eval("CategoryName") %></td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <asp:Button ID="btnUpdate" runat="server" Text="Güncelle" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("CategoryID") %>' CommandName='<%# Eval("CategoryName") %>' />
                                            </td>
                                            <td>
                                                
                                                <asp:Button ID="btnDelete" runat="server" Text="Sil" CssClass="btn btn-danger" CommandArgument='<%# Eval("CategoryID") %>' CommandName="btnDelete" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </tbody>
                        </table>
                    </div>
                    <!-- END TABLE STRIPED -->
                </div>
            </div>
            <div class="col-md-6" style="float: left">
                <h1>Yeni Kategori</h1>
                <hr />
                <input type="text" class="form-control" id="txtCatName" runat="server" placeholder="Kategori Adı" />
                <br />
                <asp:Button ID="btnCategoryEkle" CssClass="btn btn-success" runat="server" Text="Ekle" OnClick="btnCategoryEkle_Click" />
                <br />
                <br />
                <i runat="server" id="eklemeBilgi" visible="false" class="fa fa-check-circle"></i>
            </div>        
</asp:Content>
