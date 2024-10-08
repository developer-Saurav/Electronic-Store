<%@ Page Title="Manage Items" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ManageItems.aspx.cs" Inherits="ManageItems" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .centered-container {
            width: 900px; /* Set a max-width as needed */
            margin: auto; /* Center the container horizontally */
            padding: 20px; /* Optional: Add some padding inside the container */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Optional: Add a box shadow */
            background-color: #343a40; /* Background color to match the sidebar */
            border-radius: 8px; /* Optional: Round the corners */
            color: #f9f9f9; /* Light text color */
        }

        .table-container {
            max-height: 400px; /* Adjust the height as needed */
            overflow-y: auto; /* Enable vertical scrolling */
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

        .btn-group {
            display: flex; /* Flexbox for horizontal alignment */
            gap: 10px; /* Space between buttons */
        }

        .btn-primary {
            background-color: #007bff; /* Primary button color */
            border-color: #007bff; /* Primary button border color */
        }

        .btn-primary:hover {
            background-color: #0056b3; /* Primary button hover color */
            border-color: #004085; /* Primary button hover border color */
        }

        .btn-secondary {
            background-color: #6c757d; /* Secondary button color */
            border-color: #6c757d; /* Secondary button border color */
        }

        .btn-secondary:hover {
            background-color: #5a6268; /* Secondary button hover color */
            border-color: #545b62; /* Secondary button hover border color */
        }
    </style>

    <div class="container mt-5 centered-container">
        <h2>Manage Items</h2>
        <div class="table-container">
            <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemId" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="ItemId" HeaderText="Item ID" ReadOnly="True" />
                    <asp:BoundField DataField="ItemName" HeaderText="Name" />
                    <asp:BoundField DataField="ItemPrice" HeaderText="Price" />
                    <asp:BoundField DataField="ItemImage" HeaderText="Image" />
                    <asp:BoundField DataField="ItemDescription" HeaderText="Description" />
                    <asp:BoundField DataField="ItemQuantity" HeaderText="Quantity" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div class="btn-group">
                                <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" CssClass="btn btn-primary">Edit</asp:LinkButton>
                                <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-secondary">Delete</asp:LinkButton>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <div class="mb-3">
            <asp:Button ID="InsertButton" runat="server" Text="Add New Item" CssClass="btn btn-primary" OnClick="InsertButton_Click" />
            <asp:Button ID="DisplayButton" runat="server" Text="Refresh" CssClass="btn btn-secondary" OnClick="DisplayButton_Click" />
        </div>
    </div>
</asp:Content>
