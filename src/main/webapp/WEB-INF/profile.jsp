<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<link rel="stylesheet" href="../css/profilePage.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<div class="container text-center">
    <h1>Welcome, ${sessionScope.user.username}!</h1>

</div>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="icon" type="image/x-icon" href="../img/adlister-favcon.png">
</head>
<div>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
        </div>
<form id="newUserForm" action="/updateuser" method="POST">
    <div class="tab">
        <h1>Update Login Info: </h1>
        <label id="usernameLabel">Username</label>
        <input type="hidden" name="id" value="${sessionScope.user.id}">
        <p><input id="username" class="username" type="text" name="username"></p>
        <label id="newEmailLabel">Email</label>
        <p><input id="email" class="email" type="email" name="email"></p>
        <label id="newPasswordLabel">Password</label>
        <p><input id="password" class="password" type="password" name="password"></p>
        <label id="confirmPasswordLabel">Password</label>
        <p><input id="confirm_password" class="password" type="password" name="confirm_password"></p>
    </div>
    <button class="btn">
        <span class="btn-text-one">Update</span>
        <span class="btn-text-two">Click</span>
    </button>
</form>
    <c:forEach var="ad" items="${userads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>$${ad.cost}</p>
        <%--            TODO decide if needed to show--%>
            <p>${ad.userId}</p>
       <form action="/ads/${ad.id}" method="post">
                <input type="hidden" name="adId" value="${ad.id}">
                <input type="submit" value="Delete">
            </form>
        </div>

            <!-- Display content only if the current user created the ad -->




    </c:forEach>

</body>
</html>



