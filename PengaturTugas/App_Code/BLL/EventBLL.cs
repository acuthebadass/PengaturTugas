using PengaturTugas.App_Code.DAL.Classes;
using PengaturTugas.App_Code.DAL.DataAccessObjects;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PengaturTugas.App_Code.BLL
{
    public class EventBLL
    {
        private EventDAO eventDAL = new EventDAO();

        public bool InsTask(
            string sTaskCode,
            string sTaskName,
            DateTime dtTaskDueDate,
            string sPersonInCharge,
            int iReminderInterval,
            string sTanda,
            string sTandaTangan,
            string sStatus,
            string sKode,
            string sFU,
            out string sErrorMsg)
        {
            return eventDAL.InsTask(
                sTaskCode,
                sTaskName,
                dtTaskDueDate,
                sPersonInCharge,
                iReminderInterval,
                sTanda,
                sTandaTangan,
                sStatus,
                sKode,
                sFU,
                out sErrorMsg);
        }

        public bool InsTaskDetail(
            string sTaskCode,
            DateTime dtRepeatingDate,
            out string sErrorMsg)
        {
            return eventDAL.InsTaskDetail(
                sTaskCode,
                dtRepeatingDate,
                out sErrorMsg);
        }

        public bool GetAllTasks(
            out List<Task> lstObj,
            out string sErrorMsg)
        {
            return eventDAL.GetTask(
                out lstObj,
                out sErrorMsg);
        }

        public bool GetTaskByRepeatingDate(
            DateTime dtRepeatingDate,
            out List<Task> lstObj,
            out string sErrorMsg)
        {
            return eventDAL.GetTask(
                out lstObj,
                out sErrorMsg,
                dtRepeatingDate);
        }
    }
}