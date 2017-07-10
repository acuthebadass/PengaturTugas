using PengaturTugas.App_Code.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PengaturTugas
{
    public partial class ManageEvent : System.Web.UI.Page
    {
        #region Variables

        private EventBLL eventBLL = new EventBLL();
        private string sErrorMsg = "";

        #endregion

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sTaskCode = txtTaskCode.Text.Trim();
            string sTaskName = txtTaskName.Text.Trim();
            DateTime dtTaskDueDate = Convert.ToDateTime(datepicker.Value);
            string sPersonInCharge = txtPersonInCharge.Text.Trim();
            int iReminderInterval = Convert.ToInt32(txtReminderInterval.Text.Trim());
            string sTanda = txtTanda.Text.Trim();
            string sTandaTangan = txtTandaTangan.Text.Trim();
            string sStatus = txtStatus.Text.Trim();

            //add header
            if (!eventBLL.InsTask(
                sTaskCode,
                sTaskName,
                dtTaskDueDate,
                sPersonInCharge,
                iReminderInterval,
                sTanda,
                sTandaTangan,
                sStatus,
                out sErrorMsg))
            {
                lblErrorMessage.Text = sErrorMsg;
                return;
            }

            //add detail
            if (!eventBLL.InsTaskDetail(
                sTaskCode,
                dtTaskDueDate,
                out sErrorMsg))
            {
                lblErrorMessage.Text = sErrorMsg;
                return;
            }

            //add repeating date
            if (iReminderInterval > 0)
            {
                DateTime dtRepeatingDate = DateTime.Now.Date;

                while (dtRepeatingDate < dtTaskDueDate)
                {
                    dtRepeatingDate = dtRepeatingDate.AddDays(iReminderInterval);

                    if (dtRepeatingDate < dtTaskDueDate)
                    {
                        if (!eventBLL.InsTaskDetail(
                            sTaskCode,
                            dtRepeatingDate,
                            out sErrorMsg))
                        {
                            lblErrorMessage.Text = sErrorMsg;
                            return;
                        }
                    }
                }
            }
        }

        #endregion
    }
}