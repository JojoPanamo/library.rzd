<!DOCTYPE html>
<html>
<head>
    <title>${author.name}'s Books</title>
</head>
<body>
<h1>Books by ${author.name}</h1>
<ul>
    <#list books as book>
        <li>${book.title}</li>
    </#list>
</ul>
</body>
</html>