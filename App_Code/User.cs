using System;

public class User
{
    private String ID;
    private String First_Name;
    private String Last_Name;
    private String Birthdate;

    public User(String ID, String First_Name, String Last_Name, String Birthdate)
    {
        this.ID = ID;
        this.First_Name = First_Name;
        this.Last_Name = Last_Name;
        this.Birthdate = Birthdate;
    }

    override
    public String ToString()
    {
        return First_Name + " " + Last_Name;
    }

    public string id
    {
        get { return this.ID; }
        set { this.ID = value; }
    }
}