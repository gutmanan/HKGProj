using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ActivityCal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        year.Text = DateTime.Now.Year.ToString();
    }
}