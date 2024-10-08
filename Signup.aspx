<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Signup Page</title>
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

        .input-box, .dropdown-box {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
            margin-bottom: 10px;
            transition: border-color 0.3s;
        }

        .input-box:focus, .dropdown-box:focus {
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

        .validation-summary {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 6px;
        }

        .password-note {
            font-size: 14px;
            color: #555;
            text-align: left;
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
            <asp:PlaceHolder ID="AlertPlaceholder" runat="server"></asp:PlaceHolder>
            <h1>Create Account</h1>
            <div class="form-group">
                <label for="TextBox1">Your Name</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="input-box" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" 
                    ErrorMessage="Name is required" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="TextBox2">Mobile Number</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="input-box" MaxLength="15"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" 
                    ErrorMessage="Mobile number is required" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="MobileValidator" runat="server" ControlToValidate="TextBox2" 
                    ErrorMessage="Invalid mobile number" ValidationExpression="^\d{10}$" CssClass="validation-summary" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="DropDownList1">State</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="dropdown-box" AutoPostBack="True" 
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList1" 
                    InitialValue="0" ErrorMessage="Please select a state" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="DropDownList2">City</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dropdown-box"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList2" 
                    InitialValue="0" ErrorMessage="Please select a city" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="TextBox3">Password</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="input-box" TextMode="Password" MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" 
                    ErrorMessage="Password is required" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PasswordValidator" runat="server" ControlToValidate="TextBox3" 
                    ErrorMessage="Password must be at least 6 characters" ValidationExpression=".{6,}" 
                    CssClass="validation-summary" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="TextBox4">Address</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="input-box" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" 
                    ErrorMessage="Address is required" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label for="TextBox5">Email</label>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="input-box" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" 
                    ErrorMessage="Email is required" CssClass="validation-summary" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ControlToValidate="TextBox5" 
                    ErrorMessage="Invalid email address" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" 
                    CssClass="validation-summary" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <p class="password-note">Passwords must be at least 6 characters long.</p>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="submit-btn" OnClick="Button1_Click" />
            </div>
            <div class="link-container">
                <span>Already have an account?</span> <a href="Login.aspx">Login here</a>
            </div>
        </div>
    </form>
</body>
</html>
