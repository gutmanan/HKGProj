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
    private static List<HiddenField> hfs = new List<HiddenField>();

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
        }*/
    }

    public void FillQueryBox()
    {
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
                DataTable Query2 = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
                GenerateTable(Query2, datatables);
                break;
            /*
        case "c":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
        case "d":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
        case "e":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
        case "f":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
        case "g":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
        case "h":
            DataTable opinions = HKGManager.SQL.executeProc("getOpinionsByKindergarden", null);
            GenerateTable(opinions, datatables); break;
            */
            default:
                //monthString = "Invalid month";
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
            HiddenField h = new HiddenField();
            h.ID = row.Cells[0].Text;
            h.Value = row.Cells[1].Text;
            hfs.Add(h);
            table.Rows.Add(row);
        }
        lit.Text = table.Rows.Count - 1 + "";
        SelectedQuery = QueryBox.SelectedValue;
    }
}