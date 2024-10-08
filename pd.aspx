<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pd.aspx.cs" Inherits="pd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
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
        .product-details {
            margin: 20px;
        }
        .product-image {
            width: 500px; /* Set the desired width */
            height: 500px; /* Set the desired height */
            object-fit: cover; /* Ensures the image covers the entire area */
            border-radius: 5px; /* Optional: to make the corners slightly rounded */
        }
        .product-info {
            margin-top: 20px;
        }
        .product-title {
            font-size: 24px;
            font-weight: bold;
        }
        .product-price {
            color: green;
            font-size: 20px;
            margin-top: 10px;
        }
        .product-description {
            margin-top: 20px;
        }
        .buttons {
            margin-top: 20px;
        }
        .button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-right: 10px;
            border-radius: 4px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .quantity-input {
            max-width: 80px;
            margin-right: 10px;
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Products.aspx">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LinkButtonLogin" runat="server" CssClass="nav-link-button nav-link" Text="Login" OnClick="LinkButtonLogin_Click" />
                    </li>
                    <li class="nav-item">
                        <asp:LinkButton ID="LinkButtonSignup" runat="server" CssClass="nav-link-button nav-link" Text="Signup" OnClick="LinkButtonSignup_Click" />
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <asp:Label ID="LabelUsername" runat="server" Text="Label"></asp:Label> 
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="UpdateProfile.aspx">Update Profile</a>
                            <a class="dropdown-item" href="cart.aspx">View Cart</a>
                            <a class="dropdown-item" href="#">Subscription</a>
                            <div class="dropdown-divider"></div>
                            <asp:LinkButton ID="LinkButtonLogout" runat="server" CssClass="dropdown-item" Text="Logout" OnClick="LinkButtonLogout_Click" />
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row product-details">
                <div class="col-md-6">
                    <asp:Image ID="imgItem" runat="server" CssClass="product-image" />
                </div>
                <div class="col-md-6 product-info">
                    <div>
                        <asp:Label ID="lblItemName" runat="server" CssClass="product-title"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblItemDescription" runat="server" CssClass="product-description"></asp:Label>
                    </div>
                    <div>
                        <asp:Label ID="lblItemPrice" runat="server" CssClass="product-price"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row buttons">
                <div class="col-md-6 d-flex align-items-center">
                    <h5 class="mr-2">Quantity:</h5>
                    <asp:TextBox ID="txtQuantity" runat="server" Text="1" Width="100px" CssClass="form-control quantity-input"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Button ID="ButtonAddToCart" runat="server" Text="Add to cart" OnClick="ButtonAddToCart_Click" CssClass="button btn btn-primary" />
                    <asp:Button ID="ButtonBuyNow" runat="server" Text="Buy now" CssClass="button btn btn-success" OnClick="ButtonBuyNow_Click" OnClientClick="alert('Order placed successfully!');" />
                </div>
            </div>
        </div>
    </form>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
