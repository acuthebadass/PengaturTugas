using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PengaturTugas.App_Code.DAL.Classes
{
    [Serializable]
    public class Task
    {
        public string TaskCode { get; set; }
        public string TaskName { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime TaskDueDate { get; set; }
        public string PersonInCharge { get; set; }
        public int ReminderInterval { get; set; }
        public string Tanda { get; set; }
        public string TandaTangan { get; set; }
        public string Status { get; set; }
        public string Kode { get; set; }
        public string FU { get; set; }
        public DateTime RepeatingDate { get; set; }
    }
}