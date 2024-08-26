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
        <p>${HomePage.id}</p>
        <p>${HomePage.title}</p>
        <p>${HomePage.author}</p>
        <p><a href="/bookInfo/${HomePage.id}">Подробнее о книге...</a> </p>
    </div>
    <hr>
</#list>
<h3>Добавить новую книгу</h3>
<form action="/home/create" method="post">
    Название книги: <input type="text" name="title"/> <br><br>
    Автор: <input type="text" name="author"/> <br><br>
    <input type="submit" value="Сохранить">

</form>
</body>
</head>