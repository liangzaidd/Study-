<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" language="java" %>
<html>
<head>
    <title>Welcome</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
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
                    <form action="/book/searchBook" method="post" >
                        <input type="text" name="bookName" class="form-control" required="required" placeholder="请输入要查找的书籍名称">
                        <input type="submit"  class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row clearfix">
        <table class="table table-hover table-striped"  >
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

</div>


    <nav aria-label="Page navigation" style="text-align: center" >
        <ul class="pagination pagination-lg">
            <%-- 上一页 判断 --%>
            <c:if test="${page == 1}">
                <li class="disabled">
                     <span aria-hidden="false">&laquo;</span>
                </li>
            </c:if>
            <c:if test="${page != 1}">
                <li>
                    <a href="/book/welcome/${page-1}" aria-label="Previous">
                        <span aria-hidden="false">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <%-- 页数 --%>
            <c:forEach begin="1" end="${pages}" var="i">
                <c:if test="${page == i}">
                    <li class="active"><a href="/book/welcome/${i}">${i}</a></li>
                </c:if>
                <c:if test="${page != i}">
                    <li><a href="/book/welcome/${i}">${i}</a></li>
                </c:if>
            </c:forEach>
            <%-- 下一页 判断 --%>
            <c:if test="${page == pages}">
                <li class="disabled">
                    <span aria-hidden="true">&raquo;</span>
                </li>
            </c:if>
            <c:if test="${page != pages}">
                <li>
                    <a href="/book/welcome/${page+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
             </c:if>

        </ul>
    </nav>


</body>
</html>
