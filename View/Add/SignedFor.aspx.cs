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
            FindBtn.OnClientClick += new EventHandler(this.FindBtn_Click);
            Update.OnClientClick += new EventHandler(this.Update_Click);
            lit.Text = "0";
        }
        else
        {
            Session["SelectedKid"] = id.Text;
            if (Session["SelectedKid"] != null)
            {
                id.Text = (string)Session["SelectedKid"];
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
                    cb.Attributes.Add("OnCheckedChanged", "AddSignedFor('"+ dt.Rows[i][0].ToString() + "'," +
                        "'" + selectedKinID + "');");
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

    public void checkToReg()
    {
        foreach (TableRow row in datatables.Rows)
        {
            var cell = row.Cells[10];
            foreach (Control control in cell.Controls)
            {
                var checkBox = control as CheckBox;
                if (checkBox != null)
                {
                    if (checkBox.Checked)
                    {
                        TableCell c = checkBox.Parent as TableCell;
                        TableRow r = c.Parent as TableRow;
                        int index = datatables.Rows.GetRowIndex(row);
                        ClientScript.RegisterStartupScript(GetType(), "hwa", "showSwal('basic','" + index + "');", true);
                    }
                }
            }
        }
    }
    private List<String> checks = new List<string>();

    protected void Update_Click(object sender, EventArgs e)
    {
        checkToReg();
    }

    [System.Web.Services.WebMethod]
    public static string AddSignedFor(string id, string kinID, string cID, string actID)
    {
        try
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("kidID", id);
            param.Add("kindergardenID", kinID);
            param.Add("classNumber", cID);
            param.Add("activityID", actID);
            DataTable opinions = HKGManager.SQL.executeProc("addKidToSignedFor", param);
            return "Kid signed for successfully!";
        }
        catch (Exception e)
        {
            return "Kid wasn't signed!";
        }
    }
}