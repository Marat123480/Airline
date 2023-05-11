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
    <h3>Editing airline: ${airline.name}</h3>
    <form action="/admin/airline/edit" method="post" enctype="multipart/form-data">
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="Name" name="name" value="${airline.name}">
                <label for="floatingInputGrid">Name</label>
            </div>
        </div>
        <br>
        <div class="col-md">
            <div class="form-floating">
                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="description">${airline.description}</textarea>
                <label for="floatingTextarea">Description</label>
            </div>
        </div>

        <br>
        <div class="col-md">
            <div class="form-floating">
                <input type="text" class="form-control" id="floatingInputGrid" placeholder="rating" name="rating" value="${airline.rating}">
                <label for="floatingInputGrid">Rating</label>
            </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <input type="file" class="form-control" id="inputGroupFile02" name="file1">
            <label class="input-group-text" for="inputGroupFile02">Upload</label>
        </div>
        <div class="input-group mb-3">
            <input type="file" class="form-control" id="inputGroupFile02" name="file2">
            <label class="input-group-text" for="inputGroupFile02">Upload</label>
        </div>
        <input type="hidden" value="${airline.id}" name="airlineId">
        <input type="submit" class="btn btn-warning" value="Save">
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>