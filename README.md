Electronics Store Website
Overview
This project is an Electronics Store web application built using ASP.NET Web Forms and a SQL Server backend. It allows users to browse through various products, view detailed descriptions, add products to their cart, and proceed to checkout. The website is fully responsive and designed using Bootstrap and CSS for a smooth user experience across all devices.

Features
Product Listing Page: Users can browse electronics categorized by brand and type. The page displays products in a grid format with images that open detailed product descriptions in a new tab.
Product Details Page: Displays the full details of an item, including its description, price, and availability. The page is fully responsive, ensuring a consistent layout across devices.
Shopping Cart: Users can add items to their cart with quantity selection. The cart can be updated or emptied, and the 'Proceed to Checkout' button ensures session validation.
User Authentication: Secure login and signup functionality using ASP.NET session variables, ensuring user-specific experiences like storing usernames and providing a seamless checkout flow.
Admin Section: The site includes an admin dashboard to manage product listings and user orders.
Technologies Used
Frontend: HTML, CSS, Bootstrap, JavaScript
Backend: ASP.NET Web Forms
Database: SQL Server
Other: Session management for user authentication, Product details retrieval using SQL queries
Database Design
The database consists of the following tables:

Users: Stores user credentials and details.
Items: Contains information about all electronic products, including fields like ItemName, ItemPrice, ItemImage, and Category.
Orders: Stores user orders with references to the items purchased.
Cart: Tracks the items added to the cart by each user.
Setup Instructions
Clone the repository to your local machine.

git clone <repo-url>
Open the project in Visual Studio.
Set up the SQL Server database using the scripts provided in the Database folder.
Update the connection strings in the web.config file.
Build and run the project.
Future Enhancements
Implement advanced search filters for products.
Add a review and rating system for users to review electronics.
Create a recommendation engine based on user preferences.
Author
This project was developed as part of a personal web development project for building a fully functional e-commerce website.
