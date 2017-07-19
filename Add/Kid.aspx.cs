using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kids : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable kindergartens = HKGManager.SQL.runProcWithResults("getKindergartens", null);
        foreach (DataRow row in kindergartens.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["ID"].ToString();
            ListBox1.Items.Add(li);
        }
        /*
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add(ID, ListBox1.SelectedItem.Value);
        DataTable classes = HKGManager.SQL.runProcWithResults("getClasses", param);
        foreach (DataRow row in kindergartens.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["number"].ToString();
            ListBox2.Items.Add(li);
        }
        */
    }
}