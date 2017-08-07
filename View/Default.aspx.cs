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

    [System.Web.Services.WebMethod]
    public static String DrawBar()
    {
        try
        {
            DataTable activities = HKGManager.SQL.executeProc("halfOfActivities", null);
            String s1 = "";
            String s2 = "";
            String s3 = "";

            foreach (DataRow row in activities.Rows)
            {
                s1 += row["name"].ToString() + ",";
                s2 += row["numOfKids"].ToString() + ",";
                s3 += row["numOfKidsInHalfActivities"].ToString() + ",";
            }
            s1 = s1.Substring(0, s1.Length - 1);
            s2 = s2.Substring(0, s2.Length - 1);
            s3 = s3.Substring(0, s3.Length - 1);

            return s1+" "+s2+" "+s3;
        }
        catch (Exception e)
        {
            throw e;
        }
    }
}