<!DOCTYPE html>
<html>
<head>
        <title>Latest Books</title>
</head>
<body>
<h1>Latest Books</h1>
<#if books?? && (books?size > 0)>
        <ul>
                <#list books as book>
                        <li>
                                <a href="/book/${book.id}">${book.title}</a> by
                                <a href="/author/${book.author.id}">${book.author.name}</a>
                        </li>
                </#list>
        </ul>
<#else>
        <p>No books available.</p>
</#if>
</body>
</html>
