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
            clear();
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
        HKGManager.SQL.executeProc("addNewKidToPersons", valMap);
        valMap.Clear();
        if (radioGender.SelectedIndex == 0)
        {
            if (!addKidToPrivate())
            {
                valMap.Add("kidID", id.Text);
                HKGManager.SQL.executeProc("deleteKidFromPersons", valMap);
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('deleted-message');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('added-message');", true);
                clear();
            }
        

    }
        else
        {
            if (!addKidToPublic())
            {
                if (checkKid())
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('already-message');", true);
                    return;
                }
                valMap.Add("kidID", id.Text);
                HKGManager.SQL.executeProc("deleteKidFromPersons", valMap);
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('deleted-message');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('added-message');", true);
                clear();
            }
        }
    }

    private bool checkKid()
    {
        Dictionary<String, Object> valMap = new Dictionary<String, Object>();
        valMap.Add("ID", id.Text);
        DataTable kid = HKGManager.SQL.executeProc("getKid", valMap);
        foreach (DataRow a in kid.Rows)
            if (a["ID"].ToString().Equals(id.Text))
                return true;
        return false;
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
            valMap.Add("fatherName", First_Father.Text + " " + Last_Father.Text);
            valMap.Add("motherName", First_Mother.Text + " " + Last_Mother.Text);
            valMap.Add("placeInFamily", Int32.Parse(kidPlace.Text));
            valMap.Add("kindergardenID", Int32.Parse(row["ID"].ToString()));
            valMap.Add("classNumber", Int32.Parse(row["Number"].ToString()));
            valMap.Add("parentID", HKGManager.AuthUser.id);
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
            valMap.Add("fatherName", First_Father.Text + " " + Last_Father.Text);
            valMap.Add("motherName", First_Mother.Text + " " + Last_Mother.Text);
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

    public void clear()
    {
        id.Text = "";
        id_first_name.Text = "";
        id_last_name.Text = "";
        bDay.Text = "";
        StreetBox.Text = "";
        HouseBox.Text = "";
        LatBox.Text = "";
        LongBox.Text = "";
        First_Father.Text = "";
        Last_Father.Text = "";
        First_Mother.Text = "";
        Last_Mother.Text = "";
        kidPlace.Text = "";
        KGBox.Items.Clear();
        KGBox.Items.Clear();
        FillKGBox();
    }

}