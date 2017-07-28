using System;
using System.Collections.Generic;
using System.Data;
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
                HKGManager.AuthUser = null;
                Response.Redirect("/View/Default.aspx");
            } else
            {
                Dictionary<string, object> param = new Dictionary<string, object>();
                param.Add("ID", username);
                DataTable parent = HKGManager.SQL.executeProc("getParent", param);
                foreach (DataRow row in parent.Rows)
                {
                    if (row["pass"].ToString().Equals(password))
                    {
                        HKGManager.AuthUser = new User(row["ID"].ToString(), 
                                                       row["firstName"].ToString(),
                                                       row["surName"].ToString(),
                                                       row["dateOfBirth"].ToString());
                        Response.Redirect("/View/Default.aspx");
                    }
                }
            }
        }
    }
    
    private String username;
    private String password;

}