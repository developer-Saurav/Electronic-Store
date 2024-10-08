<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminRegister.aspx.cs" Inherits="AdminRegister" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f9fc;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            max-width: 500px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .form-group {
            margin-bottom: 20px;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        .alert {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center mb-4">Admin Registration</h2>

            <asp:Literal ID="alertMessage" runat="server"></asp:Literal>

            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter username" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="username"
                    ErrorMessage="Username is required" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter password" MaxLength="255" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password"
                    ErrorMessage="Password is required" CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="password"
                    ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                    ErrorMessage="Password must be minimum 8 characters, with at least 1 letter and 1 number." CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter email" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email"
                    ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="email"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Invalid email format" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="full_name">Full Name</label>
                <asp:TextBox ID="full_name" runat="server" CssClass="form-control" placeholder="Enter full name" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="full_name"
                    ErrorMessage="Full Name is required" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <asp:DropDownList ID="role" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Role" Value=""></asp:ListItem>
                    <asp:ListItem Text="Super Admin" Value="SuperAdmin"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvRole" runat="server" ControlToValidate="role"
                    InitialValue="" ErrorMessage="Role is required" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="phone_number">Phone Number</label>
                <asp:TextBox ID="phone_number" runat="server" CssClass="form-control" placeholder="Enter phone number" MaxLength="15" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="phone_number"
                    ValidationExpression="^\d{10}$"
                    ErrorMessage="Phone number must be 10 digits" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="profile_picture">Profile Picture</label>
                <asp:FileUpload ID="profile_picture" runat="server" CssClass="form-control" />
            </div>

            <asp:Button ID="register_btn" runat="server" CssClass="btn submit-btn" Text="Register" OnClick="RegisterAdmin_Click" />
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
