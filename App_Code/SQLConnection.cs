
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
        HKGManager.Logger.Append("Opening conn");
        conn.Open();
    }

    public void closeSQL()
    {
        HKGManager.Logger.Append("Closing conn");
        conn.Close();
    }

    public DataTable executeProc(string procName, Dictionary<String, Object> valMap) 
    {
        if (valMap == null) valMap = new Dictionary<string, object>();

        HKGManager.Logger.Append("Calling proc " + procName +" valMap size "+valMap.Count);
        DataTable toReturn = new DataTable();
        cmd = new SqlCommand();
        cmd.CommandText = procName;
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = conn;

        if (conn.State != ConnectionState.Closed) closeSQL();
        
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
        }
        catch (Exception e)
        {
            HKGManager.Logger.Append("Caught exception: " + e.ToString());
            throw e;
        }
        HKGManager.Logger.Append("Calling proc returned " + toReturn.Rows.Count + " values");
        return toReturn;
    }
    /*
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
                command.Parameters.AddWithValue("@YourSpParameter", "ParameterValue");
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
    */
}

    
