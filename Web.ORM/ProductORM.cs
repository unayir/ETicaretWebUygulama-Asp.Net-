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
    public class ProductORM : ORMBase<Products>
    {
        public DataTable ProductInCategory(int categoryID)
        {
            SqlDataAdapter adap = new SqlDataAdapter("pr_ProductInCategory_List", Tools.Connection);
            adap.SelectCommand.CommandType = CommandType.StoredProcedure;
            adap.SelectCommand.Parameters.AddWithValue("@CategoryID", categoryID);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            return dt;
        }
        public DataTable ProductSearch(string searchText)
        {
            SqlDataAdapter adap = new SqlDataAdapter("pr_Product_Search", Tools.Connection);
            adap.SelectCommand.CommandType = CommandType.StoredProcedure;
            adap.SelectCommand.Parameters.AddWithValue("@text", searchText);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            return dt;
        }
        public DataTable GetNewProducts()
        {
            SqlDataAdapter adap = new SqlDataAdapter("pr_NewProducts_List", Tools.Connection);
            adap.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            adap.Fill(dt);
            return dt;
        }
        public Products SingleProduct(int selectedID)
        {
            SqlCommand cmd = new SqlCommand("pr_SelectedProduct_List", Tools.Connection);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ProductID", selectedID);
            cmd.Connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            Products singleProduct = new Products(); 
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                     singleProduct = new Entity.Products
                    {
                        ProductID = Convert.ToInt32(reader["ProductID"]),
                        ProductName = reader["ProductName"].ToString(),
                        Description = reader["Description"].ToString(),
                        CategoryID = Convert.ToInt32(reader["CategoryID"]),
                        LargePhotoPath = reader["LargePhotoPath"].ToString(),
                        UnitPrice = Convert.ToDecimal(reader["UnitPrice"]),
                        UnitsInStock = Convert.ToInt32(reader["UnitsInStock"]),
                        SmallPhotoPath = reader["SmallPhotoPath"].ToString()
                    };
                }
            }
            cmd.Connection.Close();
            return singleProduct;
        }
    }
}
