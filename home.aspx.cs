using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;


public partial class home : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDataList();
        }
        if (Session["Name"] == null)
        {
            Response.Redirect("login.aspx");
            Button1.Visible = false;
        }
        else
        {
            
            Label2.Text = Session["Name"].ToString();
            Button2.Visible = false;
            Button3.Visible = false;
        }
    }

    private void BindDataList()
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Items", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            DataList1.DataSource = dr;
            DataList1.DataBind();
            conn.Close();
        }
        catch (Exception ex)
        {
            // Handle the error
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                conn.Close();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        // Your logic for the login button click event
        // For example, you might redirect the user to a login page:
        Response.Redirect("Login.aspx");
    }
    protected void btnAddToCart_Click(object sender, EventArgs e)
    {
        // Get the button that raised the event
        Button btn = (Button)sender;

        // Get the ItemId from the CommandArgument property
        int itemId = Convert.ToInt32(btn.CommandArgument);

        // Find the corresponding quantity TextBox within the DataListItem
        DataListItem item = (DataListItem)btn.NamingContainer;
        TextBox txtQuantity = (TextBox)item.FindControl("txtQuantity");

        // Parse the quantity value
        int quantity = Convert.ToInt32(txtQuantity.Text);

        // Add item to the cart (assuming you have a method to handle this)
        AddToCart(itemId, quantity);

        // Optionally, display a message or redirect the user
        Response.Redirect("AddToCart.aspx");
    }

    private void AddToCart(int itemId, int quantity)
    {
        // Implement the logic to add the item to the cart
        // For example, you could store cart items in a session variable or a database
    }


}
