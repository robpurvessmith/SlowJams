using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerbyExport.DB
{
    public class PlayerImport
    {
        public DateTime GameDateTime { get; set; }
        public string League { get; set; }
        public string Team { get; set; }
        public string DerbyName { get; set; }
        public string Number { get; set; }
        public int PlayerId { get; set; }
    }
}