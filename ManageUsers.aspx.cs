using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManageUsers : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            grid_view();
        }
    }
    private void grid_view()
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Users", conn);
            SqlDataAdapter ad = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ad.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            // Handle exception
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from Users where Id='" + id + "'", conn);
        int t = cmd.ExecuteNonQuery();
        conn.Close();

        if (t > 0)
        {
            Response.Write("<script>alert('data has been deleted')</script>");

            GridView1.EditIndex = -1;
            grid_view();
        }
    }
}