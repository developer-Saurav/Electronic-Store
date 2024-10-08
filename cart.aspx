<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .cart-container {
            margin: 50px auto;
            max-width: 800px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .cart-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .cart-item img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
        }
        .cart-item-details {
            flex: 1;
            margin-left: 20px;
        }
        .cart-item-title {
            font-size: 18px;
            font-weight: bold;
        }
        .cart-item-price {
            color: #28a745;
            font-size: 16px;
        }
        .cart-item-quantity {
            font-size: 16px;
        }
        .cart-item-remove {
            color: #dc3545;
            cursor: pointer;
        }
        .cart-total {
            text-align: right;
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }
        .cart-buttons {
            text-align: right;
            margin-top: 20px;
        }
        .cart-buttons .btn {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
            <div class="cart-header">
                <h2>Your Shopping Cart</h2>
            </div>
            <asp:Repeater ID="rptCartItems" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <a href='<%# "pd.aspx?ItemId=" + Eval("ItemId") %>' target="_blank">
                                <asp:Image ID="Image1" runat="server" Height="144px" Width="198px" ImageUrl='<%#Eval("ItemImage","~/images/{0}") %>' CssClass="img-fluid" />
                            </a>
                        <div class="cart-item-details">
                            <div class="cart-item-title"><%# Eval("ItemName") %></div>
                            <div class="cart-item-price">₹<%# Eval("ItemPrice") %></div>
                            <div class="cart-item-quantity">Quantity: <%# Eval("Quantity") %></div>
                        </div>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("ItemId") %>' OnClick="RemoveItem_Click" CssClass="btn btn-danger" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="cart-total">
                Total: ₹<asp:Label ID="lblTotalAmount" runat="server" Text="0.00"></asp:Label>
            </div>
            <div class="cart-buttons">
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-success" />
                <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" CssClass="btn btn-primary" OnClick="btnContinueShopping_Click" />
            </div>
        </div>
    </form>
</body>
</html>
