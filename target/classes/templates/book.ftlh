<!DOCTYPE html>
<html>
<h1>Books</h1>
<form method="get" action="/book/search">
    <input type="text" name="title" placeholder="Search book">
    <button type="submit">Search</button>
</form>
<ul>
<#list books as book>
    <li><a href="/book/${book.id}">${book.title}</a></li>
</#list>
</ul>
</html>