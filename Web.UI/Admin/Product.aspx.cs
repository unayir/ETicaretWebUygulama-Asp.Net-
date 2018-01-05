using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.ORM;

namespace Web.UI.Admin
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                return;
            }

            ProductGetList();
        }

        private void ProductGetList()
        {
            ProductORM prodORM = new ProductORM ();
            rptProduct.DataSource = prodORM.List();
            rptProduct.DataBind();
        }

        protected void btnNewProduct_Click(object sender, EventArgs e)
        {
            Server.Transfer("NewProduct.aspx");
        }

        protected void rptProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                bool result = false;
                if (e.CommandName == "btnDelete")
                {
                    Button btnDelete = e.Item.FindControl("btnDelete") as Button;
                    ProductORM prodORM = new ProductORM();
                    result = prodORM.Delete(Convert.ToInt32(btnDelete.CommandArgument));
                    if (result)
                    {
                        rptProduct.DataSource = prodORM.List();
                        rptProduct.DataBind();
                    }
                }
                else if (e.CommandName == "btnUpdate")
                {
                    Session["ProductID"] = e.CommandArgument;
                    Server.Transfer("NewProduct.aspx");

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}