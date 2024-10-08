<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        
        .centered-container {
            width: 100%; /* Full width of the container */
            max-width: 1200px; /* Set a maximum width as needed */
            margin: 0 auto; /* Center horizontally */
            padding: 20px; /* Padding inside the container */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Box shadow */
            background-color: #343a40; /* Background color to match admin dashboard */
            border-radius: 8px; /* Rounded corners */
            color: #f9f9f9; /* Text color */
        }

        .table-container {
            max-height: calc(100vh - 200px); /* Make the table container cover remaining vertical space */
            overflow-y: auto; /* Vertical scrolling if needed */
            margin-top: 20px; /* Add spacing from the heading */
        }

        .table {
            background-color: #202124; /* Table background color */
            color: #f9f9f9; /* Table text color */
            border-color: #454545; /* Table border color */
        }

        .table thead th {
            background-color: #343a40; /* Header background color */
            color: #f9f9f9; /* Header text color */
            border-color: #454545; /* Header border color */
        }

        .table tbody tr:nth-child(odd) {
            background-color: #292b2c; /* Alternating row color */
        }

        .table tbody tr:hover {
            background-color: #495057; /* Hover effect color */
        }

        .btn {
            border-radius: 5px; /* Rounded corners for buttons */
        }

        .btn-danger {
            background-color: #dc3545; /* Danger button color */
            border-color: #dc3545; /* Danger button border color */
        }

        .btn-danger:hover {
            background-color: #c82333; /* Danger button hover color */
            border-color: #bd2130; /* Danger button hover border color */
        }
    </style>

    <div class="container mt-5 centered-container">
        <h2>Manage Users</h2>
        <div class="table-container">
            <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" DataKeyNames="Id" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
