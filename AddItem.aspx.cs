using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddItem : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ItemName.Focus();
        }
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        try
        {
            string itemName = ItemName.Text;
            decimal itemPrice = Convert.ToDecimal(ItemPrice.Text);
            string itemDescription = ItemDescription.Text;
            int itemQuantity = Convert.ToInt32(ItemQuantity.Text);
            string category = Category.Text;
            string brand = Brand.Text;
            string imageName = "";

            if (ItemImage.HasFile)
            {
                imageName = ItemImage.FileName;
                ItemImage.SaveAs(Server.MapPath("~/Images/") + imageName);
            }

            conn.Open();
            string qry = "INSERT INTO Items (ItemName, ItemPrice, ItemImage, ItemDescription, ItemQuantity, Category, Brand) VALUES (@ItemName, @ItemPrice, @ItemImage, @ItemDescription, @ItemQuantity, @Category, @Brand)";
            SqlCommand cmd = new SqlCommand(qry, conn);
            cmd.Parameters.AddWithValue("@ItemName", itemName);
            cmd.Parameters.AddWithValue("@ItemPrice", itemPrice);
            cmd.Parameters.AddWithValue("@ItemImage", imageName);
            cmd.Parameters.AddWithValue("@ItemDescription", itemDescription);
            cmd.Parameters.AddWithValue("@ItemQuantity", itemQuantity);
            cmd.Parameters.AddWithValue("@Category", category);
            cmd.Parameters.AddWithValue("@Brand", brand);

            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                SuccessLabel.Text = "Item added successfully.";
                SuccessLabel.Visible = true;
                ClearForm();
                ItemName.Focus();
            }
            else
            {
                SuccessLabel.Text = "Error adding item.";
                SuccessLabel.CssClass = "text-danger";
                SuccessLabel.Visible = true;
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            SuccessLabel.Text = ex.Message;
            SuccessLabel.CssClass = "text-danger";
            SuccessLabel.Visible = true;
        }
    }

    private void ClearForm()
    {
        ItemName.Text = "";
        ItemPrice.Text = "";
        ItemDescription.Text = "";
        ItemQuantity.Text = "";
        Category.Text = "";
        Brand.Text = "";
    }
}
