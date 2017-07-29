using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Add_Default : System.Web.UI.Page
{
    private static List<HiddenField> hfs = new List<HiddenField>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ACTBox.SelectedIndexChanged += new EventHandler(this.ACTBox_SelectedIndexChanged);
            FillACTBox();
            Literal1.Text = "0";

        }
    }

    public void FillACTBox()
    {
        DataTable activities = HKGManager.SQL.executeProc("getActivities", null);
        foreach (DataRow row in activities.Rows)
        {
            ListItem li = new ListItem(row["name"].ToString());
            li.Value = row["ID"].ToString();
            ACTBox.Items.Add(li);
        }
    }

    protected void ACTBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        Dictionary<string, object> param = new Dictionary<string, object>();
        param.Add("actID", ACTBox.SelectedItem.Value);
        DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByActivity", param);
        GenerateTable(opinions, Table1);
    }

    private void GenerateTable(DataTable dt, Table tbl)
    {
        Table table = tbl;
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
        Cell.Text = "Actions";
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
            TableCell cell1 = new TableCell();
            table.EnableViewState = false;
            HyperLink h1 = new HyperLink()
            {
                Text = string.Format("<i class='fa fa-image'></i>"),
                CssClass = "btn btn-simple btn-info btn-icon table-action view",
                ToolTip = "View"
            };
            HyperLink h2 = new HyperLink()
            {
                Text = string.Format("<i class='fa fa-edit'></i>"),
                CssClass = "btn btn-simple btn-warning btn-icon table-action edit",
                ToolTip = "Edit"
            };
            HyperLink h3 = new HyperLink()
            {
                Text = string.Format("<i class='fa fa-remove'></i>"),
                CssClass = "btn btn-simple btn-danger btn-icon table-action remove",
                ToolTip = "Remove"
            };
            h1.Attributes.Add("onclick", "showSwal('basic','" + row.Cells[1].Text + "');");
            h2.Attributes.Add("onclick", "showSwal('input-field','" + row.Cells[0].Text + "');");
            h3.Attributes.Add("onclick", "showSwal('warning-message-and-confirmation');");
            cell1.Controls.Add(h1);
            HyperLink s1 = new HyperLink() { Text = " " };
            cell1.Controls.Add(s1);
            cell1.Controls.Add(h2);
            HyperLink s2 = new HyperLink() { Text = " " };
            cell1.Controls.Add(s2);
            cell1.Controls.Add(h3);
            row.Cells.Add(cell1);
            // Add the TableRow to the Table
            HiddenField h = new HiddenField();
            h.ID = row.Cells[0].Text;
            h.Value = row.Cells[1].Text;
            hfs.Add(h);
            table.Rows.Add(row);
        }
        Literal1.Text = table.Rows.Count - 1 + "";
    }

    public void printHFS()
    {
        for (int i = 0; i < hfs.Count; i++)
        {
            HKGManager.Logger.Append(hfs[i].ID + " " + hfs[i].Value);
        }
    }
}