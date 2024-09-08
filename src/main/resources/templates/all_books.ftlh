<!DOCTYPE html>
<html>
<h1>Книги в нашей библиотеке</h1>
<form method="get" action="/books/search">
    <input type="text" name="title" placeholder="Поиск по названию">
    <button type="submit">Поиск</button>
</form>
<ul>
<#list books as book>
    <li><a href="/books/${book.id}">${book.title}</a></li>
</#list>
    <form method="get" action="/">
        <button type="submit">На главную</button>
    </form>
</ul>
</html>