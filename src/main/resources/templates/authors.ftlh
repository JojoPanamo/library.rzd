<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authors List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"] {
            padding: 8px;
            font-size: 14px;
            width: 300px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 8px 12px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            background-color: #f9f9f9;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
        }

        a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Authors</h1>

    <form method="get" action="/authors/search">
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
</div>

</body>
</html>
