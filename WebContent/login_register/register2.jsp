<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head><meta charset="utf-8">
	<meta author="徐虎">
	<form action="<%=request.getContextPath()%>/StudentServlet?action=toaddstu" method="post">
		<title>登录 - 答达 - 知识交流共享平台</title>
		<script src="<%=request.getContextPath()%>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/register-login.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/verify.css">
		
	</head>
	<body background="<%=request.getContextPath()%>/image/login.jpg">
	    <div id="backimg"></div>
	    <div id="alert" class="alert alert-warning">
       <a href="<%=request.getContextPath()%>/login_register/register.jsp" class="close" data-dismiss="alert">&times;</a>
       <strong>警告！</strong><br>您输入的用户名已被占用!
         </div>
	</body>

</html>