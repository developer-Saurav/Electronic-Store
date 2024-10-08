<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Electronics Store</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: black;
            margin: 0;
            padding: 0;
        }

        .navbar-brand img {
            margin-right: 10px;
        }

        .contact-section {
            padding: 3rem 0;
            background: url('images/contact-bg.jpg') no-repeat center center/cover;
            color: #fff;
        }

        .contact-section h1, .contact-section p {
            color: #fff;
        }

        .contact-section .form-control {
            background: rgba(255, 255, 255, 0.8);
            border: none;
        }

        .contact-section .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .footer {
            background-color: #007bff;
            color: #fff;
            padding: 1rem 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="home.aspx">
            <img src="images/logo.png" alt="Electronics Store Logo" width="30" height="30" class="d-inline-block align-top">
            Electronics Store
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home.aspx">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="products.aspx">Products</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="ContactUs.aspx">Contact Us</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="contact-section">
        <div class="container">
            <h1 class="text-center">Contact Us</h1>
            <p class="text-center">We'd love to hear from you! Please fill out the form below and we'll get in touch with you shortly.</p>
            <div class="row">
                <div class="col-md-6">
                    <form id="contactForm">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea class="form-control" id="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <img src="images/contact.jpg" alt="Contact Us" class="img-fluid">
                </div>
            </div>
        </div>
    </div>

    <footer class="footer bg-dark text-white text-center py-3">
        <p>© 2024 Electronics Store. All rights reserved.</p>
    </footer>

    <script>
        document.getElementById('contactForm').addEventListener('submit', function (event) {
            event.preventDefault();
            alert('Thank you for contacting us! We will get back to you soon.');
        });
    </script>
</body>
</html>

