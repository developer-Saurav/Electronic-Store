<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Electronics Store</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
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

        .hero-section {
            background-color: black;
            background-size: cover;
            height: 500px;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .hero-section h1 {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .hero-section p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }

        .hero-section a {
            background-color: #ffc107;
            padding: 0.75rem 1.5rem;
            border-radius: 5px;
            color: #000;
            text-decoration: none;
        }

        .products-section {
            padding: 3rem 0;
        }

        .product-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-card-body {
            padding: 1rem;
            text-align: center;
        }

        .product-card-title {
            font-size: 1.25rem;
            margin-bottom: 0.5rem;
        }

        .product-card-price {
            font-size: 1.1rem;
            color: #28a745;
        }

        .footer {
            background-color: #007bff;
            color: #fff;
            padding: 1rem 0;
            text-align: center;
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
                        <a class="nav-link" href="home.aspx">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Products.aspx">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Contact.aspx">Contact</a>
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
                            <a class="dropdown-item" href="#">Subscription</a>
                            <div class="dropdown-divider"></div>
                            <asp:LinkButton ID="Button1" runat="server" CssClass="dropdown-item" Text="Logout" OnClick="Button1_Click" />
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="hero-section">
            <div>
                <img src="images/hero.jpg"  height="522px" width="1519px" style="object-fit: cover"/>
                <a href="Products.aspx">Shop Now</a>
            </div>
        </div>

        <div class="container mt-5 mb-5">
            <div class="row">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" CssClass="list-group" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="product-card" onclick="'pd.aspx?itemid=<%# Eval("ItemId") %>'">
                            <a href='<%# "pd.aspx?ItemId=" + Eval("ItemId") %>' target="_blank">
                                <asp:Image ID="Image1" runat="server" Height="144px" Width="198px" ImageUrl='<%#Eval("ItemImage","~/images/{0}") %>' CssClass="img-fluid" />
                            </a>
                            <div class="product-card-body">
                                <h5 class="product-card-title"><%# Eval("ItemName") %></h5>
                                <p class="product-card-price">Price: ₹<%# Eval("ItemPrice") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>

        <div class="footer">
            <p>&copy; 2024 Electronics Store. All rights reserved.</p>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>