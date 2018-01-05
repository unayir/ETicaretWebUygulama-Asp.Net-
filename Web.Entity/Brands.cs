using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Entity
{
    public class Brands : EntityBase
    {
        public int BrandID { get; set; }
        public string BrandName { get; set; }
        public string PhotoPath { get; set; }
        public override string PrimaryColumn
        {
            get
            {
                return "BrandID";
            }
        }
    }
}
