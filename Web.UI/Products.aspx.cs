using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Entity;
using Web.ORM;

namespace Web.UI
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (IsPostBack)
                return;

            CategoryGetList();

            string search = Request.Form["Search"];
            if (string.IsNullOrEmpty(search))
            {
                ProductGetList();
            }
            else
            {
                SearchProducts();
            }     
           
        }
        private void SearchProducts()
        {
            ProductORM prodORM = new ProductORM();
            dtListProducts.DataSource = prodORM.ProductSearch(Request.Form["Search"]);
            dtListProducts.DataBind();
        }
        private void ProductGetList()
        {
            try
            {
                ProductORM prodORM = new ProductORM();
                if (string.IsNullOrEmpty(Request.QueryString["cID"]))
                {
                    dtListProducts.DataSource = prodORM.List();
                    dtListProducts.DataBind();
                    dtListSinglePopup.DataSource = prodORM.List();
                    dtListSinglePopup.DataBind();
                }
                else
                {
                    dtListProducts.DataSource = prodORM.ProductInCategory(Convert.ToInt32(Request.QueryString["cID"]));
                    dtListProducts.DataBind();
                    dtListSinglePopup.DataSource = prodORM.ProductInCategory(Convert.ToInt32(Request.QueryString["cID"]));
                    dtListSinglePopup.DataBind();
                }
            }
            catch
            {
                Response.Redirect("Products.aspx");
            }
            
        }
        private void CategoryGetList()
        {
            try
            {
                CategoryORM catORM = new CategoryORM();
                rptCategory.DataSource = catORM.List();
                rptCategory.DataBind();
            }
            catch
            {              
            }           
        }
    }
}