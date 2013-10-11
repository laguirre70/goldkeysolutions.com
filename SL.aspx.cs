using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class SL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == false)
            LoginPanel.Visible = true;
        else
        {
            if (this.User.IsInRole("Admin") == false)
            {
                // For multiple roles: if (this.User.IsInRole("Admin") || this.User.IsInRole("User")
                NotAuthorized.Visible = true;
            }
            else
            {
                LoginPanel.Visible = false;
                PwdPanel.Visible = true;
                PwdGeneratorClass objPwd = new PwdGeneratorClass();
                string ret = objPwd.CreatePasword();
                DisplayPwd.Text = "Today's Password: " + ret;
            }
        }
    }



}
