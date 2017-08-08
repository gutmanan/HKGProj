using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private static Object locker = new Object();
    protected void Page_Load(object sender, EventArgs e)
    {
        yearstat.Text = DateTime.Now.Year + " Statistics";
        GraphLit.Text = DateTime.Now.Year + " Statistics";
        DataTable activities = HKGManager.SQL.executeProc("kidsDistribution", null);
        lock (locker)
        {
            GenerateTable(activities, datatables);
        }
    }

    private void GenerateTable(DataTable dt, Table tbl)
    {
        Table table = tbl;
        TableRow row = null;

        //Add the Headers
        row = new TableRow();
        for (int j = 0; j < dt.Columns.Count; j++)
        {
            TableHeaderCell headerCell = new TableHeaderCell();
            headerCell.Text = dt.Columns[j].ColumnName;
            row.Cells.Add(headerCell);
        }
        table.Rows.Add(row);

        //Add the Column values
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            row = new TableRow();
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                TableCell cell = new TableCell();
                cell.Text = dt.Rows[i][j].ToString();
                row.Cells.Add(cell);
            }
            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
    }


    [System.Web.Services.WebMethod]
    public static String DrawPie()
    {
        lock (locker)
        {
            try
            {
                DataTable activities = HKGManager.SQL.executeProc("profitableActivityPerKindergarden", null);
                //String s1 = "";
                String s2 = "";

                foreach (DataRow row in activities.Rows)
                {
                    //s1 += row["name"].ToString() + ",";
                    s2 += row["total"].ToString() + ",";
                }
                //s1 = s1.Substring(0, s1.Length - 1);
                s2 = s2.Substring(0, s2.Length - 1);
                return s2;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }

    [System.Web.Services.WebMethod]
    public static String DrawBar()
    {
        lock (locker)
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
                HKGManager.Logger.Append(s1 + " xx " + s2 + " xxx " + s3);
                s1 = s1.Substring(0, s1.Length - 1);
                s2 = s2.Substring(0, s2.Length - 1);
                s3 = s3.Substring(0, s3.Length - 1);

                return s1 + "~" + s2 + "~" + s3;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }

    [System.Web.Services.WebMethod]
    public static String DrawLine()
    {
        lock (locker)
        {
            try
            {
                DataTable activities = HKGManager.SQL.executeProc("getAges", null);
                String s1 = "";
                String s2 = "";

                foreach (DataRow row in activities.Rows)
                {
                    s1 += row["age"].ToString() + ",";
                    s2 += row["numOfKids"].ToString() + ",";
                }
                s1 = s1.Substring(0, s1.Length - 1);
                s2 = s2.Substring(0, s2.Length - 1);

                return s1 + "~" + s2;
            }
            catch (Exception e)
            {
                throw e;
            }
        }
    }
}