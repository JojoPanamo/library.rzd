<!DOCTYPE html>
<html>
<body>
<h1>Все книги автора: ${author.name}</h1>
<ul>
    <#list books as book>
        <li><a href="/books/${book.id}">${book.title}</a></li>
    </#list>
</ul>
<form method="get" action="/">
        <button type="submit">На главную</button>
</form>
</body>
</html>