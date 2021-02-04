<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../css/login.css">

</head>
<body>
<div class="wrap">
    <div class="container">
        <h1 style="color: white; margin: 0; text-align: center">Sign up</h1>
        <br>
        <form action="/login" method="post" >
            <label><input type="text" placeholder="username" required="required" name="username" /></label>
            <label><input type="password" placeholder="password" required="required" name="password" /></label>
            <input type="submit" value="Sign up"/>
        </form>
    </div>
    <br>
    <h3><p style="color: black;text-align: center">${msg}</p></h3>
    <ul>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>

</body>
</html>
