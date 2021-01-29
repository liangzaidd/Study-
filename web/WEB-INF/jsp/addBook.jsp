<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>addBook</title>
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h3>
                    <small>新增书籍</small>
                </h3>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <input type="text" class="form-control" name="bookName" required  placeholder="书籍名称" >
        </div>
        <div class="form-group">
            <input type="number" class="form-control" name="bookCounts" required  placeholder="书籍数量" >
        </div>
        <div class="form-group">
            <input type="text" class="form-control"  name="detail" required  placeholder="书籍描述">
        </div>
        <div class="form-group">
            <input type="submit" class="form-control" value="添加" >
        </div>
    </form>
</div>

</body>
</html>
