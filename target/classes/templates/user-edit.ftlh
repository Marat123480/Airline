<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>BUYSELL</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<br>
<div class="container">
    <h3>Editing user: ${user.name}</h3>
    <form action="/admin/user/edit" method="post">
        <div class="col-md">
            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInputGrid" placeholder="email" name="email" value="${user.email}">
                <label for="floatingInputGrid">Email address</label>
            </div>
        </div>
        <br>
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="name" name="name" value="${user.name}">
                <label for="floatingInputGrid">Name</label>
            </div>
        </div>
        <br>
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="phone" name="phone" value="${user.numberPhone}">
                <label for="floatingInputGrid">Phone</label>
            </div>
        </div>
        <br>
        <#list roles as role>
            <div>
                <label for=""><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="submit" class="btn btn-warning" value="Save">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>