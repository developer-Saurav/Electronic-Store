<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .table-container {
            display: flex;
            margin: 20px 248px;
            padding: 15px;
            background-color: #2c2c2c; /* Darker background to match the sidebar */
            border-radius: 10px;
            max-width: 800px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Slightly darker shadow for contrast */
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            color: #f9f9f9; /* Light text color for better readability */
        }

        table th, table td {
            border: 1px solid #444; /* Darker border color for contrast */
            padding: 8px;
            text-align: left;
        }

        table th {
            background-color: #1e1e1e; /* Slightly lighter background for headers */
            color: #f9f9f9; /* Light text color */
        }

        table tbody tr:nth-child(odd) {
            background-color: #3c3c3c; /* Slightly lighter background for odd rows */
        }

        table tbody tr:hover {
            background-color: #4a4a4a; /* Highlight row on hover for better user experience */
        }
    </style>

    <!-- Table for Items -->
    <div style="margin-left:250px;color:black"><h1>Items</h1></div>
    <div class="table-container">

        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Date Created</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("ItemName") %></td>
                            <td>$<%# Eval("ItemPrice", "{0:F2}") %></td>
                            <td><%# Eval("ItemQuantity") %></td>
                            <td><%# Eval("DateCreated", "{0:MMMM dd, yyyy}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

    <!-- Table for Users -->
    <div style="margin-left:250px;color:black"><h1>Users</h1></div>
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Mobile Number</th>
                    <th>State ID</th>
                    <th>City ID</th>
                    <th>Date Created</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("MobileNumber") %></td>
                            <td><%# Eval("StateId") %></td>
                            <td><%# Eval("CityId") %></td>
                            <td><%# Eval("DateCreated", "{0:MMMM dd, yyyy}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

</asp:Content>

