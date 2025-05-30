<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor Login Page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
    .paint-card {
        box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
    .error-message {
        color: red;
        font-size: 0.9em;
    }
</style>
<script>
    function validateDoctorLoginForm() {
        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();
        const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

        // Reset error messages
        document.getElementById("emailError").textContent = "";
        document.getElementById("passwordError").textContent = "";

        let isValid = true;

        // Validate Email
        if (!email.match(emailPattern)) {
            document.getElementById("emailError").textContent = "Invalid email format.";
            isValid = false;
        }

        // Validate Password
        if (password === "") {
            document.getElementById("passwordError").textContent = "Password is required.";
            isValid = false;
        }

        return isValid;
    }
</script>
</head>
<body>
    <%@include file="component/navbar.jsp"%>
    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">Doctor Login</p>
                        
                        <c:if test="${not empty succMsg }">
                            <p class="text-center text-success fs-3">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty errorMsg }">
                            <p class="text-center text-danger fs-5">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        
                        <form action="doctorLogin" method="post" onsubmit="return validateDoctorLoginForm();">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input id="email" name="email" type="email" class="form-control">
                                <span id="emailError" class="error-message"></span>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input id="password" name="password" type="password" class="form-control">
                                <span id="passwordError" class="error-message"></span>
                            </div>
                            <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                        </form>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
