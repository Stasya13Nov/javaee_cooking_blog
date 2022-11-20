<%@ page import="com.example.demo.models.Recipe" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo.models.RecipeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>All recipes</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <c:import url="header.html"/>

    <div>SEARCH</div>
<form action="show-recipe" method="get">
    <label for="user-prefix"> User:</label>
    <input type="search" id="user-prefix" name="user-prefix">

    <label for="recipe-prefix"> Title Recipe:</label>
    <input type="search" id="recipe-prefix" name="recipe-prefix">
    <input type="submit" value="send">
</form>

    <c:forEach var="recipe" items="${requestScope.recipes}">
        <div class="recipe">
            <div class="title">
                ${recipe.title}
            </div>
            <div class="description">
                ${recipe.description}
            </div>
            <div class="author">
                ${recipe.user.email}
            </div>
        </div>
    </c:forEach>

</body>
</html>
