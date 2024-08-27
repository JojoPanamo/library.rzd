<!DOCTYPE html>
<html>
<h1>Add Book</h1>
<form method="post" action="/book/add">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title">

    <label for="author">Author:</label>
    <select id="author" name="author.id">
        <#list author as author>
            <option value="${author.id}">${author.name}</option>
        </#list>
    </select>

    <button type="submit">Add Book</button>
</form>
</html>