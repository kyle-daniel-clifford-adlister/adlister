<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
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
    <h1>Here are all the ads!</h1>

    <jsp:useBean id="ads" scope="request" type="java.util.List"/>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
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
        </div>
    </c:forEach>
</div>

</body>
</html>