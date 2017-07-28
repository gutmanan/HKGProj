using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            regAccount();
        }
    }

    private void regAccount()
    {
        if (pass1.Text.Equals(pass2.Text))
        {
            sid = id.Text;
            sfName = fName.Text;
            slName = lName.Text;
            sbDay = bDay.Text;
            sPass = pass1.Text;
            sGender = radioGender.SelectedValue.Equals("1") ? "M" : "F";
            HKGManager.Logger.Append("New user registration:");
            HKGManager.Logger.Append("ID: " + sid);
            HKGManager.Logger.Append("First name: " + sfName);
            HKGManager.Logger.Append("Last name: " + slName);
            HKGManager.Logger.Append("Birthdate: " + sbDay);
            HKGManager.Logger.Append("Gender: " + sGender);
            HKGManager.Logger.Append("Password: " + sPass);

            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("ID", sid);
            param.Add("firstName", sfName);
            param.Add("surName", slName);
            param.Add("dateOfBirth", sbDay);
            param.Add("gender", sGender);
            param.Add("pass", sPass);

            try
            {
                DataTable classes = HKGManager.SQL.executeProc("addParent", param);
            } catch (Exception e)
            {
                HKGManager.Logger.Append("User with the ID "+sid+" already exist");
                ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('User with the ID "+sid+" already exist!')", true);
                return;
            }
            HKGManager.Logger.Append("New user was added");
            Response.Redirect("/View/Login.aspx");
        }
    }

    private static String sid;
    private static String sfName;
    private static String slName;
    private static String sbDay;
    private static String sPass;
    private static String sGender;
}