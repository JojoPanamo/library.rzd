<!DOCTYPE html>
<html>
<body>
<h1>Книги в нашей библиотеке</h1>
<#if books?? && (books?size > 0)>
    <ul>
        <#list books as book>
            <li>
                <a href="/books/${book.id}">${book.title}</a>, Автор(ы):
                <#list book.authors as author>
                    <a href="/authors/${author.id}">${author.name}</a>
                    <#if author?has_next>, </#if>
                </#list>
            </li>
        </#list>
    </ul>
<#else>
    <p>Пока нет книг</p>
</#if>
<hr>
<b> <a href="/books/add">Добавить новую книгу</a><br>
    <b> <a href="/authors">Список авторов</a><br>
        <b> <a href="/books">Все книги</a>
</body>
</html>
