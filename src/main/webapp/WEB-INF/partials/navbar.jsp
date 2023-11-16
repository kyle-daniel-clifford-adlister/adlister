<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="navbar.jsp">
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">See All Ads</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="/login">Login</a></li>
                    <li><a href="/register">Register</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/ads/create">Create Ad</a></li>
                    <li><a href="/profile">Profile</a></li>
                    <li><a href="/logout">Logout</a></li>
                </c:otherwise>
            </c:choose>

<%--            <c:if test="${user == null}">--%>
<%--                <li><a href="/register">Register</a></li>--%>
<%--            </c:if>--%>

<%--            <li><a href="/profile">Profile</a></li>--%>
        </ul>
<%--        Possible search bar--%>
<%--        <form class="d-flex container-fluid nav navbar-nav navbar-right" role="search">--%>
<%--            <input class="form-control me-2" style="width: 120px;" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-success" type="submit">Search</button>--%>
<%--        </form>--%>
    </div><!-- /.navbar-collapse -->
</nav>
