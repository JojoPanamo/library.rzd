<!DOCTYPE html>
<html>
<h1>Latest Books</h1>
<ul>
    <#list book as book>
        <li><a href="/book/${book.id}">${book.title}</a> by <a href="/author/${book.author.id}">${book.author.name}</a></li>
    </#list>
</ul>
</html>