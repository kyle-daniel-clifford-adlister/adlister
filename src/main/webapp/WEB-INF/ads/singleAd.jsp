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
    <h1>Ad</h1>

    <jsp:useBean id="ad" scope="request" type="java.util.List"/>

    <c: var="ad" items="${ad}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <p>$${ad.cost}</p>
            <p>${ad.userId}</p>

            <p>Categories:</p>
            <c: var="category" items="${ad.category}">
                <p>${category}</p>
            </c:>
        </div>
    </c:>
</div>

</body>
</html>
