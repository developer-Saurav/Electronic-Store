using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.UI;

public partial class AdminLogin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        // If cookies exist, autofill username
        if (!IsPostBack && Request.Cookies["AdminLogin"] != null)
        {
            TextBoxUsername.Text = Request.Cookies["AdminLogin"]["username"];
        }
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string username = TextBoxUsername.Text.Trim();
            string password = TextBoxPassword.Text.Trim();

            conn.Open();
            string query = "SELECT admin_id, username, role FROM Admins WHERE username = @username AND password = @password";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password); // Hashed password comparison should be used in real scenarios

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                // Store admin details in session
                Session["AdminId"] = sdr["admin_id"].ToString();
                Session["AdminUsername"] = sdr["username"].ToString();
                Session["AdminRole"] = sdr["role"].ToString();

                // If "Remember Me" is checked, store username in cookies
                if (RememberMe.Checked)
                {
                    HttpCookie cookie = new HttpCookie("AdminLogin");
                    cookie["username"] = username;
                    cookie.Expires = DateTime.Now.AddMonths(1); // Store for 1 month
                    Response.Cookies.Add(cookie);
                }
                else
                {
                    // Clear cookies if unchecked
                    if (Request.Cookies["AdminLogin"] != null)
                    {
                        Response.Cookies["AdminLogin"].Expires = DateTime.Now.AddDays(-1);
                    }
                }

                ShowAlert("Login successful", "alert-success");
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ShowAlert("Invalid username or password", "alert-danger");
            }

            conn.Close();
        }
        catch (Exception ex)
        {
            ShowAlert(ex.Message, "alert-danger");
        }
    }

    private void ShowAlert(string message, string alertType)
    {
        string alertHtml = "<div class='alert " + alertType + "'>" + message + "</div>";
        AlertPlaceholder.Controls.Add(new LiteralControl(alertHtml));
    }
}
