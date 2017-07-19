
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

public class SQLConnection
{
    private string connstring = "Data Source = mydb.clhc9gw7vvuf.eu-west-2.rds.amazonaws.com; Initial Catalog = KindergardenSolution; User ID = HaifaKinderProj; Password = 12345678";
    private SqlConnection conn;
    private SqlCommand cmd;

    public SQLConnection()
    {
        conn = new SqlConnection(connstring);
    }

    public void openSQL()
    {
        conn.Open();
    }

    public void closeSQL()
    {
        conn.Close();
    }

    public DataTable runProcWithResults(string procName, Dictionary<String, Object> valMap)
    {
        if (valMap == null) valMap = new Dictionary<string, object>();
        HKGManager.Logger.Append("Calling proc " + procName);
        DataTable toReturn = new DataTable();
        cmd = new SqlCommand();
        cmd.CommandText = procName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = conn;

        if (conn.State != ConnectionState.Closed)
        {
            HKGManager.Logger.Append("Closing conn");
            closeSQL();
        }
        try
        {
            //Add values to the PROC Execution
            foreach (KeyValuePair<String, Object> entry in valMap)
            {
                HKGManager.Logger.Append("@" + entry.Key + ", " + entry.Value);
                cmd.Parameters.AddWithValue("@" + entry.Key, entry.Value);
            }

            openSQL();

            SqlDataAdapter dr = new SqlDataAdapter(cmd);
            dr.Fill(toReturn);

            //For EXEC DML
            //myCommand.ExecuteNonQuery();

            closeSQL();

            HKGManager.Logger.Append("Calling proc returned" + toReturn.Rows.Count +" values");
            return toReturn;
        }
        catch (Exception e)
        {
            HKGManager.Logger.Append("Caught exception: " + e.ToString());
            return new DataTable();
        }
    }

    public List<String> executeProc(String s) {
        List<string> res = new List<string>();
        //Create the connection object
        using (conn = new SqlConnection(connstring))
        {
            // Open the SqlConnection.
            conn.Open();
            // Create the SQLCommand object
            using (SqlCommand command = new SqlCommand(s, conn) { CommandType = System.Data.CommandType.StoredProcedure })
            {
                // Pass the parameter values here
                // command.Parameters.AddWithValue("@kid", "111190611");
                /* command.Parameters.AddWithValue("@YourSpParameter", "ParameterValue");*/
                int rowsAffected = command.ExecuteNonQuery();
                Console.WriteLine("THE PRINT " + rowsAffected);
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        res.Add(reader["name"].ToString());
                    }
                }

            }
            conn.Close();
            return res;
        }
    }
}

    
