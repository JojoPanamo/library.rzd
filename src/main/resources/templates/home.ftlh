<!DOCTYPE html>
<html lang="en">
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
        .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
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
    </style>
</head>
<body>
<div class="button-container">
<form method="get" action="/books/add">
    <button type="submit">Добавить новую книгу</button>
</form>
<form method="get" action="/authors">
    <button type="submit">Список авторов</button>
</form>
<form method="get" action="/books">
    <button type="submit">Список всех книг</button>
</form>
</div>
<h2>Книги в нашей библиотеке</h2>
<#if books?? && (books?size > 0)>
    <ul>
        <#list books as book>
            <li>
                <a href="/books/${book.id}">${book.title}</a><br>
                Автор(ы):<br>
                <#list book.authors as author>
                    <a href="/authors/${author.id}">${author.name}</a>
                    <#if author?has_next>, </#if>
                </#list>
            </li>
        </#list>
    </ul>
<#else>
    <p>Пока нет книг</p>
</#if>
</body>
</html>
