using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Remove_Kid : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        DayBox.Enabled = false;
        DayBox.Attributes.Add("disabled", "disabled");
        MonthBox.Enabled = false;
        MonthBox.Attributes.Add("disabled", "disabled");
        YearBox.Enabled = false;
        YearBox.Attributes.Add("disabled", "disabled");
        StreetBox.Enabled = false;
        HouseBox.Enabled = false;
        KidPlaceBox.Enabled = false;
        KGBox.Enabled = false;
        KGBox.Attributes.Add("disabled", "disabled");
        CBox.Enabled = false;
        CBox.Attributes.Add("disabled", "disabled");

        KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
        FindBtn.OnClientClick += new EventHandler(this.FindBtn_Click);
        if (!IsPostBack)
        {
            FillKGBox();
            FillBirthdateBoxes();
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
        for (int i = thisYear - 10; i < thisYear; i++)
            YearBox.Items.Add(new ListItem(i + ""));
    }

    public void KGBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillClasses();
    }

    private void FillClasses()
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

    protected void FindBtn_Click(object sender, EventArgs e)
    {
        if (!id.Text.Equals("") && id.Text.Length == 9)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("ID", id.Text);
            DataTable kid = HKGManager.SQL.executeProc("getKid", param);
            foreach (DataRow row in kid.Rows)
            {
                id_first_name.Text = row["firstName"].ToString();
                id_last_name.Text = row["surName"].ToString();
                String[] splitted = row["dateOfBirth"].ToString().Split(' ')[0].Split('/');
                DayBox.SelectedValue = splitted[0];
                MonthBox.SelectedValue = splitted[1];
                YearBox.SelectedValue = splitted[2];
                StreetBox.Text = row["street"].ToString();
                HouseBox.Text = row["houseNumber"].ToString();
                LatBox.Text = row["latitude"].ToString();
                LongBox.Text = row["longitude"].ToString();
                First_Father.Text = row["fatherName"].ToString().Split(' ')[0];
                Last_Father.Text = row["fatherName"].ToString().Split(' ')[1];
                First_Mother.Text = row["motherName"].ToString().Split(' ')[0];
                Last_Mother.Text = row["motherName"].ToString().Split(' ')[1];
                KidPlaceBox.Text = row["placeInFamily"].ToString();
                KGBox.SelectedValue = row["kindergardenID"].ToString();
                FillClasses();
                CBox.SelectedValue = row["classNumber"].ToString();
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Oops! Invalid ID');", true);
        }
    }
}