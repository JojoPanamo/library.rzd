<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавление новой книги</title>
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

        .author-list {
            max-height: 200px;
            overflow-y: auto;
            margin-bottom: 10px;
            padding: 0;
            list-style: none;
        }

        .author-item {
            margin-bottom: 10px;
            background-color: #f9f9f6;
            padding: 5px;
            border-radius: 4px;
        }

        .search-box {
            margin-bottom: 10px;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="button-container">
    <form method="get" action="/">
        <button type="submit">На главную</button>
    </form>
</div>
<h2>Добавление новой книги</h2>

<#if error??>
    <p style="color: red;">${error}</p>
</#if>

<form method="post" action="/books/add" onsubmit="return validateForm()">
    <label for="title">Название:</label>
    <input type="text" id="title" name="title" required><br><br>

    <label for="search">Выберите автора(ов)</label><br>
    <br>
    Поиск по имени:
    <input type="text" id="search" class="search-box" onkeyup="filterAuthors()" placeholder="Введите имя автора">

    <ul id="authorList" class="author-list">
        <#list existingAuthors as author>
            <li class="author-item">
                <input type="checkbox" name="existingAuthors" value="${author.id}">
                ${author.name}
            </li>
        </#list>
    </ul>

    <label for="authorNames">Или добавьте нового автора(ов) через запятую:</label>
    <input type="text" id="authorNames" name="authorNames">

    <button type="submit">Добавить</button>
</form>

<script>
    function filterAuthors() {
        const searchInput = document.getElementById('search').value.toLowerCase();
        const authorItems = document.querySelectorAll('.author-item');

        authorItems.forEach(function(item) {
            const authorName = item.textContent.toLowerCase();
            if (authorName.includes(searchInput)) {
                item.style.display = '';
            } else {
                item.style.display = 'none';
            }
        });
    }

    function validateForm() {
        const title = document.getElementById('title').value.trim();
        const authorNames = document.getElementById('authorNames').value.trim();
        const checkedAuthors = document.querySelectorAll('input[name="existingAuthors"]:checked').length;

        if (title === "" || (authorNames === "" && checkedAuthors === 0)) {
            alert("Пожалуйста, заполните название книги и выберите или добавьте хотя бы одного автора.");
            return false;
        }
        alert("Книга добавлена, спасибо");
        return true;
    }
</script>

</body>
</html>
