using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: Handle any page load events, e.g., clearing previous session variables
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string mobile = TextBox1.Text;
            string password = TextBox2.Text;
                // Check normal user credentials
                conn.Open();

                string qry = "SELECT Name, Id FROM Users WHERE MobileNumber = @mobile AND PasswordHash = @password";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@mobile", mobile);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.Read())
                {
                    // Successful login for a normal user
                    string username = sdr["Name"].ToString();
                    Session["Name"] = username;
                    string Id = sdr["Id"].ToString();
                    Session["Id"] = Id;
                    Session["m"] = mobile; // Store mobile number

                    ShowAlert("Login Successful", "alert-success");

                    // Redirect to home page after successful login
                    Response.Redirect("home.aspx");
                }
                else
                {
                    // Failed login
                    ShowAlert("Invalid Credentials. Please try again.", "alert-danger");
                }
                conn.Close();
            }
        catch (Exception ex)
        {
            ShowAlert("Error: " + ex.Message, "alert-danger");
        }
        finally
        {
            // Clear fields only on failed login
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        // Redirect to signup page
        Response.Redirect("Signup.aspx");
    }

    private void ShowAlert(string message, string alertType)
    {
        string alertHtml = "<div class='alert " + alertType + "'>" + message + "</div>";
        AlertPlaceholder.Controls.Add(new LiteralControl(alertHtml));
    }
}
