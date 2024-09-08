<!DOCTYPE html>
<html>
<h1>Авторы</h1>
<form method="get" action="/author/search">
    <input type="text" name="name" placeholder="Search author">
    <button type="submit">Search</button>
</form>
<ul>
    <#list authors as author>
        <li><a href="/authors/${author.id}">${author.name}</a></li>
    </#list>
</ul>
<form method="get" action="/">
    <button type="submit">На главную</button>
</form>
</html>