<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Page</title>
    <!-- Styles and other head elements -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            margin: 0;
        }

        .container {
            margin-top:50px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .logo img {
            width: 120px;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }

        .input-box {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            margin-bottom: 10px;
            transition: border-color 0.3s;
        }

        .input-box:focus {
            border-color: #007bff;
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .alert {
            padding: 10px;
            border-radius: 6px;
            margin-bottom: 15px;
            position: relative;
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 16px;
            cursor: pointer;
        }

        .link-container {
            margin-top: 10px;
            text-align: center;
        }

        .link-container span {
            color: #555;
        }

        .link-container a {
            color: #007bff;
            text-decoration: none;
        }

        .link-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" HeaderText="Please fix the following errors:" DisplayMode="BulletList" />
            
            
            <h1>Login</h1>
            <asp:PlaceHolder ID="AlertPlaceholder" runat="server"></asp:PlaceHolder>
            <div class="form-group">
                <label for="TextBox1">Mobile Number</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    ErrorMessage="Mobile Number is required." CssClass="alert alert-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="TextBox1" 
                    ValidationExpression="^\d{10}$"
                    ErrorMessage="Mobile Number must be a 10-digit number." 
                    CssClass="alert alert-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <label for="TextBox2">Password</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box" TextMode="Password" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    ErrorMessage="Password is required." CssClass="alert alert-danger" Display="Dynamic" />
            </div>
            <div class="form-group">
                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me"/>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="submit-btn" OnClick="Button1_Click" />
            </div>
            <div class="link-container">
                <span>Forgot your password? </span>
                <asp:LinkButton ID="ForgotPassword" runat="server">Reset Password</asp:LinkButton>
            </div>
            <div class="link-container">
                <span>Don't have an account? </span>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Sign Up</asp:LinkButton>
            </div>
        </div>
    </form>
</body>
</html>
