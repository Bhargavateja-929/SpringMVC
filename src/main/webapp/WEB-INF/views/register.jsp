<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
    <style>
       body {
            margin: 0;
            padding: 0;
            padding-bottom: 130px;
            background-image: url('https://www.shutterstock.com/shutterstock/videos/3471347073/thumb/1.jpg?ip=x480');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #fff;
            font-family: 'Arial', sans-serif;
        }

        .container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5);
            max-width: 700px;
            margin: auto;
            transform: translateY(50px);
        }

        h2 {
            text-align: center;
            font-size: 2.5rem;
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.6);
        }

        .form-label {
            font-size: 1.1rem;
            color: #fff;
        }

        .btn-custom {
            width: 100%;
            padding: 15px;
            font-size: 18px;
            margin-top: 15px;
        }

        .alert {
            font-size: 1rem;
            margin-top: 20px;
            display: none; /* Initially hidden */
        }

        .btn-custom i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div id="alert-container" class="container mt-3">
        <!-- Success or Error message will be shown here -->
    </div>

    <div class="container mt-5">
        <h2>Registration Form</h2>

        <form id="registrationForm">
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" id="first_name" name="firstName" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" id="last_name" name="lastName">
            </div>
            <div class="mb-3">
                <label class="form-label">Gender</label>
                <select class="form-control" id="gender" name="gender" required>
                    <option value="">Select Gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="text" class="form-control" id="phone" name="phoneNumber" required pattern="^[0-9]{10}$" title="Please enter a valid 10-digit phone number">
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <div class="mb-3">
                <label class="form-label">City</label>
                <input type="text" class="form-control" id="city" name="city">
            </div>
            <div class="mb-3">
                <label class="form-label">State</label>
                <input type="text" class="form-control" id="state" name="state">
            </div>
            <div class="mb-3">
                <label class="form-label">Country</label>
                <input type="text" class="form-control" id="country" name="country">
            </div>
            <div class="mb-3">
                <label class="form-label">Postal Code</label>
                <input type="text" class="form-control" id="postal_code" name="postalCode">
            </div>

            <button type="submit" class="btn btn-primary btn-custom">
                <i class="fas fa-user-plus"></i> Register
            </button>
            <button type="button" class="btn btn-secondary btn-custom mt-3" onclick="window.location.href='login';">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#registrationForm").on("submit", function(event) {
                event.preventDefault(); 

                var formData = $(this).serialize();

                $.ajax({
                    url: "register",
                    type: "POST",
                    data: formData,
                    dataType: "json", 
                    success: function(response) {
                        if (response.status === "success") {
                            $("#alert-container").html(
                                '<div class="alert alert-success alert-dismissible fade show" role="alert">' +
                                response.message +
                                '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                                '</div>'
                            );
                        } else {
                            $("#alert-container").html(
                                '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
                                response.message +
                                '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                                '</div>'
                            );
                        }

                        $("#registrationForm")[0].reset();

                        setTimeout(function() {
                            $(".alert").fadeOut();
                        }, 5000);
                    },
                    error: function() {
                        $("#alert-container").html(
                            '<div class="alert alert-danger alert-dismissible fade show" role="alert">' +
                            "An error occurred. Please try again." +
                            '<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>' +
                            '</div>'
                        );
                    }
                });
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
