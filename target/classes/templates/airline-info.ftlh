<!DOCTYPE html>
<html>
<head>
    <title>${airline.name}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <br>
    <img src="/images/${airline.previewImageId}" class="img-fluid" alt="...">
    <br>
    <h1>${airline.name}</h1>
    <br>
    <h3>Description:</h3>
    <p>${airline.description}</p>
    <h3>Rating: ${airline.rating} from 5 </h3>
</div>
<div class="container">
    <hr>
    <h2>Flights</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">From</th>
            <th scope="col">To</th>
            <th scope="col">Departure time</th>
            <th scope="col">Arrival time</th>
            <th scope="col">Cost</th>
            <#if user.isAdmin()>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </#if>
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
                <#if user.isAdmin()>
                    <td><a class="btn btn-warning" href="/admin/flight/edit/${flight.id}">Edit</a></td>
                    <td>
                        <form action="/admin/flight/delete/${flight.id}" method="post">
                            <input class="btn btn-danger" type="submit" value="Delete" >
                        </form>
                    </td>
                </#if>
            </tr>
        </#list>
        </tbody>
    </table>
    <hr>
</div>
<div class="container">
    <#if user.isAdmin()>
        <form action="/airline/delete/${airline.id}" method="post" style="width: 50%">
            <input class="btn btn-danger ui-widget-content" type="submit" value="Delete ${airline.name}">
        </form>
        <br>
        <h3>Create new Flight</h3>
        <form action="/airline/${airline.id}/add_flight" method="post" enctype="multipart/form-data" style="width: 50%">
            Country from: <input class="form-control" type="text" name="country_from"/> <br>
            Country to: <input class="form-control" type="text" name="country_to"/> <br>
            Cost: <input class="form-control" type="number" name="cost"/> <br>
            <input class="btn btn-success" type="submit" value="Add Flight"/>
        </form>
    </#if>
    <br>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>