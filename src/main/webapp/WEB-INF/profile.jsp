<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>

<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" href="../css/profilePage.css">
    <link rel="icon" type="image/x-icon" href="../img/gunFavcon.svg">
</head>
<body>
    <div class="container text-center">
        <h1>Welcome, ${sessionScope.user.username}!</h1>

    </div>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="adDisplay">
        <form id="newUserForm" action="/updateuser" method="POST">
            <div class="tab">
                <h1>Update Login Info: </h1>
                <label id="usernameLabel">Username</label>
                <input type="hidden" name="id" value="${sessionScope.user.id}">
                <p><input id="username" class="username" type="text" name="username" required></p>
                <label id="newEmailLabel">Email</label>
                <p><input id="email" class="email" type="email" name="email" required></p>
                <label id="newPasswordLabel">Password</label>
                <p><input id="password" class="password" type="password" name="password" required></p>
                <label id="confirmPasswordLabel">Password</label>
                <p><input id="confirm_password" class="password" type="password" name="confirm_password"></p>

                <button class="btn">
                    <span class="btn-text-one">Update Profile</span>
                    <span class="btn-text-two">Update</span>
                </button>
            </div>
        </form>
        </div>


        <c:forEach var="ad" items="${userads}">
            <div class="adDisplay">
                <div class="profileAd">
                    <h4>${ad.title}</h4>
                    <p>${ad.description}</p>
                    <p>$${ad.cost}</p>
                <%--            TODO decide if needed to show--%>
                    <p>${ad.userId}</p>
                    <form action="/ads/${ad.id}" method="post">
                        <button type="submit" class="btn">
                            <input type="hidden" name="adId" value="${ad.id}">
    <%--                    <input type="submit" class="btn">--%>
                            <span class="btn-text-one">DELETE AD</span>
                            <span class="btn-text-two">DELETE</span>
                        </button>
<%--                        <input type="submit" value="Delete Ad">--%>
                    </form>
                    <form action="/updateAd" method="GET">
                    <button type="submit" value="${ad.id}" class="btn" name="adId">
                        <span class="btn-text-one">UPDATE AD</span>
                        <span class="btn-text-two">UPDATE</span>
                    </button>
                    </form>
                </div>
            </div>
            <%-- Display content only if the current user created the ad --%>

                <!-- Display content only if the current user created the ad -->
        </c:forEach>
    </div>
</body>
</html>



