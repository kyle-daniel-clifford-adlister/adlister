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
    <h1>Here are all the ads!</h1>

    <jsp:useBean id="ads" scope="request" type="java.util.List"/>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>$${ad.cost}</p>
            <p>${ad.userId}</p>

            <p>Categories:</p>
            <c:forEach var="category" items="${ad.category}">
                <p>${category}</p>
            </c:forEach>
        </div>
    </c:forEach>
</div>

</body>
</html>