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

public partial class DemoVideo : System.Web.UI.Page
{
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod]
    public static CascadingDropDownNameValue[] GetDropDownContentsPageMethod(string knownCategoryValues, string category)
    {
        return new CountryService().GetDropDownContents(knownCategoryValues, category);
    }
    protected void Page_Load(object sender, System.EventArgs e)
    {


    }


    protected void OIRSubmit_Click(object sender, EventArgs e)
    {

        ccJoin.ValidateCaptcha(CaptchaCode.Text);

        if (!ccJoin.UserValidated)
        {

            CaptchaError.Text = "Not a valid code";
            return;
            //this code will trigger the error from InvalidEmailErrorMessage, which was cutomized to ="Not a valid code"
        }
        else
        {
            CaptchaError.Text = "";
            SendEmail();
            PanelDemoInfo.Visible = false;
            PanelVideo.Visible = true;

        }
    }

    protected void SendEmail()
    {
        //Getting user info from form fields
        string FName = FnameTBx.Text;
        string LName = LNameTBx.Text;
        string Email = EmailTBx.Text;
        string Phone = PhoneTBx.Text;
        string Firm = FirmTBx.Text;
        string Country = CountryDDL.SelectedItem.Text;
        string State = StateDDL.SelectedItem.Text;
        string Title = TitleDDL.SelectedItem.Text;
        string RelType = RelTypeDDL.SelectedItem.Text;
        string Info = OptionalInfoTB.Text;

        //Building the Body String
        StringBuilder sb = new StringBuilder();
        sb.Append("Video Demo Shown!" + Environment.NewLine + Environment.NewLine);
        sb.Append("Lead Details:" + Environment.NewLine + Environment.NewLine);
        sb.Append("Name: " + FName + " " + LName + Environment.NewLine);
        sb.Append("Title: " + Title + Environment.NewLine);
        sb.Append("Email: " + Email + Environment.NewLine);
        sb.Append("Property: " + Firm + Environment.NewLine);
        sb.Append("Tel: " + Phone + Environment.NewLine);
        sb.Append("Country: " + Country + Environment.NewLine);
        sb.Append("State: " + State + Environment.NewLine);
        sb.Append("Relation to GKS: " + RelType + Environment.NewLine);
        sb.Append("Additional Comments:" + Environment.NewLine);
        sb.Append(Info + Environment.NewLine + Environment.NewLine + Environment.NewLine);
        sb.Append("This email was automatically generated from http://GoldKeySolutions.com");
        sb.Append(Environment.NewLine + Environment.NewLine);
        //Email To GKS
        MailMessage GKSmail = new MailMessage();
        GKSmail.To.Add("info@goldkeysolutions.com");
        GKSmail.From = new MailAddress("support@goldkeysolutions.com");
        GKSmail.Subject = "Video Demo Shown to " + FName + " " + LName + ", " + Title + ", " + Firm;
        GKSmail.Body = sb + " ";
        //Sending the Emails
        SmtpClient smtp = new SmtpClient();
        smtp.EnableSsl = true;
        smtp.Send(GKSmail);


    }

}
