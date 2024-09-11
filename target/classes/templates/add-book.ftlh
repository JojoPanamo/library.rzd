<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавление новой книги</title>
</head>
<body>
<h1>Добавление новой книги</h1>

<#if error??>
    <p style="color: red;">${error}</p>
</#if>

<form method="post" action="/books/add" onsubmit="return validateForm()">
    <label for="title">Название:</label>
    <input type="text" id="title" name="title" required>

    <label for="existingAuthors">Выберите автора:</label>
    <select id="existingAuthors" name="existingAuthors" multiple="multiple">
        <option value="">-- Выберите автора --</option>
        <#list existingAuthors as author>
            <option value="${author.id}">${author.name}</option>
        </#list>
    </select>

    <label for="authorNames">Или добавьте нового автора(ов) через запятую:</label>
    <input type="text" id="authorNames" name="authorNames">

    <button type="submit">Добавить</button>
</form>

<form method="get" action="/">
    <button type="submit">На главную</button>
</form>

<script>
    function validateForm() {
        const title = document.getElementById('title').value.trim();
        const authorNames = document.getElementById('authorNames').value.trim();
        const existingAuthors = document.getElementById('existingAuthors').selectedOptions.length;

        if (title === "" || (authorNames === "" && existingAuthors === 0)) {
            alert("Пожалуйста, заполните название книги и выберите или добавьте хотя бы одного автора.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>

