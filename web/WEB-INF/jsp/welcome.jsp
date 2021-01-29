<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <%--bootStrap美化--%>
<%--    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.css" rel="stylesheet">--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script>
        $(function () {
            $("#search").on("click",function () {
                $.ajax({
                    url:"${pageContext.request.contextPath}/book/searchBook",
                    data:{"bookName":$("#bookName").val()},
                    dataType:"json",
                    success:function (data) {
                        let html="<tr><th>bookName</th><th>bookCounts</th><th>detail</th></tr>";
                        for (let i = 0; i < data.length; i++) {
                            html+="<tr><td>"+data[i].bookName+"</td><td>"
                                +data[i].bookCounts+"</td><td>"+data[i].detail+"</td></tr>";
                        }
                        $("#book").html(html);
                        console.log(data);
                    }
                })
            })
        });
    </script>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-10 column">
            <div class="page-header">
                <h3>
                    <small>书籍显示——————————所有书籍</small>
                </h3>
            </div>
        </div>

        <div class="col-md-2 column  from-inline page-header" style="float: right">
            <span class="glyphicon glyphicon-log-out "></span>
            <a href="/logout" >登出</a>
        </div>

        <div class="row">
            <div class="col-md-4 column  form-inline">
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/add">增加书籍</a>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/welcome">显示全部书籍</a>
            </div>
            <div class="col-md-8 column" >
                <div class="form-inline" style="float: right">
                    <span>${error}</span>
                        <input type="text" id="bookName" class="form-control" placeholder="请输入要查找的书籍名称">
                        <input type="submit" id="search" class="btn btn-primary"/>
                </div>
            </div>
        </div>
    </div>
<%--    <div class="row clearfix">--%>
<%--        <div class="col-md-4 column  from-inline" style="float: right">--%>
<%--            <span class="glyphicon glyphicon-log-out"></span>--%>
<%--            <a href="/logout" >登出</a>--%>
<%--        </div>--%>
<%--    </div>--%>

    <div class="row clearfix">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>bookName</th>
                <th>bookCounts</th>
                <th>detail</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tbody >
                <c:forEach var="book" items="${list}">
                    <tr>
                        <td>${book.bookName}</td>
                        <td>${book.bookCounts}</td>
                        <td>${book.detail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/book/update/${book.bookID}">修改</a>
                            &nbsp;|&nbsp;
                            <a href="${pageContext.request.contextPath}/book/delete/${book.bookID}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="row clearfix">
        <table class="table table-hover table-striped" id="book">

        </table>
    </div>
</div>

</body>
</html>
