using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class ManageItems : System.Web.UI.Page
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
            SqlCommand cmd = new SqlCommand("select * from Items", conn);
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
    protected void DisplayButton_Click(object sender, EventArgs e)
    {
        grid_view(); 
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        grid_view();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        string ItemName = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string ItemPrice = ((TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string ItemImage = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
        string ItemDescription = ((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
        string ItemQuantity = ((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

        conn.Open();
        SqlCommand cmd = new SqlCommand("update Items set ItemName=@ItemName, ItemPrice=@ItemPrice, ItemImage=@ItemImage, ItemDescription=@ItemDescription, ItemQuantity=@ItemQuantity where ItemId=@ItemId", conn);
        cmd.Parameters.AddWithValue("@ItemId", id);
        cmd.Parameters.AddWithValue("@ItemName", ItemName);
        cmd.Parameters.AddWithValue("@ItemPrice", ItemPrice);
        cmd.Parameters.AddWithValue("@ItemImage", ItemImage);
        cmd.Parameters.AddWithValue("@ItemDescription", ItemDescription);
        cmd.Parameters.AddWithValue("@ItemQuantity", ItemQuantity);
        int t = cmd.ExecuteNonQuery();
        conn.Close();

        if (t > 0)
        {
            Response.Write("<script>alert('Data has been updated')</script>");

            GridView1.EditIndex = -1;
            grid_view();
        }
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        grid_view();
    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddItem.aspx");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete from Items where ItemId='" + id + "'", conn);
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
