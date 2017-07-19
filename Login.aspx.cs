using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        HKGManager.Logger.Append("Login page was loaded");
        LoginBtn.Click += new EventHandler(this.LoginBtn_Click);
        SignupBtn.Click += new EventHandler(this.SignupBtn_Click);
    }

    public void LoginBtn_Click(Object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            HKGManager.Logger.Append("Post back from login form returned: Username: "+ clientLoginEmail.Text+
                                                                " Password: "+ clientLoginPassword.Text);
            this.lEmail = clientLoginEmail.Text;
            this.lPassword = clientLoginPassword.Text;

            if (lEmail.Equals("Admin") && lPassword.Equals("Admin"))
            {
                Response.Redirect("default.aspx");
            }
        }
    }

    public void SignupBtn_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            this.sFirstName = clientSignedFirstName.Text;
            this.sLasttName = clientSignedLastName.Text;
            this.sEmail = clientSignedEmail.Text;
            this.sPassword = clientSignedPassword.Text;
        }
    }

    private String sFirstName;
    private String sLasttName;
    private String sEmail;
    private String sPassword;
    private String lEmail;
    private String lPassword;
}