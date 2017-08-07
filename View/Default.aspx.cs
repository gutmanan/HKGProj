using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        yearstat.Text = DateTime.Now.Year+ " Statistics";
        GraphLit.Text = DateTime.Now.Year + " Statistics";
    }

    [System.Web.Services.WebMethod]
    public static String DrawPie()
    {
        try
        {
            DataTable activities = HKGManager.SQL.executeProc("profitableActivityPerKindergarden", null);
            String s = "";
            foreach (DataRow row in activities.Rows)
            {
                s += row["total"].ToString() + ",";
            }
            s = s.Substring(0, s.Length - 1);
            return s;
        }
        catch (Exception e)
        {
            throw e;
        }
    }
}