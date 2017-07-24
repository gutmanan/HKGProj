using System;
using System.Collections.Generic;
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
            if (pass1.Equals(pass2))
            {
                sid = id.Text;
                HKGManager.Logger.Append("ID was entered: "+id.Text);
                sfName = fName.Text;
                slName = lName.Text;
                sbDay = bDay.Text;
                sPass = pass1.Text;

            }
        }
    }

    private String sid;
    private String sfName;
    private String slName;
    private String sbDay;
    private String sPass;
    private String sGender;
}