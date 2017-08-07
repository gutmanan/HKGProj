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
            radioGender.SelectedIndexChanged += new EventHandler(this.radioGender_SelectedIndexChanged);
            FillKGBox();
        }
    }

    public void FillKGBox()
    {
        DataTable kindergartens = HKGManager.SQL.executeProc("getPrivate", null);
        foreach (DataRow row in kindergartens.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["ID"].ToString();
            KGBox.Items.Add(li);
        }
    }

    public void KGBox_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void radioGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radioGender.SelectedIndex == 1)
        {
            kinLab.Visible = false;
            KGBox.Visible = false;
        }
        else
        {
            kinLab.Visible = true;
            KGBox.Visible = true;
        }
    }
}