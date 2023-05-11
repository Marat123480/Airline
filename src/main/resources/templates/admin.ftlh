<!DOCTYPE html>
<html>
<head>
    <title>Admin panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Панель администратора</h1>

    <br>
    <h3>Users</h3>
    <table class="table">
        <tr>
            <th>Email</th>
            <th>Phone number</th>
            <th>Active</th>
            <th>Role</th>
            <th>Delete</th>
            <th>Edit</th>
            <th>More info</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.numberPhone}</td>
                <td>
                    <#if user.active == true>
                        Активаен
                    <#else>
                        Неактивен
                    </#if>
                </td>
                <td><#list user.roles as role>${role}</#list></td>
                <td>
                    <form action="/admin/user/delete/${user.id}" method="post">
                        <input class="btn btn-danger" type="submit" value="Delete" >
                    </form>
                </td>
                <td><a class="btn btn-warning" href="/admin/user/edit/${user.id}">Edit</a></td>
                <td><a class="btn btn-primary" href="/user/${user.id}">Details</a></td>
            </tr>
        <#else>
            <h3>No users</h3>
        </#list>
    </table>

    <br>
    <h3>Airlines</h3>
    <a class="btn btn-success" href="/airline/form">Add Airline</a>
    <table class="table">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Rating</th>
            <th>Delete</th>
            <th>Edit</th>
            <th>More info</th>
        </tr>
        <#list airlines as airline>
            <tr>
                <td>${airline.name}</td>
                <td><p style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden; width: 251px;">${airline.description}</p></td>
                <td>${airline.rating}</td>
                <td>
                    <form action="/admin/airline/delete/${airline.id}" method="post">
                        <input class="btn btn-danger" type="submit" value="Delete" >
                    </form>
                </td>
                <td><a class="btn btn-warning" href="/admin/airline/edit/${airline.id}">Edit</a></td>
                <td><a class="btn btn-primary" href="/airline/${airline.id}">Details</a></td>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>

    <br>
    <h3>Flights</h3>
    <table class="table">
        <tr>
            <th scope="col">#</th>
            <th scope="col">From</th>
            <th scope="col">To</th>
            <th scope="col">Departure time</th>
            <th scope="col">Arrival time</th>
            <th scope="col">Cost</th>
            <th scope="col">Delete</th>
            <th scope="col">Edit</th>
        </tr>
        </thead>
        <tbody>

        <#list flights as flight>
            <tr>
                <th scope="row">${flight.id}</th>
                <td>${flight.country_from}</td>
                <td>${flight.country_to}</td>
                <td>${flight.departure_time.getDayOfMonth()} ${flight.departure_time.getMonth()} ${flight.departure_time.getYear()}</td>
                <td>${flight.arrival_time.getDayOfMonth()} ${flight.arrival_time.getMonth()} ${flight.arrival_time.getYear()}</td>
                <td>${flight.cost}</td>
                <td>
                    <form action="/admin/flight/delete/${flight.id}" method="post">
                        <input class="btn btn-danger" type="submit" value="Delete" >
                    </form>
                </td>
                <td><a class="btn btn-warning" href="/admin/flight/edit/${flight.id}">Edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>