using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminRegister : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterAdmin_Click(object sender, EventArgs e)
    {
        // Perform validation before proceeding with the registration
        if (Page.IsValid)
        {
            try
            {
                string username = this.username.Text;
                string password = this.password.Text;
                string email = this.email.Text;
                string fullName = this.full_name.Text;
                string role = this.role.SelectedValue;
                string phoneNumber = this.phone_number.Text;
                string profilePicPath = "";

                // Save the profile picture if uploaded
                if (profile_picture.HasFile)
                {
                    string fileName = System.IO.Path.GetFileName(profile_picture.PostedFile.FileName);
                    profilePicPath = "~/ProfilePictures/" + fileName;
                    profile_picture.SaveAs(Server.MapPath(profilePicPath));
                }

                conn.Open();

                string qry = "INSERT INTO Admins (username, password, email, full_name, role, phone_number, created_at, profile_picture) VALUES (@username, @password, @Email, @FullName, @Role, @PhoneNumber, GETDATE(), @ProfilePic)";

                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password", password); // Consider hashing the password for security
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@ProfilePic", profilePicPath);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    // Success: clear all fields and show success pop-up alert
                    ClearFields();
                    ShowAlert("Admin registered successfully", "alert-success", true);
                }
                else
                {
                    ShowAlert("Error registering admin", "alert-danger", false);
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message, "alert-danger", false);
            }
        }
    }

    private void ShowAlert(string message, string alertType, bool isSuccess)
    {
        

        // Trigger JavaScript alert for pop-up
        string script = isSuccess
            ? "alert('Admin registered successfully!'); document.getElementById('username').focus();"
            : "alert('Error during admin registration. Please try again.'); document.getElementById('username').focus();";

        ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", script, true);
    }

    private void ClearFields()
    {
        // Clear all the form fields
        username.Text = string.Empty;
        password.Text = string.Empty;
        email.Text = string.Empty;
        full_name.Text = string.Empty;
        role.SelectedIndex = 0;
        phone_number.Text = string.Empty;
        profile_picture.Attributes.Clear();
    }
}
