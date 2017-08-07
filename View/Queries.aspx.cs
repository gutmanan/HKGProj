using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Default2 : System.Web.UI.Page
{
    private static String SelectedQuery;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            QueryBox.SelectedIndexChanged += new EventHandler(this.QueryBox_SelectedIndexChanged);
            FillQueryBox();
            lit.Text = "0";
        }
        /*
        else
        {
            QueryBox.SelectedIndexChanged -= new EventHandler(this.QueryBox_SelectedIndexChanged);
            Session["SelectedListItem"] = QueryBox.SelectedValue;
            if (Session["SelectedListItem"] != null)
            {
                QueryBox.SelectedValue = (string)Session["SelectedListItem"];
                this.QueryBox_SelectedIndexChanged(sender, e);
            }
        }
        */
    }

    public void FillQueryBox()
    {
        ListItem l = new ListItem("Select Query"); l.Value = "0"; QueryBox.Items.Add(l);
        ListItem la = new ListItem("Query 1"); la.Value = "a"; QueryBox.Items.Add(la);
        ListItem lb = new ListItem("Query 2"); lb.Value = "b"; QueryBox.Items.Add(lb);
        ListItem lc = new ListItem("Query 3"); lc.Value = "c"; QueryBox.Items.Add(lc);
        ListItem ld = new ListItem("Query 4"); ld.Value = "d"; QueryBox.Items.Add(ld);
        ListItem le = new ListItem("Query 5"); le.Value = "e"; QueryBox.Items.Add(le);
        ListItem lf = new ListItem("Query 6"); lf.Value = "f"; QueryBox.Items.Add(lf);
        ListItem lg = new ListItem("Query 7"); lg.Value = "g"; QueryBox.Items.Add(lg);
        ListItem lh = new ListItem("Query 8"); lh.Value = "h"; QueryBox.Items.Add(lh);
    }

    public void QueryBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (QueryBox.SelectedItem.Value)
        {
            case "a":
                DataTable Query1 = HKGManager.SQL.executeProc("Query1", null);
                GenerateTable(Query1, datatables);
                break;
            case "b":
                DataTable Query2 = HKGManager.SQL.executeProc("Query2", null);
                GenerateTable(Query2, datatables);
                break;
            case "c":
                DataTable Query3 = HKGManager.SQL.executeProc("Query3", null);
                GenerateTable(Query3, datatables);
                break;
            case "d":
                DataTable Query4 = HKGManager.SQL.executeProc("Query4", null);
                GenerateTable(Query4, datatables);
                break;
            case "e":
                DataTable Query5 = HKGManager.SQL.executeProc("Query5", null);
                GenerateTable(Query5, datatables);
                break;
            case "f":
                DataTable Query6 = HKGManager.SQL.executeProc("Query6", null);
                GenerateTable(Query6, datatables); break;
            case "g":
                DataTable Query7 = HKGManager.SQL.executeProc("Query7", null);
                GenerateTable(Query7, datatables); break;
            case "h":
                DataTable Query8 = HKGManager.SQL.executeProc("Query8", null);
                GenerateTable(Query8, datatables); break;
            default:
                break;
        }
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
            // Add the TableRow to the Table
            table.Rows.Add(row);
        }
        lit.Text = table.Rows.Count - 1 + "";
        SelectedQuery = QueryBox.SelectedValue;
    }
}