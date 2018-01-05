<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewProduct.aspx.cs" Inherits="Web.UI.Admin.NewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-6">
        <h1>Yeni Ürün</h1>
        <hr />
        <input type="text" class="form-control" id="txtProductName" runat="server" placeholder="Ürün Adı" />
        <br />
        <input type="text" class="form-control" id="txtProductAciklama" runat="server" placeholder="Açıklama" />
        <br />
        <asp:DropDownList ID="drpCategory" CssClass="form-control" runat="server">
        </asp:DropDownList>
        <br />
        <input type="text" class="form-control" id="txtProductPrice" runat="server" placeholder="Fiyat" />
        <br />
        <input type="text" class="form-control" id="txtProductUnitsInStock" runat="server" placeholder="Stok Durumu" />
        <br />
        <asp:FileUpload ID="photoUpload" CssClass="btn btn-primary" runat="server" />        
        <br />
        <asp:Button ID="btnProductInsert" CssClass="btn btn-success" runat="server" Text="Ekle" OnClick="btnProductInsert_Click" />
        <br />
        <br />
        <i runat="server" id="eklemeBilgi" visible="false" class="fa fa-check-circle"></i>
    </div>
</asp:Content>
