<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
    <link rel="stylesheet" href="../css/registerPage.css">
    <link rel="icon" type="image/x-icon" href="../img/adlister-favcon.png">
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <c:if test="${sessionScope.error}">
            <h3 style="color: red">User is already Registered, please choose a different username.</h3>
        </c:if>
        <c:if test="${sessionScope.hacker}">
            <h3 style="color: red">Input contains suspicious characters</h3>
        </c:if>
        <c:if test="${sessionScope.emptyinp}">
            <h3 style="color: red">Please fill out all fields</h3>
        </c:if>
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="${sessionScope.username}">
                <p>(Cannot contain ('<','>','(',')')</p>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="${sessionScope.email}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
