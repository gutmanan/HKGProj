using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
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
            addKidButton.OnClientClick += new EventHandler(this.addKidButton_Click);
            KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
            radioGender.SelectedIndexChanged += new EventHandler(this.radioGender_SelectedIndexChanged);
            FillKGBox();
        }

    }

    public void addKidButton_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid)
            return;
        else
        {
            addKid();
        }
    }

    private void addKid()
    {
        Dictionary<String, Object> valMap = new Dictionary<String, Object>();
        valMap.Add("kidID", id.Text);
        valMap.Add("firstName", id_first_name.Text);
        valMap.Add("lastName", id_last_name.Text);

        CultureInfo myCItrad = new CultureInfo("bg-BG", false);
        valMap.Add("dateOfBirth", DateTime.ParseExact(bDay.Text, "yyyy-MM-dd", myCItrad));

        //add kid to persons table
        new SQLConnection().executeProc("addNewKidToPersons", valMap);
        valMap.Clear();
        if (radioGender.SelectedIndex == 0)
        {
            if (!addKidToPrivate())
            {
                valMap.Add("kidID", id.Text);
                new SQLConnection().executeProc("deleteKidFromPersons", valMap);
            }
        }

        else
        {
            if (!addKidToPublic())
            {
                valMap.Add("kidID", id.Text);
                new SQLConnection().executeProc("deleteKidFromPersons", valMap);
            }
        }

    }

    private bool addKidToPrivate()
    {
        Dictionary<String, Object> valMap = new Dictionary<String, Object>();
        valMap.Add("kinderNum", Int32.Parse(KGBox.SelectedValue));
        DataTable kindergartens = HKGManager.SQL.executeProc("findPrivateClassForKid", valMap);

        foreach (DataRow row in kindergartens.Rows)
        {
            valMap.Clear();
            valMap.Add("kidID", id.Text);
            valMap.Add("street", StreetBox.Text);
            valMap.Add("houseNumber", HouseBox.Text);
            valMap.Add("city", CityBox.Text);
            valMap.Add("latitude", double.Parse(LatBox.Text, System.Globalization.CultureInfo.InvariantCulture));
            valMap.Add("longitude", double.Parse(LongBox.Text, System.Globalization.CultureInfo.InvariantCulture));
            valMap.Add("fatherName", TextBox1.Text + " " + TextBox2.Text);
            valMap.Add("motherName", TextBox3.Text + " " + TextBox4.Text);
            valMap.Add("placeInFamily", Int32.Parse(kidPlace.Text));
            valMap.Add("kindergardenID", Int32.Parse(row["ID"].ToString()));
            valMap.Add("classNumber", Int32.Parse(row["Number"].ToString()));
            valMap.Add("parentID", "000000005");
            DataTable approved = HKGManager.SQL.executeProc("addNewKid", valMap);
            foreach (DataRow a in approved.Rows)
                if (a["kidID"].ToString().Equals(id.Text))
                    return true;
        }

        return false;
    }

    private Boolean addKidToPublic()
    {
        Dictionary<String, Object> valMap = new Dictionary<String, Object>();
        valMap.Add("latitude", double.Parse(LatBox.Text, System.Globalization.CultureInfo.InvariantCulture));
        valMap.Add("longitude", double.Parse(LongBox.Text, System.Globalization.CultureInfo.InvariantCulture));
        DataTable kindergartens = HKGManager.SQL.executeProc("findPublicClassForKid", valMap);

        foreach (DataRow row in kindergartens.Rows)
        {

            valMap.Clear();
            valMap.Add("kidID", id.Text);
            valMap.Add("street", StreetBox.Text);
            valMap.Add("houseNumber", HouseBox.Text);
            valMap.Add("city", CityBox.Text);
            valMap.Add("latitude", double.Parse(LatBox.Text, System.Globalization.CultureInfo.InvariantCulture));
            valMap.Add("longitude", double.Parse(LongBox.Text, System.Globalization.CultureInfo.InvariantCulture));
            valMap.Add("fatherName", TextBox1.Text + " " + TextBox2.Text);
            valMap.Add("motherName", TextBox3.Text + " " + TextBox4.Text);
            valMap.Add("placeInFamily", Int32.Parse(kidPlace.Text));
            valMap.Add("kindergardenID", Int32.Parse(row["ID"].ToString()));
            valMap.Add("classNumber", Int32.Parse(row["Number"].ToString()));
            valMap.Add("parentID", "000000005");
            DataTable approved = HKGManager.SQL.executeProc("addNewKid", valMap);
            foreach (DataRow a in approved.Rows)
                if (a["kidID"].ToString().Equals(id.Text))
                    return true;
        }

        return false;
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