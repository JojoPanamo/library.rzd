<!DOCTYPE html>
<html>
<head>
    <title>
        Самая большая онлайн библиотека
    </title>
<body>
<h1>Информация о книге</h1>
<p><b>${bookInfo.id}</b></p>
<p><b>Название книги: ${bookInfo.title}</b></p>
<p><b>Автор: ${bookInfo.author}</b></p>
<hr>
<form action="/bookInfo/${id}" method="post">
    <input type="submit" value="Удалить книгу">

</form>
</body>
</head>