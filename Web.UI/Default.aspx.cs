using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.ORM;
using Web.Entity;

namespace Web.UI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;

            
            GetNewProducts();
            BrandsGetList();
        }
        private void GetNewProducts()
        {
            ProductORM prodORM = new ProductORM();
            dtListNewProducts.DataSource = prodORM.GetNewProducts();
            dtListNewProducts.DataBind();
            dtListSingleProduct.DataSource = prodORM.GetNewProducts();
            dtListSingleProduct.DataBind();
        }
        private void BrandsGetList()
        {
            BrandORM brandORM = new BrandORM();
            rptBrands.DataSource = brandORM.List();
            rptBrands.DataBind();
        }
    }
}