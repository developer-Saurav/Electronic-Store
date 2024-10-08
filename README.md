<h1>Electronics Store Website</h1>
<h2>Overview</h2>
This project is an Electronics Store web application built using ASP.NET Web Forms and a SQL Server backend. It allows users to browse through various products, view detailed descriptions, add products to their cart, and proceed to checkout. The website is fully responsive and designed using Bootstrap and CSS for a smooth user experience across all devices.

<h2>Features</h2>
<ul>
            <li><strong>Product Listing Page</strong>: Users can browse electronics categorized by brand and type. The page displays products in a grid format with images that open detailed product descriptions in a new tab.</li>
            <li><strong>Product Details Page</strong>: Displays the full details of an item, including its description, price, and availability. The page is fully responsive, ensuring a consistent layout across devices.</li>
            <li><strong>Shopping Cart</strong>: Users can add items to their cart with quantity selection. The cart can be updated or emptied, and the 'Proceed to Checkout' button ensures session validation.</li>
            <li><strong>User Authentication</strong>: Secure login and signup functionality using ASP.NET session variables, ensuring user-specific experiences like storing usernames and providing a seamless checkout flow.</li>
            <li><strong>Admin Section</strong>: The site includes an admin dashboard to manage product listings and user orders.</li>
        </ul>
<h2>Technologies Used</h2>
<ul>
            <li><strong>Frontend</strong>: HTML, CSS, Bootstrap, JavaScript</li>
            <li><strong>Backend</strong>: ASP.NET Web Forms</li>
            <li><strong>Database</strong>: SQL Server</li>
            <li><strong>Other</strong>: Session management for user authentication, Product details retrieval using SQL queries</li>
        </ul>
<h2>Database Design</h2>
The database consists of the following tables:

<ul>
            <li><strong>Users</strong>: Stores user credentials and details.</li>
            <li><strong>Items</strong>: Contains information about all electronic products, including fields like <em>ItemName</em>, <em>ItemPrice</em>, <em>ItemImage</em>, and <em>Category</em>.</li>
            <li><strong>Orders</strong>: Stores user orders with references to the items purchased.</li>
            <li><strong>Cart</strong>: Tracks the items added to the cart by each user.</li>
        </ul>
<h2>Setup Instructions</h2>
<ol>
            <li>Clone the repository to your local machine.
                <pre><code>git clone &lt;repo-url&gt;</code></pre>
            </li>
            <li>Open the project in Visual Studio.</li>
            <li>Set up the SQL Server database using the scripts provided in the <strong>Database</strong> folder.</li>
            <li>Update the connection strings in the <strong>web.config</strong> file.</li>
            <li>Build and run the project.</li>
        </ol>
 <h2>Future Enhancements</h2>
<ul>
            <li>Implement advanced search filters for products.</li>
            <li>Add a review and rating system for users to review electronics.</li>
            <li>Create a recommendation engine based on user preferences.</li>
        </ul>
<h2>Author</h2>
This project was developed as part of a personal web development project for building a fully functional e-commerce website.
