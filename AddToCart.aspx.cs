using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class AddToCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCartItems();
            CalculateTotal();
        }
    }

    private void LoadCartItems()
    {
        // Assuming you've stored the cart in a session variable
        DataTable cart = Session["Cart"] as DataTable;
        if (cart != null)
        {
            rptCartItems.DataSource = cart;
            rptCartItems.DataBind();
        }
    }

    private void CalculateTotal()
    {
        decimal total = 0;
        DataTable cart = Session["Cart"] as DataTable;
        if (cart != null)
        {
            foreach (DataRow row in cart.Rows)
            {
                total += Convert.ToDecimal(row["ItemTotal"]);
            }
        }
        lblItemsTotal.Text = total.ToString("F2");
        lblTotal.Text = (total + 50).ToString("F2"); // Assuming shipping cost is 50
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int itemId = Convert.ToInt32(btn.CommandArgument);

        DataTable cart = Session["Cart"] as DataTable;
        if (cart != null)
        {
            DataRow[] rows = cart.Select("ItemId=" + itemId);
            if (rows.Length > 0)
            {
                cart.Rows.Remove(rows[0]);
            }
            Session["Cart"] = cart;
            LoadCartItems();
            CalculateTotal();
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

    protected void btnOrderNow_Click(object sender, EventArgs e)
    {
        DataTable cart = Session["Cart"] as DataTable;
        if (cart != null && cart.Rows.Count > 0)
        {
            string connStr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // Insert into Orders table
                    SqlCommand cmd = new SqlCommand("INSERT INTO Orders (UserId, TotalAmount) OUTPUT INSERTED.OrderId VALUES (@UserId, @TotalAmount)", conn, transaction);
                    cmd.Parameters.AddWithValue("@UserId", Session["UserId"]);
                    cmd.Parameters.AddWithValue("@TotalAmount", Convert.ToDecimal(lblTotal.Text));
                    int orderId = (int)cmd.ExecuteScalar();

                    // Insert into Order_Items table
                    foreach (DataRow row in cart.Rows)
                    {
                        SqlCommand cmdItem = new SqlCommand("INSERT INTO Order_Items (OrderId, ItemId, Quantity, Price) VALUES (@OrderId, @ItemId, @Quantity, @Price)", conn, transaction);
                        cmdItem.Parameters.AddWithValue("@OrderId", orderId);
                        cmdItem.Parameters.AddWithValue("@ItemId", row["ItemId"]);
                        cmdItem.Parameters.AddWithValue("@Quantity", row["Quantity"]);
                        cmdItem.Parameters.AddWithValue("@Price", row["ItemPrice"]);
                        cmdItem.ExecuteNonQuery();
                    }

                    transaction.Commit();

                    // Clear the cart
                    Session["Cart"] = null;

                    // Redirect to a confirmation page or display a success message
                    Response.Redirect("OrderConfirmation.aspx?OrderId=" + orderId);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    // Handle exception (log it and show an error message)
                }
            }
        }
    }
}
