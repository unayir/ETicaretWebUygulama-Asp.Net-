using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Entity
{
    public class Products : EntityBase
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public int CategoryID { get; set; }
        public decimal UnitPrice { get; set; }
        public int UnitsInStock { get; set; }
        public string LargePhotoPath { get; set; }
        public string SmallPhotoPath { get; set; }

        public override string PrimaryColumn
        {
            get
            {                
                return "ProductID";
            }
        }
    }
}
