<!DOCTYPE html>
<html>
<body>
<h1>Добавление новой книги</h1>
<form method="post" action="/books/add" onsubmit="return validateForm()">
    <label for="title">Название:</label>
    <input type="text" id="title" name="title" required>

    <label for="authorNames">Имя автора(авторов через запятую): </label>
    <input type="text" id="authorNames" name="authorNames" required>

    <button type="submit">Добавить</button>
</form>
<form method="get" action="/">
    <button type="submit">На главную</button>
</form>
<script>
    function validateForm() {
        const title = document.getElementById('title').value.trim();
        const authorNames = document.getElementById('authorNames').value.trim();

        if (title === "" || authorNames === "") {
            alert("Поля не могут содержать только пробелы.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>