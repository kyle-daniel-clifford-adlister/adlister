<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="icon" type="image/x-icon" href="../WEB-INF/img/adlister-favcon.png">
    <style>
        :root {
            --primary-color: #888;
            --secondary-color: #fff;
        }
        body{
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        }
        .adForm {
            border-radius: 12px;
            margin: 10px;
            padding-bottom: 10px;
            max-width: 400px;
            box-shadow: 0 0 10px rgba(0, 0, 255, 1);
            background: linear-gradient(5deg, var(--primary-color), var(--secondary-color));
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <form id="adCategorySelect" action="/ads" method="get">
        <select name="gunCategory">
            <option value="All" selected>All</option>
            <option value="1">Rifle</option>
            <option value="2">Shotgun</option>
            <option value="3">Pistol</option>
            <option value="4">Revolver</option>
            <option value="5">Bolt Action</option>
            <option value="6">Lever-Action</option>
            <option value="7">Semi-Automatic</option>
        </select>
        <input type="submit" id="searchButton" class="searchButton" name="searchButton" value="Search">
    </form>
    <h1>All the Ads!</h1>

    <jsp:useBean id="ads" scope="request" type="java.util.List"/>

        <c:forEach var="ad" items="${ads}">
            <form id="updateAdForm" action="/updateAd" method="GET">
                <div class="col-md-6 adForm">
                    <h2>${ad.title}</h2>
                    <p>${ad.description}</p>
                    <p> Cost $${ad.cost}</p>
                    <p>User ID  ${ad.userId}</p>

                    <c:if test="${ad.userId eq sessionScope.loggedInUserId}">
                        <!-- Display content only if the current user created the ad -->
                        <form action="/ads/${ad.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="submit" value="Delete">
                        </form>
                    </c:if>
                    <button type="submit" value="${ad.id}" name="adId">Update Ad</button>
                </div>
            </form>
        </c:forEach>
</div>
<form>

</form>
</body>
</html>