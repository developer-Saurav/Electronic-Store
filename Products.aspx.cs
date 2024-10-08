using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Products : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategories();
            LoadBrands();
            LoadProducts();

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
    }

    private void LoadCategories()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT Category FROM Items", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        ddlCategory.DataSource = reader;
        ddlCategory.DataTextField = "Category";
        ddlCategory.DataValueField = "Category";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Categories", "0"));
        conn.Close();
    }

    private void LoadBrands()
    {
        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT DISTINCT Brand FROM Items", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        ddlBrand.DataSource = reader;
        ddlBrand.DataTextField = "Brand";
        ddlBrand.DataValueField = "Brand";
        ddlBrand.DataBind();
        ddlBrand.Items.Insert(0, new System.Web.UI.WebControls.ListItem("All Brands", "0"));
        conn.Close();
    }

    private void LoadProducts()
    {
        string categoryFilter = ddlCategory.SelectedValue != "0" ? "AND Category = @Category" : "";
        string brandFilter = ddlBrand.SelectedValue != "0" ? "AND Brand = @Brand" : "";

        string query = "SELECT * FROM Items WHERE 1=1 " + categoryFilter + " " + brandFilter;

        SqlCommand cmd = new SqlCommand(query, conn);
        if (ddlCategory.SelectedValue != "0")
        {
            cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
        }
        if (ddlBrand.SelectedValue != "0")
        {
            cmd.Parameters.AddWithValue("@Brand", ddlBrand.SelectedValue);
        }

        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        rptProducts.DataSource = reader;
        rptProducts.DataBind();
        conn.Close();
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadProducts();
    }

    protected void ddlBrand_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadProducts();
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
}
