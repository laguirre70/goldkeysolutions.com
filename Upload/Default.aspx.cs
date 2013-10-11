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
using System.Net.Mail;
using System.Text;

public partial class Upload_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //Today's support password
    public string SupportPassword()
    {
        string ret = Convert.ToString((DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Year) * 16);
        return ret.Substring(ret.Length - 1, 1) + ret.Substring(1, ret.Length - 2) + ret.Substring(0, 1);
    }
    //Event handler for the access the upload control
    protected void UpldAccess_Click(object sender, EventArgs e)
    {
        WrongPwd.Text = "";
        ccJoin.ValidateCaptcha(CaptchaCode.Text);

        if (!ccJoin.UserValidated)
        {

            CaptchaError.Text = "Not a valid code";
            if (UpldPwd.Text != SupportPassword())
                WrongPwd.Text = "Not a valid password";
            return;
        }
        else
        {
            CaptchaError.Text = "";
            WrongPwd.Text = "";
            if (UpldPwd.Text == SupportPassword())
            {
                UploadPanel.Visible = true;
                Authenticate.Visible = false;
            }
            else
            {
                WrongPwd.Text = "Not a valid password";
                CaptchaCode.Text = "";
                return;
            }
        }

    }
    //Event handler for the upload button
    public void UploadFile(object Sender, EventArgs E)
    {
        UploadPanel.Visible = false;
        ResultsPane.Visible = true;
        int IntLoop = 0;
        //Iterating through the Request.Files collection
        for (IntLoop = 0; IntLoop < Request.Files.Count; IntLoop++)
        {
            if (Request.Files[IntLoop] != null) //Checking for valid file
            {
                // Since the FileName gives the entire path we use Substring function to rip of the filename.
                string StrFileName = Request.Files[IntLoop].FileName.Substring(Request.Files[IntLoop].FileName.LastIndexOf("\\") + 1);
                string StrFileType = Request.Files[IntLoop].ContentType;
                int IntFileSize = Request.Files[IntLoop].ContentLength;
                //Checking for the file length. If length is 0 then file is not uploaded.
                if (IntFileSize <= 0)
                {
                    
                    if (UploadResult1.Text == "")
                    {
                        UploadResult1.Text = " <font color='Red' size='2'>File 1 upload failed! Either no file was selected, or file" + StrFileName + " was 0 KB. </font><br>";
                    }
                    else
                    {
                        if (UploadResult2.Text == "")
                            UploadResult2.Text = " <font color='Red' size='2'>File 2 upload failed! Either no file was selected, or file" + StrFileName + " was 0 KB. </font><br />";

                        else
                        {
                            if (UploadResult3.Text == "")
                                UploadResult3.Text = " <font color='Red' size='2'>File 3 upload failed! Either no file was selected, or file" + StrFileName + " was 0 KB. </font><br />";
                        }
                    }
                    }
                else
                {
                    //Saving the file to the web server
                    Request.Files[IntLoop].SaveAs(Server.MapPath("~/Upload/")+ StrFileName);
                                       
                    if (UploadResult1.Text == "")
                    {
                        UploadResult1.Text = "<font color='Green' size='2'>File 1 upload sucessful!<br />Details:<br /> File Name:" + StrFileName + "<br />Type: " + StrFileType + "<br />Size: " + IntFileSize.ToString() + " KB.</font><br />";
                        //Building the Body String
                        StringBuilder sb = new StringBuilder();
                        sb.Append("Action is needed! A file has been uploaded to the web site Upload folder." + Environment.NewLine + Environment.NewLine);
                        sb.Append("File Details (file 1):" + Environment.NewLine + Environment.NewLine);
                        sb.Append("File: " + StrFileName + Environment.NewLine + "Type: " + StrFileType + Environment.NewLine + "Size: " + IntFileSize.ToString() + " KB." + Environment.NewLine);
                        sb.Append(Environment.NewLine + "link to the file: http://goldkeysolutions.com/upload/" + StrFileName + Environment.NewLine + Environment.NewLine);
                        sb.Append("This email was automatically generated from http://GoldKeySolutions.com");
                        sb.Append(Environment.NewLine + Environment.NewLine);
                        //Email To GKS
                        MailMessage GKSmail = new MailMessage();
                        GKSmail.To.Add("leo@goldkeysolutions.com");
                        GKSmail.From = new MailAddress("Support@goldkeysolutions.com");
                        GKSmail.Subject = " File Uploaded to GKS website!";
                        GKSmail.Body = sb + " ";
                        //Sending the Emails
                        SmtpClient smtp = new SmtpClient();
                        smtp.EnableSsl = true;
                        smtp.Send(GKSmail);

                    }
                    else
                    {
                        if (UploadResult2.Text == "")
                        {
                            UploadResult2.Text = "<font color='Green' size='2'>File 2 upload sucessful!<br />Details:<br /> File Name:" + StrFileName + "<br />Type: " + StrFileType + "<br />Size: " + IntFileSize.ToString() + "KB.</font><br />";
                            //Building the Body String
                            StringBuilder sb = new StringBuilder();
                            sb.Append("Action is needed! A file has been uploaded to the web site Upload folder." + Environment.NewLine + Environment.NewLine);
                            sb.Append("File Details (file 2):" + Environment.NewLine + Environment.NewLine);
                            sb.Append("File: " + StrFileName + Environment.NewLine + "Type: " + StrFileType + Environment.NewLine + "Size: " + IntFileSize.ToString() + " KB." + Environment.NewLine);
                            sb.Append(Environment.NewLine + "link to the file: http://goldkeysolutions.com/upload/" + StrFileName + Environment.NewLine + Environment.NewLine);
                            sb.Append("This email was automatically generated from http://GoldKeySolutions.com");
                            sb.Append(Environment.NewLine + Environment.NewLine);
                            //Email To GKS
                            MailMessage GKSmail = new MailMessage();
                            GKSmail.To.Add("leo@goldkeysolutions.com");
                            GKSmail.From = new MailAddress("Support@goldkeysolutions.com");
                            GKSmail.Subject = " File Uploaded to GKS website!";
                            GKSmail.Body = sb + " ";
                            //Sending the Emails
                            SmtpClient smtp = new SmtpClient();
                            smtp.EnableSsl = true;
                            smtp.Send(GKSmail);

                        }
                        else
                        {
                            if (UploadResult3.Text == "")
                            {
                                UploadResult3.Text = "<font color='Green' size='2'>File 3 upload sucessful!<br />Details:<br /> File Name:" + StrFileName + "<br />Type: " + StrFileType + "<br />Size: " + IntFileSize.ToString() + "KB.</font><br />";

                                //Building the Body String
                                StringBuilder sb = new StringBuilder();
                                sb.Append("Action is needed! A file has been uploaded to the web site Upload folder." + Environment.NewLine + Environment.NewLine);
                                sb.Append("File Details (file 3):" + Environment.NewLine + Environment.NewLine);
                                sb.Append("File: " + StrFileName + Environment.NewLine + "Type: " + StrFileType + Environment.NewLine + "Size: " + IntFileSize.ToString() + " KB." + Environment.NewLine);
                                sb.Append(Environment.NewLine + "link to the file: http://goldkeysolutions.com/upload/" + StrFileName + Environment.NewLine + Environment.NewLine);
                                sb.Append("This email was automatically generated from http://GoldKeySolutions.com");
                                sb.Append(Environment.NewLine + Environment.NewLine);
                                //Email To GKS
                                MailMessage GKSmail = new MailMessage();
                                GKSmail.To.Add("leo@goldkeysolutions.com");
                                GKSmail.From = new MailAddress("Support@goldkeysolutions.com");
                                GKSmail.Subject = " File Uploaded to GKS website!";
                                GKSmail.Body = sb + " ";
                                //Sending the Emails
                                SmtpClient smtp = new SmtpClient();
                                smtp.EnableSsl = true;
                                smtp.Send(GKSmail);
                           
                            }
                        }
                    }
                }
            }
        }
    }
    //Send email for each file uploaded
   
    //Event handler for the upload more button
    protected void UpldMore_Click(object sender, EventArgs e)
    {
        UploadPanel.Visible = true;
        ResultsPane.Visible = false;
        UploadResult1.Text = "";
        UploadResult2.Text = "";
        UploadResult3.Text = "";
    }
    //Event handler for the exit button
    protected void Done_Click(object sender, EventArgs e)
    {
        Response.Redirect ("../default.aspx");
    }

    
}
