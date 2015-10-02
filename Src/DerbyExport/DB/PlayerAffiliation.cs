using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerbyExport.DB
{
    public class PlayerAffiliation
    {
        public int PlayerId { get; set; }
        public string League { get; set; }
        public string DerbyName { get; set; }
        public string Number { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpiryDate { get; set; }
    }
}