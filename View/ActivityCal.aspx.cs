using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_ActivityCal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
            calBtn.OnClientClick += new EventHandler(this.calBtn_Click);
            FillKGBox();
        }
        //year.Text = DateTime.Now.Year.ToString();
    }

    public void FillKGBox()
    {
        KGBox.Items.Add(new ListItem("Select Kindergarten"));
        DataTable kindergartens = HKGManager.SQL.executeProc("getKindergartens", null);
        foreach (DataRow row in kindergartens.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["ID"].ToString();
            KGBox.Items.Add(li);
        }
    }

    public void KGBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        CBox.Items.Clear();
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("ID", KGBox.SelectedItem.Value);
        DataTable classes = HKGManager.SQL.executeProc("getClasses", param);
        CBox.Items.Add(new ListItem("Select Class"));
        foreach (DataRow row in classes.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["number"].ToString();
            CBox.Items.Add(li);
        }
    }

    [System.Web.Services.WebMethod]
    public static Dictionary<string, string> GetCurrentTime(string name)
    {
        HKGManager.Logger.Append("  " + name);
        var dict = new Dictionary<string, string>();
        dict.Add("1", "Item 1");
        dict.Add("2", "Item 2");
        return dict;
    }

    protected void calBtn_Click(object sender, EventArgs e)
    {
        if (KGBox.SelectedIndex != 0 && CBox.SelectedIndex != 0)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "initFullCalendar();", true);
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("kindergardenID", KGBox.SelectedItem.Value);
            param.Add("classNumber", CBox.SelectedItem.Value);
            DataTable act = HKGManager.SQL.executeProc("activityInKindergarden", param);
            int count = 0;
            foreach (DataRow row in act.Rows)
            {
                var title = row["name"].ToString();
                var day = 0;
                var sHou = 0;
                var sMin = 0;
                var length = 0;
                try
                {
                    day = int.Parse(row["dayInWeek"].ToString());
                    sHou = Int32.Parse(row["startTime"].ToString().Split(':')[0], NumberStyles.Any);
                    sMin = Int32.Parse(row["startTime"].ToString().Split(':')[1], NumberStyles.Any);
                    length = int.Parse(row["length"].ToString());
                    HKGManager.Logger.Append("Parsed successfully: " + day + " " + sHou + " " + sMin + " " + length);
                }
                catch (Exception ex)
                {
                    HKGManager.Logger.Append("Could not parse: " + day + " " + sHou + " " + sMin + " " + length);
                }
                ClientScript.RegisterStartupScript(GetType(), "e" + count++, "addEvent('" + title + "','" + day + "','" + sHou + "','" + sMin + "','" + length + "');", true);
            }
        }
    }
}