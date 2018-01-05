using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Entity;
using Web.ORM;

namespace Web.UI
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            SelectedProductGet();
            RelatedProducts(selectedProduct.CategoryID);
        }
   
        public Entity.Products selectedProduct;
        private void SelectedProductGet()
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["pID"]))
                {
                    Response.Redirect("Products.aspx");
                    return;
                }

                ProductORM prodORM = new ProductORM();

                selectedProduct = prodORM.SingleProduct(int.Parse(Request.QueryString["pID"]));
            }
            catch
            {
                Response.Redirect("Products.aspx");
            }
        }
        public List<Entity.Products> RelatedProductsList = new List<Entity.Products>();
        private void RelatedProducts(int categoryID)
        {
            ProductORM prodORM = new ProductORM();
            DataTable dt = prodORM.ProductInCategory(categoryID);
            
            foreach (DataRow item in dt.Rows)
            {
                Entity.Products prod = new Entity.Products
                {
                    ProductID = Convert.ToInt32(item["ProductID"]),
                    ProductName = item["ProductName"].ToString(),
                    Description = item["Description"].ToString(),
                    CategoryID = Convert.ToInt32(item["CategoryID"]),
                    LargePhotoPath = item["LargePhotoPath"].ToString(),
                    UnitPrice = Convert.ToDecimal(item["UnitPrice"]),
                    UnitsInStock = Convert.ToInt32(item["UnitPrice"]),
                    SmallPhotoPath = item["SmallPhotoPath"].ToString()
                };
                RelatedProductsList.Add(prod);
            }

            dtListSinglePopup.DataSource = prodORM.ProductInCategory(categoryID);
            dtListSinglePopup.DataBind();
        }

    }
}