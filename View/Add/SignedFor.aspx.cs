using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_SignedFor : System.Web.UI.Page
{
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
        DataTable kid = HKGManager.SQL.executeProc("getKid", param);
        Dictionary<string, object> para = new Dictionary<string, object>();
        foreach (DataRow row in kid.Rows)
        {
            para.Add("kindergardenID", row["kindergardenID"].ToString());
            para.Add("classNumber", row["classNumber"].ToString());
        }
        DataTable activities = HKGManager.SQL.executeProc("activityInKindergarden", para);
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
        TableHeaderCell Cell = new TableHeaderCell();
        Cell.Text = "Assign";
        row.Cells.Add(Cell);
        table.Rows.Add(row);

        //Add the Column values
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            row = new TableRow();
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                TableCell cell = new TableCell();
                cell.Text = dt.Rows[i][j].ToString();
                row.Cells.Add(cell);
            }
            TableCell c = new TableCell();
            CheckBox cb = new CheckBox();
            cb.Checked = true;
            c.Controls.Add(cb);
            row.Cells.Add(c);
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
}