<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
</head>
<body>
<h1>Add Book</h1>
<form method="post" action="/books/add">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required>

    <label for="authorName">Author Name:</label>
    <input type="text" id="authorName" name="authorName" required>

    <button type="submit">Add Book</button>
</form>
</body>
</html>