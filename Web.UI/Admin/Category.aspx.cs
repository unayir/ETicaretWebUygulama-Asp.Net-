using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Entity;
using Web.ORM;

namespace Web.UI.Admin
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            CategoryGetList();
        }

        private void CategoryGetList()
        {
            CategoryORM catORM = new CategoryORM();
            rptCategory.DataSource = catORM.List();
            rptCategory.DataBind();
        }
        
        protected void rptCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            bool result = false;
            if (e.CommandName == "btnDelete")
            {
                Button btnDelete = e.Item.FindControl("btnDelete") as Button;
                CategoryORM catORM = new CategoryORM();
                result = catORM.Delete(Convert.ToInt32(btnDelete.CommandArgument));
                if (result)
                {
                    eklemeBilgi.Visible = true;
                    eklemeBilgi.InnerText = "İşleminiz Başarıyla Gerçekleştirildi.";
                    rptCategory.DataSource = catORM.List();
                    rptCategory.DataBind();
                }
                else
                {
                    eklemeBilgi.Visible = true;
                    eklemeBilgi.InnerText = "İşleminiz Gerçekleştirilemedi.";
                }

            }
            else
            {
                Button btnUpdate = e.Item.FindControl("btnUpdate") as Button;
                ViewState["catID"] = btnUpdate.CommandArgument;
                txtCatName.Value = btnUpdate.CommandName;
                btnCategoryEkle.Text = "Güncelle";
            } 
        }
     
        protected void btnCategoryEkle_Click(object sender, EventArgs e)
        {
            CategoryORM catORM = new CategoryORM();
            bool result = false;

            if (btnCategoryEkle.Text == "Güncelle")
            {
                result = catORM.Update(new Categories
                {
                    CategoryID = int.Parse(ViewState["catID"].ToString()),
                    CategoryName = txtCatName.Value
                });       
            }
            else
            {
                result = catORM.Insert(new Categories
                {
                    CategoryName = txtCatName.Value
                });
            }

            if (result)
            {
                eklemeBilgi.Visible = true;
                eklemeBilgi.InnerText = "İşleminiz Başarıyla Gerçekleştirildi.";
                rptCategory.DataSource = catORM.List();
                rptCategory.DataBind();
            }
            else
            {
                eklemeBilgi.Visible = true;
                eklemeBilgi.InnerText = "İşleminiz Gerçekleştirilemedi.";
            }        
        }
    }
}