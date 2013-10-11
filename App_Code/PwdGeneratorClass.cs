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

/// <summary>
/// Code to generate passwords
/// </summary>
public class PwdGeneratorClass 
{
    //public PwdGeneratorClass() 
    //{
    //    //
    //}
    public string CreatePasword()
   {
       string ret = Convert.ToString((DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Year) * 16);
       return ret.Substring(ret.Length - 1, 1) + ret.Substring(1, ret.Length - 2) + ret.Substring(0, 1);
       
       
   }

    public string CreateAccessCode()
    {
        string ret = Convert.ToString((DateTime.Now.Month + DateTime.Now.Day + DateTime.Now.Year) * 4);
        return ret.Substring(ret.Length - 1, 1) + ret.Substring(1, ret.Length - 2) + ret.Substring(0, 1);
    }

    //private void button1_Click(object sender, System.EventArgs e)
    //{

    //    // This will get todays date

    //    MessageBox.Show(CreateSupportPassword(0));

    //    // This will get yesterdays date

    //    MessageBox.Show(CreateSupportPassword(-1));

    //    // This will get tomorrows date

    //    MessageBox.Show(CreateSupportPassword(1));

    //}
    //private string CreateSupportPassword(int iOffset)
    //{

    //    try
    //    {

    //        DateTime oDate = DateTime.Now;

    //        oDate = oDate.AddDays(iOffset);

    //        string ret = Convert.ToString((oDate.Month + oDate.Day + oDate.Year) * 16);

    //        return ret.Substring(ret.Length - 1, 1) + ret.Substring(1, ret.Length - 2) + ret.Substring(0, 1);

    //    }

    //    catch (Exception ex)
    //    {

    //        return ex.ToString();

    //    }

    //}


}

