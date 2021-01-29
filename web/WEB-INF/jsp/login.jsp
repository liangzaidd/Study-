<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<h2>Login</h2>
<p style="color: red">${msg}</p>
<form action="/login" method="post">
    <p>用户名: <input type="text" name="username"> </p>
    <p>密码: <input type="password" name="password"></p>
    <input type="submit">
</form>
</body>
</html>
