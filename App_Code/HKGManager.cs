﻿using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for HKGManager
/// </summary>
public static class HKGManager
{
    private static SQLConnection sql = new SQLConnection();
    private static LogWriter logger = new LogWriter();
    private static CSVRead csvreader = new CSVRead();

    private static User authUser;

    public static SQLConnection SQL
    {
        get { return HKGManager.sql; }
        set { HKGManager.sql = value; }
    }

    public static LogWriter Logger
    {
        get { return HKGManager.logger; }
        set { HKGManager.logger = value; }
    }

    public static CSVRead CSVReader
    {
        get { return HKGManager.csvreader; }
        set { HKGManager.csvreader = value; }
    }

    public static User AuthUser
    {
        get { return HKGManager.authUser; }
        set { HKGManager.authUser = value; }
    }


}
