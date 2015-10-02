using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerbyExport.DB
{
    public class PenaltyImport
    {
        public DateTime GameDateTime { get; set; }
        public short Period { get; set; }
        public short Jam { get; set; }
        public string Team { get; set; }
        public string PlayerNumber { get; set; }
        public short PenaltyId { get; set; }
        public string PenaltyType { get; set; }
        public string PenaltyName { get; set; }
    }
}
