<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список авторов</title>
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
            background-color: cadetblue;
            color: white;
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
            background-color: #f9f9f6;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 4px;
            color: black;
        }

        a {
            text-decoration: none;
            color: cadetblue;
        }

        a:hover {
            text-decoration: underline;
        }
        .button-container {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }

    </style>
</head>
<body>
<div class="button-container">
    <form method="get" action="/">
        <button type="submit">На главную</button>
    </form>
</div>
<div class="container">
    <h2>Авторы</h2>
    <input type="text" id="search" placeholder="Поиск автора" onkeyup="filterAuthors()">

    <ul id="authorList">
        <#list authors as author>
            <li><a href="/authors/${author.id}">${author.name}</a></li>
        </#list>
    </ul>

<script>
    function filterAuthors() {
        const searchInput = document.getElementById('search').value.toLowerCase();
        const authorItems = document.querySelectorAll('#authorList li');

        authorItems.forEach(function(item) {
            const authorName = item.textContent.toLowerCase();
            if (authorName.includes(searchInput)) {
                item.style.display = '';
            } else {
                item.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>

