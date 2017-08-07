using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HKGManager.AuthUser == null) userLogged.Text = "Admin";
        else userLogged.Text = HKGManager.AuthUser.ToString();
        if (!IsPostBack)
        {
            Import.OnClientClick += new EventHandler(this.Import_Click);
        }
    }

    protected void Import_Click(object sender, EventArgs e)
    {
        try
        {
            HKGManager.CSVReader.readTrainingsCSV();
            HKGManager.CSVReader.readTrainingsForAssistantCSV();
            booll.Value = "0";
            HKGManager.Logger.Append("Successfully imported " + booll.Value);
        }
        catch (Exception ex)
        {
            booll.Value = "1";
            HKGManager.Logger.Append("Faild to import " + booll.Value);
        }
    }
}
