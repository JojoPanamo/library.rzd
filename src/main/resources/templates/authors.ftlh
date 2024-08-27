<!DOCTYPE html>
<html>
<h1>Authors</h1>
<form method="get" action="/author/search">
    <input type="text" name="name" placeholder="Search author">
    <button type="submit">Search</button>
</form>
<ul>
    <#list author as author>
        <li><a href="/author/${author.id}">${author.name}</a></li>
    </#list>
</ul>
</html>