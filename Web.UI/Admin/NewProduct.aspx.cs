using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.ORM;
using Web.Entity;

namespace Web.UI.Admin
{
    public partial class NewProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            CategoryList();
            ProductUpdateItem();
        }

        private void CategoryList()
        {
            CategoryORM catORM = new CategoryORM();
            drpCategory.DataSource = catORM.List();
            drpCategory.DataTextField = "CategoryName";
            drpCategory.DataValueField = "CategoryID";
            drpCategory.DataBind();
        }

        private void ProductUpdateItem()
        {
            if (Session["ProductID"] != null)
            {
                ProductORM prodORM = new ProductORM();
                Entity.Products prod = prodORM.SingleProduct(Convert.ToInt32(Session["ProductID"]));
                txtProductName.Value = prod.ProductName;
                txtProductAciklama.Value = prod.Description;
                txtProductPrice.Value = prod.UnitPrice.ToString();
                txtProductUnitsInStock.Value = prod.UnitsInStock.ToString();
                for (int i = 0; i < drpCategory.Items.Count; i++)
                {
                    if (drpCategory.Items[i].Value == prod.CategoryID.ToString())
                    {
                        drpCategory.Items[i].Selected = true;
                    }
                }
                btnProductInsert.Text = "Güncelle";
            }
        }

        protected void btnProductInsert_Click(object sender, EventArgs e)
        {
            try
            {
                bool result = false;
                if (btnProductInsert.Text == "Güncelle")
                {
                    Entity.Products prod = new Entity.Products
                    {
                        ProductID = Convert.ToInt32(Session["ProductID"]),
                        ProductName = txtProductName.Value,
                        Description = txtProductAciklama.Value,
                        UnitPrice = Convert.ToDecimal(txtProductPrice.Value),
                        UnitsInStock = int.Parse(txtProductUnitsInStock.Value),
                        CategoryID = int.Parse(drpCategory.SelectedItem.Value),
                        SmallPhotoPath = "Content/User/images/small/" + photoUpload.FileName,
                        LargePhotoPath = "Content/User/images/large/" + photoUpload.FileName
                    };
                    ProductORM prodORM = new ProductORM();
                    result = prodORM.Update(prod);
                    photoUpload.SaveAs(Server.MapPath("~/Content/User/images/large/" + photoUpload.FileName));
                    
                }
                else
                {
                    Entity.Products prod = new Entity.Products
                    {
                        ProductName = txtProductName.Value,
                        Description = txtProductAciklama.Value,
                        UnitPrice = Convert.ToDecimal(txtProductPrice.Value),
                        UnitsInStock = int.Parse(txtProductUnitsInStock.Value),
                        CategoryID = int.Parse(drpCategory.SelectedItem.Value),
                        SmallPhotoPath = "Content/User/images/small/" + photoUpload.FileName,
                        LargePhotoPath = "Content/User/images/large/" + photoUpload.FileName
                    };
                    ProductORM prodORM = new ProductORM();
                    result = prodORM.Insert(prod);
                    photoUpload.SaveAs(Server.MapPath("~/Content/User/images/large/" + photoUpload.FileName));             
                }
              
                if (result)
                {
                    eklemeBilgi.Visible = true;
                    eklemeBilgi.InnerText = "İşleminiz Başarıyla Gerçekleştirildi.";
                }
                else
                {
                    eklemeBilgi.Visible = true;
                    eklemeBilgi.InnerText = "İşleminiz Gerçekleştirilemedi.";
                }
            }
            catch
            {
            }           
        }
    }
}