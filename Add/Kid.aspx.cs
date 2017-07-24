using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kids : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
        if (!IsPostBack)
        {
            FillKGBox();
            FillBirthdateBoxes();
        }
    }

    public void FillKGBox()
    {
        DataTable kindergartens = HKGManager.SQL.runProcWithResults("getKindergartens", null);
        foreach (DataRow row in kindergartens.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["ID"].ToString();
            KGBox.Items.Add(li);
        }
    }

    public void FillBirthdateBoxes()
    {
        DayBox.Items.Add(new ListItem("Day"));
        for (int i = 1; i < 32; i++)
            DayBox.Items.Add(new ListItem(i + ""));
        MonthBox.Items.Add(new ListItem("Month"));
        for (int i = 1; i < 13; i++)
            MonthBox.Items.Add(new ListItem(i + ""));
        int thisYear = DateTime.Now.Year;
        YearBox.Items.Add(new ListItem("Year"));
        for (int i = thisYear-10; i < thisYear; i++)
            YearBox.Items.Add(new ListItem(i + ""));
    }

    public void KGBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        CBox.Items.Clear();
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("ID", KGBox.SelectedItem.Value);
        DataTable classes = HKGManager.SQL.runProcWithResults("getClasses", param);
        foreach (DataRow row in classes.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["number"].ToString();
            CBox.Items.Add(li);
        }
    }

}