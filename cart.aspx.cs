using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartItems();
        }
    }

    private void LoadCartItems()
    {
        string userId = Session["Id"].ToString(); // Replace with actual user ID
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT 
                    oi.ItemId, 
                    i.ItemName, 
                    i.ItemPrice, 
                    i.ItemImage, 
                    oi.Quantity, 
                    oi.Price 
                FROM 
                    Order_Items oi 
                INNER JOIN 
                    Items i ON oi.ItemId = i.ItemId 
                WHERE 
                    oi.OrderId = (SELECT OrderId FROM Orders WHERE UserId = @UserId AND TotalAmount IS NULL)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserId", userId);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            rptCartItems.DataSource = reader;
            rptCartItems.DataBind();
            connection.Close();
        }

        CalculateTotalAmount();
    }

    private void CalculateTotalAmount()
    {
        decimal totalAmount = 0;
        string userId = Session["Id"].ToString(); // Replace with actual user ID
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
                SELECT 
                    SUM(oi.Quantity * oi.Price) AS TotalAmount 
                FROM 
                    Order_Items oi 
                INNER JOIN 
                    Orders o ON oi.OrderId = o.OrderId 
                WHERE 
                    o.UserId = @UserId AND o.TotalAmount IS NULL";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserId", userId);

            connection.Open();
            object result = command.ExecuteScalar();
            if (result != DBNull.Value)
            {
                totalAmount = Convert.ToDecimal(result);
            }
            connection.Close();
        }

        lblTotalAmount.Text = totalAmount.ToString("0.00");
    }

    protected void RemoveItem_Click(object sender, EventArgs e)
    {
        Button btnRemove = (Button)sender;
        string itemId = btnRemove.CommandArgument;
        string userId = Session["Id"].ToString(); // Replace with actual user ID
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = @"
                DELETE FROM 
                    Order_Items 
                WHERE 
                    ItemId = @ItemId 
                    AND OrderId = (SELECT OrderId FROM Orders WHERE UserId = @UserId AND TotalAmount IS NULL)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ItemId", itemId);
            command.Parameters.AddWithValue("@UserId", userId);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

        LoadCartItems();
    }
    protected void btnContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }
}
