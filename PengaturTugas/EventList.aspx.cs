using PengaturTugas.App_Code.BLL;
using PengaturTugas.App_Code.DAL.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PengaturTugas
{
    public partial class EventList : System.Web.UI.Page
    {
        public static string FormatDateWithTime(object objDate)
        {
            string sResult = "";

            if (objDate != null && objDate != DBNull.Value && !String.IsNullOrEmpty(Convert.ToString(objDate)) && Convert.ToString(objDate) != "-")
                sResult = Convert.ToDateTime(objDate).ToString("dd/MM/yy");

            return sResult;
        }


        #region Variables

        private EventBLL eventBLL = new EventBLL();
        private string sErrorMsg = "";

        #endregion


        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            lstReport.DataBind();
        }

        protected void lstReport_DataBinding(object sender, EventArgs e)
        {
            List<Task> lstObj;

            if (!getDataTable(out lstObj, out sErrorMsg))
            {
                //display error msg
                return;
            }

            lstReport.DataSource = lstObj;
        }

        #endregion


        #region Private Functions

        private bool getDataTable(out List<Task> lstObj, out string sErrorMsg)
        {
            if (!eventBLL.GetTaskByRepeatingDate(
                Convert.ToDateTime(Request.QueryString["date"]),
                out lstObj,
                out sErrorMsg))
            {
                return false;
            }

            return true;
        }

        #endregion


        #region Protected Functions
        
        #endregion
    }
}