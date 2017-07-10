using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace PengaturTugas.App_Code.Utilities
{
    public class Bootstrap
    {
        public enum BootstrapAlertType
        {
            Plain,
            Success,
            Information,
            Warning,
            Danger,
            Primary
        };

        public void BootstrapAlert(
            Literal lblMsg,
            string sMessage,
            BootstrapAlertType messageType = BootstrapAlertType.Plain)
        {
            lblMsg.Text = "";
            string style = "", icon = "";

            switch (messageType)
            {
                case Bootstrap.BootstrapAlertType.Plain:
                    style = "default";
                    icon = "";
                    break;
                case Bootstrap.BootstrapAlertType.Success:
                    style = "success";
                    icon = "check";
                    break;
                case Bootstrap.BootstrapAlertType.Information:
                    style = "info";
                    icon = "info-circle";
                    break;
                case Bootstrap.BootstrapAlertType.Warning:
                    style = "warning";
                    icon = "warning";
                    break;
                case Bootstrap.BootstrapAlertType.Danger:
                    style = "danger";
                    icon = "remove";
                    break;
                case Bootstrap.BootstrapAlertType.Primary:
                    style = "primary";
                    icon = "info";
                    break;
                default:
                    break;
            }
            
            if ((lblMsg.Page.IsPostBack || !lblMsg.Page.IsPostBack) && string.IsNullOrEmpty(sMessage))
            {
                lblMsg.Visible = false;
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "<div class='alert alert-" + style + "'>";
                lblMsg.Text += "<a href = '#' class='close' data-dismiss='alert'>&times;</a>";
                lblMsg.Text += sMessage;
                lblMsg.Text += "</div>";
            }
        }
    }
}