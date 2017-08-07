using System;
using System.Web;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class CSVRead
{
    public void readTrainingsCSV()
    {
        Dictionary<String, Object> para;

        using (var reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("~/Trainings.csv")))
        {

            while (!reader.EndOfStream)
            {
                para = new Dictionary<String, Object>();
                var line = reader.ReadLine();
                var values = line.Split(',');
                try
                {
                    int.Parse(values[0]);
                }
                catch (Exception ex)
                {
                    continue;
                }
                /*Console.Write("Training ID: " + values[0] + " Training Name: " + values[1]);

                Console.Write("\n");*/

                para.Add("ID", values[0]);
                para.Add("name", values[1]);

                try
                {
                    HKGManager.SQL.executeProc("addTraining", para);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }

    public void readTrainingsForAssistantCSV()
    {
        Dictionary<String, Object> para;

        using (var reader = new StreamReader(@"~/TrainingsForA.csv"))
        {

            while (!reader.EndOfStream)
            {
                para = new Dictionary<String, Object>();
                var line = reader.ReadLine();
                var values = line.Split(',');
                try
                {
                    int.Parse(values[0]);
                }
                catch (Exception ex)
                {
                    continue;
                }
                /*Console.Write("Training ID: " + values[0] + " Training Name: " + values[1]);

                Console.Write("\n");*/

                string date = values[2];
                DateTime time = DateTime.Parse(date);

                para.Add("assistantID", values[0]);
                para.Add("trainingID", values[1]);
                para.Add("trainingDate", date);

                try
                {
                    HKGManager.SQL.executeProc("addTrainingForAssistant", para);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }
    }

    public void cleanCSVData()
    {
        try
        {
            HKGManager.SQL.executeProc("cleanTrainings", null);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}

