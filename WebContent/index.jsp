<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>homepage</title>
<link rel="stylesheet" type="text/css" href="css/unlogin_homepage.css">
</head>
	<body background="image/unlogin_homepage.jpg" >
	<div id="div01"></div>
	<p id="p01">Campus knowledge sharing platform</p>
	<p id="p02">The only Campus knowledge sharing platform you will ever want to use.</p>
	<a href="<%=request.getContextPath()%>/login_register/login.jsp" type="submit" id="a01" >login</a>
	
	</body>
</html>