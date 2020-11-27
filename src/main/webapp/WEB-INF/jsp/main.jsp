<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx }/css/style.css">
    <script>
        var ctx = "${ctx}";
    </script>
</head>
<body>
<div class="b">
    <span id="clock" style="color:#0000FF"></span>
</div>
<h1>欢迎登录</h1>
<div class="wrap">
    <span><strong>学生宿舍管理系统</strong>
		</span>
</div>
<h2>当前登录用户：${admin.nickname }</h2>
</body>
</html>