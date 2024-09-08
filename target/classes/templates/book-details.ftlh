<!DOCTYPE html>
<html>
<body>
<h1>Книга: ${book.title}</h1>
Автор(ы):
<ul>
    <#list book.authors as author>
        <li><p><a href="/authors/${author.id}">${author.name}</a></li>
    </#list>
</ul>
<form method="get" action="/">
        <button type="submit">На главную</button>
</form>
</body>
</html>
</body>
</html>