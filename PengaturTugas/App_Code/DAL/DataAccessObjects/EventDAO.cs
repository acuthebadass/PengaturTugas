using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using PengaturTugas.App_Code.DAL.Classes;

namespace PengaturTugas.App_Code.DAL.DataAccessObjects
{
    public class EventDAO
    {
        public EventDAO()
        {
            //
            // TODO: Add constructor logic here
            //
        }

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
            sErrorMsg = "";
            bool bOperationSuccess = true;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MSSQLConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Task_InsTask", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@TaskCode", sTaskCode);
                    cmd.Parameters.AddWithValue("@TaskName", sTaskName);
                    cmd.Parameters.AddWithValue("@TaskDueDate", dtTaskDueDate);
                    cmd.Parameters.AddWithValue("@PersonInCharge", sPersonInCharge);
                    cmd.Parameters.AddWithValue("@ReminderInterval", iReminderInterval);
                    cmd.Parameters.AddWithValue("@Tanda", sTanda);
                    cmd.Parameters.AddWithValue("@TandaTangan", sTandaTangan);
                    cmd.Parameters.AddWithValue("@Status", sStatus);
                    cmd.Parameters.AddWithValue("@Kode", sKode);
                    cmd.Parameters.AddWithValue("@FU", sFU);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        sErrorMsg = ex.Message;
                        bOperationSuccess = false;
                    }
                }
            }

            return bOperationSuccess;
        }

        public bool InsTaskDetail(
            string sTaskCode,
            DateTime dtRepeatingDate,
            out string sErrorMsg)
        {
            sErrorMsg = "";
            bool bOperationSuccess = true;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MSSQLConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Task_InsTaskDetail", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@TaskCode", sTaskCode);
                    cmd.Parameters.AddWithValue("@RepeatingDate", dtRepeatingDate);

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        sErrorMsg = ex.Message;
                        bOperationSuccess = false;
                    }
                }
            }

            return bOperationSuccess;
        }

        public bool GetTask(
            out List<Task> lstObj,
            out string sErrorMsg,
            DateTime? dtRepeatingDate = null)
        {
            sErrorMsg = "";
            lstObj = new List<Task>();
            bool bOperationSuccees = true;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MSSQLConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("usp_Task_GetTask", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RepeatingDate", dtRepeatingDate);

                    try
                    {
                        con.Open();

                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            while (rdr.Read())
                            {
                                Task obj = new Task();
                                obj.TaskCode = Convert.ToString(rdr["TaskCode"]);
                                obj.TaskName = Convert.ToString(rdr["TaskName"]);
                                obj.CreatedDate = Convert.ToDateTime(rdr["CreatedDate"]);
                                obj.TaskDueDate = Convert.ToDateTime(rdr["TaskDueDate"]);
                                obj.PersonInCharge = Convert.ToString(rdr["PersonInCharge"]);
                                obj.ReminderInterval = Convert.ToInt32(rdr["ReminderInterval"]);
                                obj.Tanda = Convert.ToString(rdr["Tanda"]);
                                obj.TandaTangan = Convert.ToString(rdr["TandaTangan"]);
                                obj.Status = Convert.ToString(rdr["Status"]);
                                obj.Kode = Convert.ToString(rdr["Kode"]);
                                obj.FU = Convert.ToString(rdr["FU"]);
                                obj.RepeatingDate = Convert.ToDateTime(rdr["RepeatingDate"]);

                                lstObj.Add(obj);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        sErrorMsg = ex.Message;
                        bOperationSuccees = false;
                    }
                }
            }

            return bOperationSuccees;
        }
    }
}