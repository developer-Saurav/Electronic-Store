using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepeater1();
            BindRepeater2();
        }
    }

    private void BindRepeater1()
    {
        conn.Open();
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Items", conn);
        SqlDataReader dr1 = cmd1.ExecuteReader();

        Repeater1.DataSource = dr1;
        Repeater1.DataBind();

        conn.Close();
    }

    private void BindRepeater2()
    {
        conn.Open();
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM Users", conn);
        SqlDataReader dr2 = cmd2.ExecuteReader();

        Repeater2.DataSource = dr2;
        Repeater2.DataBind();

        conn.Close();
    }
}
