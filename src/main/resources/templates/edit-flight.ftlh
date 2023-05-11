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
    <h3>Editing flight: ${flight.id}</h3>
    <form action="/admin/flight/edit" method="post">
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="From" name="country_from"
                       value="${flight.country_from}">
                <label for="floatingInputGrid">From</label>
            </div>
        </div>
        <br>
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="To" name="country_to"
                       value="${flight.country_to}">
                <label for="floatingInputGrid">To</label>
            </div>
        </div>
        <br>
        <div class="col-md">
            <div class="form-floating">
                <input type="number" class="form-control" placeholder="Cost" name="cost"
                        min="20000" max="5000000" value="${flight.cost}">
                <label for="floatingInputGrid">Cost</label>
            </div>
        </div>
        <br>
        <#list airlines as airline>
            <div>

                <label for=""><input type="checkbox" name="${airline.name}"
                            <#if airline == flight.getAirline()>
                                checked
                            </#if>
                    >${airline.name}</label>
            </div>
        </#list>
        <input type="hidden" value="${flight.id}" name="flightId">
        <input type="submit" class="btn btn-warning" value="Save">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>