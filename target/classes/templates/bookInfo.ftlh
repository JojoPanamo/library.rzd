<!DOCTYPE html>
<html>
<head>
    <title>
        Самая большая онлайн библиотека
    </title>
<body>
<h1>Последние книги</h1>
<#list home as HomePage>
    <div>
        <p>${HomePage.id} ${HomePage.title} ${HomePage.author} | <a href="/bookInfo/${HomePage.id}">Подробнее о книге...</a> </p>
    </div>
</#list>
<hr>
<h3>Добавить новую книгу</h3>
<form action="/home/create" method="post">
    Название книги: <input type="text" name="title"/> <br><br>
    Название книги: <input type="text" name="author"/> <br><br>
    <input type="submit" value="Сохранить">

</form>
</body>
</head>