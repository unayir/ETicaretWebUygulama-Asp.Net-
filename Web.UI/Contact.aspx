<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web.UI.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- breadcrumbs -->
	<div class="breadcrumb_dress">
		<div class="container">
			<ul>
				<li><a href="Default.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Anasayfa</a> <i>/</i></li>
				<li>İletişim</li>
			</ul>
		</div>
	</div>
	<!-- //breadcrumbs --> 
	<!-- mail -->
	<div class="mail">
		<div class="container">
			<h3>İletişim</h3>
			<div class="agile_mail_grids">
				<div class="col-md-5 contact-left">
					<h4>Adres</h4>
					<p>Beşiktaş/
						<span>İstanbul</span></p>
					<ul>
						<li>Telefon No :+90 544 201 28 18</li>
						<li><a href="mailto:umutnayir@hotmail.com">umutnayir@hotmail.com</a></li>
					</ul>
				</div>
				<div class="col-md-7 contact-left">
					<h4>Bize Yazın</h4>
					<form action="#" method="post">
						<input type="text" name="Name" placeholder="İsminiz" required=""/>
						<input type="email" name="Email" placeholder="Mail Adresi" required=""/>
						<input type="text" name="Telephone" placeholder="Telefon No" required=""/>
						<textarea name="message" placeholder="Mesajınız..." required=""/></textarea>
						<input type="submit" value="Gönder"/>
					</form>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //mail -->
</asp:Content>
