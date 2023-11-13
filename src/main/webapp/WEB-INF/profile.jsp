<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<link rel="stylesheet" href="../css/profilePage.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container text-center">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>

    <form id="newUserForm" action="/updateuser" method="POST">
        <div class="tab">
            <h1>Update Login Info: </h1>
            <label id="usernameLabel">Username</label>
            <p><input id="username" class="username" type="text" name="username"></p>
            <label id="newEmailLabel">Email</label>
            <p><input id="email" class="email" type="email" name="email"></p>
            <label id="newPasswordLabel">Password</label>
            <p><input id="password" class="password" type="password" name="password"></p>
            <label id="confirmPasswordLabel">Password</label>
            <p><input id="confirm_password" class="password" type="password" name="confirm_password"></p>
        </div>

        <div style="overflow:auto;">
            <div style="float:left;">
                <button type="submit" id="submit" >Submit</button>
            </div>
        </div>
    </form>


</body>
</html>
