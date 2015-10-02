using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DerbyExport.DB
{
    public class LineupImport
    {
        public DateTime GameDateTime { get; set; }
        public short Period { get; set; }
        public short Jam { get; set; }
        public string Team { get; set; }
        public string JammerNumber { get; set; }
        public string JammerBox { get; set; }
        public short JammerPenalties { get; set; }
        public string PivotNumber { get; set; }
        public string PivotBox { get; set; }
        public short PivotPenalties { get; set; }
        public string Blocker1Number { get; set; }
        public string Blocker1Box { get; set; }
        public short Blocker1Penalties { get; set; }
        public string Blocker2Number { get; set; }
        public string Blocker2Box { get; set; }
        public short Blocker2Penalties { get; set; }
        public string Blocker3Number { get; set; }
        public string Blocker3Box { get; set; }
        public short Blocker3Penalties { get; set; }
        public bool PassOccurred { get; set; }
        public bool IsHomeTeam { get; set; }
    }
}
