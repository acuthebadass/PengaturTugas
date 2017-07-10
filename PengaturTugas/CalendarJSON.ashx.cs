using PengaturTugas.App_Code.BLL;
using PengaturTugas.App_Code.DAL.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PengaturTugas
{
    /// <summary>
    /// Summary description for CalendarJSON
    /// </summary>
    public class CalendarJSON : IHttpHandler
    {
        #region Variables

        private EventBLL eventBLL = new EventBLL();
        private string sErrorMsg = "";

        #endregion

        #region Page Events
        
        #endregion

        #region Private Functions

        #endregion

        #region Protected Functions

        #endregion

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Expires = -1;

            List<Task> lstObj = new List<Task>();
            eventBLL.GetAllTasks(out lstObj, out sErrorMsg);

            IList<CalendarDTO> tasksList = new List<CalendarDTO>();
            foreach (Task obj in lstObj)
            {
                tasksList.Add(new CalendarDTO
                {
                    id = 1,
                    title = obj.TaskName,
                    start = obj.RepeatingDate.ToString("yyyy-MM-dd"),
                    end = obj.RepeatingDate.ToString("yyyy-MM-dd")
                });
            }

            System.Web.Script.Serialization.JavaScriptSerializer oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            string sJSON = oSerializer.Serialize(tasksList);
            context.Response.Write(sJSON);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //private long ToUnixTimespan(DateTime date)
        //{
        //    TimeSpan tspan = date.ToUniversalTime().Subtract(
        //        new DateTime(1970, 1, 1, 0, 0, 0));

        //    return (long)Math.Truncate(tspan.TotalSeconds);
        //}

        public class CalendarDTO
        {
            public int id { get; set; }
            public string title { get; set; }
            public string start { get; set; }
            public string end { get; set; }
            //public string url { get; set; }
        }
    }
}