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
        if (IsPostBack)
        {
            HKGManager.Logger.Append("Post back from login form returned: Username: " + loginUsername.Text +
                                                                " Password: " + loginPassword.Text);
            this.username = loginUsername.Text;
            this.password = loginPassword.Text;

            if (username.Equals("Admin") && password.Equals("Admin"))
            {
                Response.Redirect("/Default.aspx");
            }
        }
    }
    
    private String username;
    private String password;

}