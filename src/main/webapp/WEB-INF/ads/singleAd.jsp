<%--
  Created by IntelliJ IDEA.
  User: kylesowers
  Date: 11/13/23
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Single Ad</title>
</head>
<body>
<div class="container">
    <h1></h1>
<%--    <c:forEach var="ad" items="${ads}">--%>
        <div class="col-md-6">
            <h2>${ads.title}</h2>
            <p>${ads.description}</p>
            <p>$${ads.cost}</p>
            <p>${ads.userId}</p>

<%--            <p>Categories:</p>--%>
<%--            <c:forEach var="category" items="${ads.category}">--%>
<%--                <p>${category}</p>--%>
<%--            </c:forEach>--%>
        </div>
<%--    </c:forEach>--%>
</div>

</body>
</html>
