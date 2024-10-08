using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Signup : System.Web.UI.Page
{
    private SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        if (!IsPostBack)
        {
            LoadStates();
        }
    }

    private void LoadStates()
    {
        try
        {
            using (conn)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM State", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "sname";
                DropDownList1.DataValueField = "sid";
                DropDownList1.DataBind();

                // Add a default item to the dropdown
                DropDownList1.Items.Insert(0, new ListItem("--Select State--", "0"));
            }
        }
        catch (Exception ex)
        {
            ShowAlert("Error loading states: " + ex.Message, "alert-danger");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            string name = TextBox1.Text.Trim();
            string mobile = TextBox2.Text.Trim();
            string password = TextBox3.Text.Trim();
            int stateId = int.Parse(DropDownList1.SelectedValue);
            int cityId = int.Parse(DropDownList2.SelectedValue);
            string address = TextBox4.Text.Trim();
            string email = TextBox5.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(mobile) || stateId == 0 || cityId == 0 ||
                string.IsNullOrEmpty(address) || string.IsNullOrEmpty(email))
            {
                ShowAlert("Please fill all the fields.", "alert-danger");
                return;
            }

            if (password.Length < 6)
            {
                ShowAlert("Password must be at least 6 characters long.", "alert-danger");
                return;
            }

            using (conn)
            {
                conn.Open();
                string qry = "INSERT INTO Users (Name, MobileNumber, PasswordHash, StateId, CityId, Address, Email) " +
                             "VALUES (@Name, @MobileNumber, @Password, @StateId, @CityId, @Address, @Email)";
                SqlCommand cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@MobileNumber", mobile);
                cmd.Parameters.AddWithValue("@Password", password); // Note: Store hashed passwords in a real application
                cmd.Parameters.AddWithValue("@StateId", stateId);
                cmd.Parameters.AddWithValue("@CityId", cityId);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@Email", email);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    ShowAlert("Signup Successful", "alert-success");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    ShowAlert("Signup Failed", "alert-danger");
                }
            }
        }
        catch (Exception ex)
        {
            ShowAlert("An error occurred: " + ex.Message, "alert-danger");
        }
        finally
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }
    }


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int stateId = Convert.ToInt32(DropDownList1.SelectedValue);
        if (stateId > 0)
        {
            LoadCities(stateId);
        }
        else
        {
            DropDownList2.Items.Clear();
            DropDownList2.Items.Add(new ListItem("--Select City--", "0"));
        }
    }

    private void LoadCities(int stateId)
    {
        try
        {
            using (conn)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM City WHERE sid = @stateId", conn);
                cmd.Parameters.AddWithValue("@stateId", stateId);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DropDownList2.DataSource = ds;
                DropDownList2.DataTextField = "cname";
                DropDownList2.DataValueField = "cid";
                DropDownList2.DataBind();

                // Add a default item to the dropdown
                DropDownList2.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }
        catch (Exception ex)
        {
            ShowAlert("Error loading cities: " + ex.Message, "alert-danger");
        }
    }

    private void ShowAlert(string message, string alertType)
    {
        string alertHtml = "<div class='alert " + alertType + " alert-dismissible fade show' role='alert'>" +
            message +
            "<button type='button' class='close' aria-label='Close' onclick='this.parentElement.style.opacity=\"0\"; setTimeout(function() { this.parentElement.remove(); }, 500);'>" +
            "<span aria-hidden='true'>&times;</span></button></div>";

        AlertPlaceholder.Controls.Add(new Literal { Text = alertHtml });
    }
}
