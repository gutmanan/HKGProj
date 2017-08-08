using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_SignedFor : System.Web.UI.Page
{
    private static string selectedID;
    private static string selectedKinID;
    private static string selectedClassID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //FindBtn.OnClientClick = null;
            lit.Text = "0";
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

    protected void FindBtn_Click(object sender, EventArgs e)
    {
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("ID", id.Text);
        DataTable kidInfo = HKGManager.SQL.executeProc("getKid", param);
        foreach (DataRow row in kidInfo.Rows)
        {
            selectedID = row["ID"].ToString();
            selectedKinID = row["kindergardenID"].ToString();
            selectedClassID = row["classNumber"].ToString();
        }
        Dictionary<string, object> para = new Dictionary<string, object>();
        para.Add("kidID", id.Text);
        DataTable activities = HKGManager.SQL.executeProc("activityForKid", para);
        GenerateTable(activities);
    }

    private void GenerateTable(DataTable dt)
    {
        Table table = datatables;
        table.ID = "acTable";
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
                if (j != dt.Columns.Count-1)
                    cell.Text = dt.Rows[i][j].ToString();
                else
                {
                    CheckBox cb = new CheckBox();
                    cb.AutoPostBack = true;
                    cb.CheckedChanged += CheckHandler;
                    if (int.Parse(dt.Rows[i][j].ToString()) == 1)
                        cb.Checked = true;
                    cell.Controls.Add(cb);
                }
                row.Cells.Add(cell);
            }
            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
        lit.Text = table.Rows.Count - 1 + "";
    }

    public void CheckHandler(Object obj, EventArgs e)
    {
        int index = -1;
        var checkBox = ((CheckBox)obj);
        if (checkBox != null)
        {
            TableCell c = checkBox.Parent as TableCell;
            TableRow r = c.Parent as TableRow;
            index = datatables.Rows.GetRowIndex(r);
            if (index > 0)
            {
                if (checkBox.Checked)
                    AddSignedFor(selectedID, selectedKinID, selectedClassID, datatables.Rows[index].Cells[0].Text);
                else DeleteSignedFor(selectedID, selectedKinID, selectedClassID, datatables.Rows[index].Cells[0].Text);
            }
        }
    }

    public void AddSignedFor(string id, string kinID, string cID, string actID)
    {
        try
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("kidID", id);
            param.Add("kindergardenID", kinID);
            param.Add("classNumber", cID);
            param.Add("activityID", actID);
            DataTable addKid = HKGManager.SQL.executeProc("addKidToSignedFor", param);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('added-message');", true);

        }
        catch (Exception e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "swal(Cancelled, Couldn't add, error);", true);
        }
    }

    public void DeleteSignedFor(string id, string kinID, string cID, string actID)
    {
        try
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("kidID", id);
            param.Add("kindergardenID", kinID);
            param.Add("classNumber", cID);
            param.Add("activityID", actID);
            DataTable addKid = HKGManager.SQL.executeProc("deleteKidFromSignedFor", param);
            ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('deleted-message');", true);
        }
        catch (Exception e)
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "swal(Cancelled, Couldn't delete, error);", true);
        }
    }
}