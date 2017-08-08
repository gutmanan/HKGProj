using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Remove_Kid : System.Web.UI.Page
{
    public void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KGBox.SelectedIndexChanged += new EventHandler(this.KGBox_SelectedIndexChanged);
            FindBtn.OnClientClick += new EventHandler(this.FindBtn_Click);
            FillKGBox();
        }
        else
        {
            //FindBtn.Enabled = false;
            Session["SelectedKid"] = id.Text;
            if (Session["SelectedKid"] != null)
            {
                id.Text = (string)Session["SelectedKid"];
                this.FindBtn_Click(sender, e);
            }
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
                String s = row["dateOfBirth"].ToString().Split(' ')[0];
                DateTime result = DateTime.ParseExact(s, "M/d/yyyy", CultureInfo.InvariantCulture);
                bDay.Text = result.ToString("yyyy-MM-dd");
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
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        try
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("kid", id.Text);
            DataTable addKid = HKGManager.SQL.executeProc("deleteKid", param);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('deleted-message');", true);
            clear();
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "swal(Cancelled, Couldn't delete, error);", true);
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
        KidPlaceBox.Text = "";
        KGBox.Items.Clear();
        CBox.Items.Clear();
        FillKGBox();
    }
}