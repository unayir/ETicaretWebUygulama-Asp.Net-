using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.Entity;

namespace Web.ORM
{
    public class CategoryORM : ORMBase<Categories>
    {
        public bool ProductsOfCategoryDelete(int categoryID)
        {
            SqlCommand cmd = new SqlCommand("pr_ProductsOfCategory_Delete", Tools.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CategoryID", categoryID);
            return Tools.ExecuteNonQuery(cmd);
        }
    }
}
