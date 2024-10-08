<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddToCart.aspx.cs" Inherits="AddToCart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Add to Cart - Electronics Store</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>

        /* Your existing CSS for the navbar */

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



        .cart-section {

            padding: 2rem 0;

        }



        .cart-item {

            border-bottom: 1px solid #ddd;

            padding: 1rem 0;

        }



        .cart-item:last-child {

            border-bottom: none;

        }



        .cart-item img {

            width: 100px;

            height: 100px;

            object-fit: cover;

        }



        .order-summary {

            border: 1px solid #ddd;

            padding: 1.5rem;

            border-radius: 10px;

            background-color: #f8f9fa;

        }



        .order-summary h5 {

            margin-bottom: 1.5rem;

        }



        .order-summary .total {

            font-size: 1.5rem;

            color: #28a745;

        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="#">Electronics Store</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Products</a>
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
                    <li class="nav-item">
                        <asp:LinkButton ID="Button1" runat="server" CssClass="nav-link-button nav-link" Text="Logout" OnClick="Button1_Click" />
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container cart-section">
            <h2 class="mb-4">Your Cart</h2>
            <div class="row">
                <div class="col-md-8">
                    <asp:Repeater ID="rptCartItems" runat="server">
                        <ItemTemplate>
                            <div class="cart-item d-flex align-items-center">
                                <img src='<%# Eval("ItemImage") %>' alt='<%# Eval("ItemName") %>' />
                                <div class="ml-3">
                                    <h5><%# Eval("ItemName") %></h5>
                                    <p>Price: ₹<%# Eval("ItemPrice") %> x <%# Eval("Quantity") %></p>
                                    <p>Total: ₹<%# Eval("ItemTotal") %></p>
                                    <asp:Button ID="btnRemove" runat="server" CssClass="btn btn-danger btn-sm" Text="Remove" CommandArgument='<%# Eval("ItemId") %>' OnClick="btnRemove_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <div class="order-summary">
                        <h5>Order Summary</h5>
                        <p>Items Total: ₹<asp:Label ID="lblItemsTotal" runat="server" Text="0"></asp:Label></p>
                        <p>Shipping: ₹<asp:Label ID="lblShipping" runat="server" Text="50"></asp:Label></p>
                        <p class="total">Total: ₹<asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></p>
                        <asp:Button ID="btnOrderNow" runat="server" CssClass="btn btn-success btn-block mt-3" Text="Order Now" OnClick="btnOrderNow_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
