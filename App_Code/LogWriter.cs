using System;
using System.IO;
using System.Reflection;


public class LogWriter
{
    private string path = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);

    public void Append(string logMessage)
    {
        try
        {
            using (StreamWriter w = File.AppendText(path + "\\" + "log.txt"))
            {
                Log(logMessage, w);
            }
        }
        catch (Exception ex) { }
    }

    private void Log(string logMessage, TextWriter txtWriter)
    {
        try
        {
            txtWriter.Write("Log Entry : ");
            txtWriter.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(), DateTime.Now.ToLongDateString());
            txtWriter.WriteLine("  : {0}", logMessage);
        }
        catch (Exception ex) { }
    }
}