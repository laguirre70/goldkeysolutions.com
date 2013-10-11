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

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {


        string ua = Request.UserAgent;

        //if (ua != null && (ua.Contains("iPhone") || ua.Contains("iPod") || ua.Contains("BlackBerry")))
        if (ua != null && (ua.Contains("BlackBerry")))

        {

            Response.Redirect("mobile/default.aspx");
        }
        //else
        //{

        //    Response.Redirect("~/default.aspx");
        //}

    }

}
