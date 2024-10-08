<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Roboto', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 400px;
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.5s ease-in-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
            border-radius: 6px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            font-size: 18px;
            background-color: #6a11cb;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #4c07b5;
        }

        .alert {
            padding: 15px;
            margin-top: 20px;
            border-radius: 6px;
        }

        .text-center {
            margin-top: 15px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Login</h2>

            <asp:PlaceHolder ID="AlertPlaceholder" runat="server"></asp:PlaceHolder>

            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Username is required!" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Password is required!" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" CssClass="mt-2" />

            <div class="form-group mt-3">
                <asp:Button ID="ButtonLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="ButtonLogin_Click" />
            </div>

            <div class="text-center">
                <a href="AdminRegister.aspx">Don't have an account? Register</a>
            </div>
        </div>
    </form>
</body>
</html>
