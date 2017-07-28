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
        if (!IsPostBack)
        {
            KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
            FillKGBox();
        }
    }

    public void FillKGBox()
    {
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
        foreach (DataRow row in classes.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["number"].ToString();
            CBox.Items.Add(li);
        }
    }
}