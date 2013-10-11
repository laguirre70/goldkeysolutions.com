using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Collections.Specialized;
using AjaxControlToolkit;
using System.Net.Mail;
using System.Text;

public partial class ItemDetail : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        TextBox YTVideoID ;
        YTVideoID = VideoDetailsView.Controls[0].FindControl("YouTubeTB") as TextBox;
        if (YTVideoID != null)
        {
            
            if (YTVideoID.Text == "")
            {
                Panel PanelYTVideo;
                PanelYTVideo = VideoDetailsView.Controls[0].FindControl("PanelYouTube") as Panel;
                PanelYTVideo.Visible = false;

            }
            
        }

        if (Request.QueryString["lead"]!= null)
        {
            SendEmail();
        }

    
    }

    protected void SendEmail()
    {
        
        //Getting user info from form fields
        string lead = Request.QueryString["lead"];
       

        HtmlGenericControl VideoTitle;
        VideoTitle = VideoDetailsView.Controls[0].FindControl("videotitle") as HtmlGenericControl;
        string feature = VideoTitle.InnerHtml;
        

        //Building the Body String
        StringBuilder sb = new StringBuilder();
        sb.Append(lead + " accessed the email link of: " + Environment.NewLine + feature + Environment.NewLine + Environment.NewLine);
        sb.Append("This email was automatically generated from http://GoldKeySolutions.com");
        sb.Append(Environment.NewLine + Environment.NewLine);
        //Email To GKS
        MailMessage GKSmail = new MailMessage();
        GKSmail.To.Add("info@goldkeysolutions.com");
        GKSmail.To.Add("adrian.massi@fedreporter.net");
        GKSmail.From = new MailAddress("Info@goldkeysolutions.com");
        GKSmail.Subject = "Video link accessed by: " + lead;
        GKSmail.Body = sb + " ";
        //Sending the Emails
        SmtpClient smtp = new SmtpClient();
        smtp.EnableSsl = true;
        smtp.Send(GKSmail);


    }
}



