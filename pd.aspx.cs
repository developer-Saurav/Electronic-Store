using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class pd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string itemId = Request.QueryString["ItemId"];
            if (!string.IsNullOrEmpty(itemId))
            {
                LoadItemDetails(itemId);
            }
            if (Session["Name"] == null)
            {
                Response.Redirect("login.aspx");
                ButtonAddToCart.Visible = false;
            }
            else
            {
                LabelUsername.Text = Session["Name"].ToString();
                LinkButtonSignup.Visible = false;
                LinkButtonLogin.Visible = false;
            }
        }
    }

    private void LoadItemDetails(string itemId)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT ItemName, ItemPrice, ItemDescription, ItemImage FROM Items WHERE ItemId = @ItemId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ItemId", itemId);

            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                lblItemName.Text = reader["ItemName"].ToString();
                lblItemPrice.Text = "Price: ₹" + reader["ItemPrice"].ToString();
                lblItemDescription.Text = reader["ItemDescription"].ToString();
                imgItem.ImageUrl = "~/images/" + reader["ItemImage"].ToString();
            }
            connection.Close();
        }
    }

    protected void ButtonAddToCart_Click(object sender, EventArgs e)
    {
        string itemId = Request.QueryString["ItemId"];
        int quantity = int.Parse(txtQuantity.Text);
        if (!string.IsNullOrEmpty(itemId) && quantity > 0)
        {
            AddToCart(itemId, quantity);
        }
    }

    private void AddToCart(string itemId, int quantity)
    {
        string userId = Session["Id"].ToString(); // Replace with actual user ID
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlTransaction transaction = connection.BeginTransaction();

            try
            {
                // Verify UserId exists
                string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE Id = @UserId";
                SqlCommand checkUserCommand = new SqlCommand(checkUserQuery, connection, transaction);
                checkUserCommand.Parameters.AddWithValue("@UserId", userId);
                int userExists = (int)checkUserCommand.ExecuteScalar();

                if (userExists == 0)
                {
                    throw new Exception("User does not exist.");
                }

                // Check if an open order exists for the user
                string checkOrderQuery = "SELECT OrderId FROM Orders WHERE UserId = @UserId AND TotalAmount IS NULL";
                SqlCommand checkOrderCommand = new SqlCommand(checkOrderQuery, connection, transaction);
                checkOrderCommand.Parameters.AddWithValue("@UserId", userId);
                object orderIdObj = checkOrderCommand.ExecuteScalar();

                int orderId;
                if (orderIdObj == null)
                {
                    // Create a new order
                    string createOrderQuery = "INSERT INTO Orders (UserId) OUTPUT INSERTED.OrderId VALUES (@UserId)";
                    SqlCommand createOrderCommand = new SqlCommand(createOrderQuery, connection, transaction);
                    createOrderCommand.Parameters.AddWithValue("@UserId", userId);
                    orderId = (int)createOrderCommand.ExecuteScalar();
                }
                else
                {
                    orderId = (int)orderIdObj;
                }

                // Insert item into Order_Items
                string insertItemQuery = "INSERT INTO Order_Items (OrderId, ItemId, Quantity, Price) VALUES (@OrderId, @ItemId, @Quantity, @Price)";
                SqlCommand insertItemCommand = new SqlCommand(insertItemQuery, connection, transaction);
                insertItemCommand.Parameters.AddWithValue("@OrderId", orderId);
                insertItemCommand.Parameters.AddWithValue("@ItemId", itemId);
                insertItemCommand.Parameters.AddWithValue("@Quantity", quantity);
                insertItemCommand.Parameters.AddWithValue("@Price", GetItemPrice(itemId)); // Fetch item price
                insertItemCommand.ExecuteNonQuery();

                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                // Log the exception or show a message
                throw new Exception("Error adding item to cart: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }

        // Redirect to the cart page after adding the item
        Response.Redirect("cart.aspx");
    }


    private decimal GetItemPrice(string itemId)
    {
        decimal price = 0;
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT ItemPrice FROM Items WHERE ItemId = @ItemId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ItemId", itemId);

            connection.Open();
            object result = command.ExecuteScalar();
            if (result != null)
            {
                price = (decimal)result;
            }
            connection.Close();
        }
        return price;
    }

    protected void ButtonBuyNow_Click(object sender, EventArgs e)
    {
        string itemId = Request.QueryString["ItemId"];
        int quantity = int.Parse(txtQuantity.Text);

        if (!string.IsNullOrEmpty(itemId) && quantity > 0)
        {
            PlaceOrder(itemId, quantity);
        }
    }

    private void PlaceOrder(string itemId, int quantity)
    {
        string userId = Session["Id"].ToString(); // Replace with actual user ID
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            SqlTransaction transaction = connection.BeginTransaction();

            try
            {
                // Verify UserId exists
                string checkUserQuery = "SELECT COUNT(*) FROM Users WHERE Id = @UserId";
                SqlCommand checkUserCommand = new SqlCommand(checkUserQuery, connection, transaction);
                checkUserCommand.Parameters.AddWithValue("@UserId", userId);
                int userExists = (int)checkUserCommand.ExecuteScalar();

                if (userExists == 0)
                {
                    throw new Exception("User does not exist.");
                }

                // Create a new order
                string createOrderQuery = "INSERT INTO Orders (UserId, TotalAmount) OUTPUT INSERTED.OrderId VALUES (@UserId, @TotalAmount)";
                SqlCommand createOrderCommand = new SqlCommand(createOrderQuery, connection, transaction);
                createOrderCommand.Parameters.AddWithValue("@UserId", userId);
                decimal totalAmount = GetItemPrice(itemId) * quantity;
                createOrderCommand.Parameters.AddWithValue("@TotalAmount", totalAmount);
                int orderId = (int)createOrderCommand.ExecuteScalar();

                // Insert item into Order_Items
                string insertItemQuery = "INSERT INTO Order_Items (OrderId, ItemId, Quantity, Price) VALUES (@OrderId, @ItemId, @Quantity, @Price)";
                SqlCommand insertItemCommand = new SqlCommand(insertItemQuery, connection, transaction);
                insertItemCommand.Parameters.AddWithValue("@OrderId", orderId);
                insertItemCommand.Parameters.AddWithValue("@ItemId", itemId);
                insertItemCommand.Parameters.AddWithValue("@Quantity", quantity);
                insertItemCommand.Parameters.AddWithValue("@Price", GetItemPrice(itemId)); // Fetch item price
                insertItemCommand.ExecuteNonQuery();

                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                // Log the exception or show a message
                throw new Exception("Error placing order: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }

    protected void LinkButtonLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

    protected void LinkButtonSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signup.aspx");
    }

    protected void LinkButtonLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}
