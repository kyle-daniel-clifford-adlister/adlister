<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
    <link rel="icon" type="image/x-icon" href="../../img/gunFavcon.svg">
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
            width: 500px;
            height: 200px;
            box-shadow: 0 0 10px rgba(30, 30, 30, 1);
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
                <option value="6">Semi-Automatic</option>
                <option value="7">Lever Action</option>
            </select>
            <input type="submit" id="searchButton" class="searchButton" name="searchButton" value="Search">
        </form>
        <h1>All Ads!</h1>

        <jsp:useBean id="ads" scope="request" type="java.util.List"/>

            <c:forEach var="ad" items="${ads}">
                <form id="updateAdForm" action="/updateAd" method="GET">
                    <div class="col-md-6 adForm">
                        <form action="/ads/singlead/${ad.id}" method="post">
                            <h2><a href="/ads/singlead/${ad.id}">
    <%--                            <input type="submit" name="${ad.id}" value="">--%>

                                    ${ad.title}
                            </a></h2>
                        </form>
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
                    </div>
                </form>
            </c:forEach>
    </div>
</body>
</html>