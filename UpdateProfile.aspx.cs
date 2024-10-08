using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

public partial class UpdateProfile : System.Web.UI.Page
{
    private SqlConnection conn;

    protected void Page_Load(object sender, EventArgs e)
    {
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

        if (!IsPostBack)
        {
            LoadUserProfile();
            LoadStates();
        }
    }

    private void LoadUserProfile()
    {
        try
        {
            int userId = Convert.ToInt32(Session["Id"]);

            string query = "SELECT Name, MobileNumber, StateId, CityId, Address, Email FROM Users WHERE Id = @UserId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserId", userId);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtName.Text = reader["Name"].ToString();
                txtMobileNumber.Text = reader["MobileNumber"].ToString();
                ddlState.SelectedValue = reader["StateId"].ToString();
                ddlCity.SelectedValue = reader["CityId"].ToString();
                txtAddress.Text = reader["Address"].ToString();
                txtEmail.Text = reader["Email"].ToString();
            }
            reader.Close(); // Ensure the reader is closed after use
        }
        catch (Exception ex)
        {
            // Handle the error
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            int userId = Convert.ToInt32(Session["Id"]);
            string name = txtName.Text;
            string mobileNumber = txtMobileNumber.Text;
            int stateId = Convert.ToInt32(ddlState.SelectedValue);
            int cityId = Convert.ToInt32(ddlCity.SelectedValue);
            string address = txtAddress.Text;
            string email = txtEmail.Text;

            string query = "UPDATE Users SET Name = @Name, MobileNumber = @MobileNumber, StateId = @StateId, CityId = @CityId, Address = @Address, Email = @Email WHERE Id = @UserId";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@Name", name);
            cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
            cmd.Parameters.AddWithValue("@StateId", stateId);
            cmd.Parameters.AddWithValue("@CityId", cityId);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            // Handle the error
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            conn.Close();
            // Redirecting to home page after update
            Session["Name"] = txtName.Text;
            Response.Redirect("home.aspx");
        }
    }

    private void LoadStates()
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM State", conn);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddlState.DataSource = ds;
            ddlState.DataTextField = "sname";
            ddlState.DataValueField = "sid";
            ddlState.DataBind();

            ddlState.Items.Insert(0, new ListItem("--Select State--", "0"));
        }
        catch (Exception ex)
        {
            // Handle the error
            Response.Write("Error: " + ex.Message);
        }
        finally
        {
            conn.Close();
        }
    }

    private void LoadCities(int stateId)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM City WHERE sid = @stateId", conn);
            cmd.Parameters.AddWithValue("@stateId", stateId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddlCity.DataSource = ds;
            ddlCity.DataTextField = "cname";
            ddlCity.DataValueField = "cid";
            ddlCity.DataBind();

            ddlCity.Items.Insert(0, new ListItem("--Select City--", "0"));
        }
        catch (Exception ex)
        {
            // Handle the error
            Response.Write("Error: " + ex.Message);
        }
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        int stateId = Convert.ToInt32(ddlState.SelectedValue);
        if (stateId > 0)
        {
            LoadCities(stateId);
        }
        else
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("--Select City--", "0"));
        }
    }
}
