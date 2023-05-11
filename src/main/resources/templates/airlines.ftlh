<!DOCTYPE html>
<html>
<head>
    <title>BUYSELL</title>
</head>
<body>
<h1>Aset company</h1>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="submit" value="Выйти">
    </form>
<#else>
    <a href="/login">Войти</a>
</#if>
<h3>Авиа компании:</h3>
<form action="/" method="get">
    Поиск по названию авиа и компании: <input type="text" name="name"><br>
    <input type="submit" value="Поиск">
</form>
<#if user.isAdmin()>
    <a href="/admin">Панель администратора</a>
</#if>
<#list airlines as airline>
    <div>
        <p><b>${airline.name}</b> ${airline.rating} | <a href="/airline/${airline.id}">Подробнее</a></p>
    </div>
<#else>
    <h3>Товаров нет</h3>
</#list>
<hr>
<#if user.isAdmin()>
    <h3>Создать новый товар</h3>
    <form action="/airline/create" method="post" enctype="multipart/form-data">
        Название авиакомпании: <input type="text" name="name"/> <br><br>
        Описание авакомпании: <input type="text" name="description"/> <br><br>
        Рейтинг: <input type="number" name="rating"/> <br><br>
        Первая фото: <input type="file" name="file1"/> <br><br>
        Второе фото: <input type="file" name="file2"/> <br><br>
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>

</body>
</html>