using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Entity;
using Web.ORM;

namespace Web.UI
{
    public partial class General : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
                return;
         
            CategoryGet();
        }

        public List<Categories> CategoryList { get; set; }
        private void CategoryGet()
        {
            CategoryORM catORM = new CategoryORM();
            rptMenuCategory.DataSource = catORM.List();
            rptMenuCategory.DataBind();
            rptFooterCategory.DataSource = catORM.List();
            rptFooterCategory.DataBind();
        }
    }
}