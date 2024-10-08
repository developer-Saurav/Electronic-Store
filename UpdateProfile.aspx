<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Update Profile</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2>Update Profile</h2>
            <div class="form-group">
                <label for="txtName">Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtMobileNumber">Mobile Number:</label>
                <asp:TextBox ID="txtMobileNumber" runat="server" CssClass="form-control" MaxLength="10" />
            </div>
            <div class="form-group">
                <label for="txtAddress">Address:</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" MaxLength="50" />
            </div>
            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" MaxLength="30" />
            </div>
            <div class="form-group">
                <label for="ddlState">State:</label>
                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select State</asp:ListItem>
                    
                    <asp:ListItem Value="1">State 1</asp:ListItem>
                    <asp:ListItem Value="2">State 2</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlCity">City:</label>
                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control">
                    <asp:ListItem Value="0">Select City</asp:ListItem>
                    
                    <asp:ListItem Value="1">City 1</asp:ListItem>
                    <asp:ListItem Value="2">City 2</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
