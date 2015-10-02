using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerbyExport.DB
{
    public class ScoreImport
    {
        public DateTime GameDateTime { get; set; }
        public short Period { get; set; }
        public short Jam { get; set; }
        public string Team { get; set; }
        public string JammerNumber { get; set; }
        public bool LeadJammer { get; set; }
        public bool CalledJam { get; set; }
        public short Passes { get; set; }
        public short Points { get; set; }
        public bool PassOccurred { get; set; }
        public bool IsHomeTeam { get; set; }
    }
}
