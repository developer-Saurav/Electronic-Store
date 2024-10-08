<%@ Page Title="Add Item" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .centered-container {
            width: 500px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            background-color: #fff;
            border-radius: 8px;
        }

        label {
            color:black;
        }
    </style>

    <div class="container mt-5 centered-container">
        <h1 style="color:black">Add New Item</h1>
        <asp:PlaceHolder ID="AlertPlaceholder" runat="server"></asp:PlaceHolder>
        <asp:Label ID="SuccessLabel" runat="server" CssClass="text-success" Visible="false"></asp:Label>
        <div class="mb-3">
            <label for="ItemName" class="form-label">Item Name</label>
            <asp:TextBox ID="ItemName" runat="server" CssClass="form-control" placeholder="Enter item name"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="ItemPrice" class="form-label">Item Price</label>
            <asp:TextBox ID="ItemPrice" runat="server" CssClass="form-control" placeholder="Enter item price"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="ItemImage" class="form-label">Item Image</label>
            <asp:FileUpload ID="ItemImage" runat="server" CssClass="form-control" />
        </div>
        <div class="mb-3">
            <label for="ItemDescription" class="form-label">Item Description</label>
            <asp:TextBox ID="ItemDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter item description"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="ItemQuantity" class="form-label">Item Quantity</label>
            <asp:TextBox ID="ItemQuantity" runat="server" CssClass="form-control" placeholder="Enter item quantity"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="Category" class="form-label">Category</label>
            <asp:TextBox ID="Category" runat="server" CssClass="form-control" placeholder="Enter category"></asp:TextBox>
        </div>
        <div class="mb-3">
            <label for="Brand" class="form-label">Brand</label>
            <asp:TextBox ID="Brand" runat="server" CssClass="form-control" placeholder="Enter brand"></asp:TextBox>
        </div>
        <div class="d-grid gap-2">
            <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary btn-block" Text="Add Item" OnClick="SubmitButton_Click" />
        </div>
    </div>
</asp:Content>

