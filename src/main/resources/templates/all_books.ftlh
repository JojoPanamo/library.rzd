<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Последние книги библиотеки</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 8px;
            font-size: 14px;
            width: 300px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 8px 12px;
            background-color: cadetblue;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #f9f9f6;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;

            color: black;
        }

        a {
            text-decoration: none;
            color: cadetblue;
        }

        a:hover {
            text-decoration: underline;
        }
        text{
            text-decoration: none;
            color: cadetblue;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<div class="button-container">
    <form method="get" action="/">
        <button type="submit">На главную</button>
    </form>
</div>
<h2>Книги в нашей библиотеке</h2>
<form method="get" action="/books/search">
    <input type="text" name="title" placeholder="Поиск по названию">
    <button type="submit">Поиск</button>
</form>
<ul>
<#list books as book>
    <li><a href="/books/${book.id}">${book.title}</a></li>
</#list>
</ul>
</html>