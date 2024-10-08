<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .product-card {
            margin-bottom: 20px;
        }

        .product-image {
            height: 200px;
            object-fit: cover;
        }

        .dropdown-container {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .product-card {
            cursor: pointer;
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .navbar {
            background-color: black;
        }

        .navbar-brand, .navbar-nav .nav-link, .navbar-nav .nav-link-button {
            color: #fff;
        }

        .navbar-nav .nav-link-button:hover {
            color: #ffc107;
            text-decoration: none;
        }
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.aspx">Electronics Store</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.aspx">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="Products.aspx">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="Button3" runat="server" CssClass="nav-link-button nav-link" Text="Login" OnClick="Button3_Click" />
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="Button2" runat="server" CssClass="nav-link-button nav-link" Text="Signup" OnClick="Button2_Click" />
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label> 
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="UpdateProfile.aspx">Update Profile</a>
                            <a class="dropdown-item" href="cart.aspx">View Cart</a>
                            <div class="dropdown-divider"></div>
                            <asp:LinkButton ID="Button1" runat="server" CssClass="dropdown-item" Text="Logout" OnClick="Button1_Click" />
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container mt-5">
            <div class="dropdown-container">
                <div class="form-group">
                    <label for="ddlCategory">Sort by Category:</label>
                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="ddlBrand">Sort by Brand:</label>
                    <asp:DropDownList ID="ddlBrand" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBrand_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card product-card" onclick="window.location.href='pd.aspx?itemid=<%# Eval("ItemId") %>'">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ItemImage","~/images/{0}") %>' CssClass="product-image" />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("ItemName") %></h5>
                                    <p class="card-text"><%# Eval("ItemDescription") %></p>
                                    <p class="card-text text-muted"><%# Eval("Category") %> - <%# Eval("Brand") %></p>
                                    <p class="card-text font-weight-bold">₹<%# Eval("ItemPrice", "{0:F2}") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
