<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <br>
    <h1>Information about user: ${user.name}</h1><hr>
    <h3>Phone number: ${user.numberPhone}</h3>
    <h3>Email: ${user.email}</h3>
    <h3>Name: ${user.name}</h3>
    <h3>Actions of the user</h3>
    <#list airlines as airline>
        <div>
            <p>Adding flight to <b>${airline.name}</b> ${airline.rating} | <a href="/airline/${airline.id}">Подробнее</a></p>
        </div>
    <#else>
        <h3>No actions</h3>
    </#list>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>