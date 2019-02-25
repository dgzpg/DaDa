<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta author="徐虎">
<title>登录 - 答达 - 知识交流共享平台</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/register-login.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/verify.css">

</head>

<body background="<%=request.getContextPath()%>/image/login.jpg">
	<div class="cent-box"
		style="background-color: white; padding: 20px; opacity: 0.9; border-radius: 10px;">
		<div class="cent-box-header">
			<h1 class="main-title hide">答达</h1>
			<h2 class="sub-title">大学生知识交流共享平台</h2>
		</div>
		<div class="cont-main clearfix">
			<div class="index-tab">
				<div class="index-slide-nav">
					<a href="login.jsp" class="active" style="color: #228B22">登录</a> <a
						href="register.jsp">注册</a>
					<div class="slide-bar" style="background-color: #228B22"></div>
				</div>
			</div>
			<div class="login form">
				<div class="group">
					<form
						action="<%=request.getContextPath()%>/StudentServlet?action=login"
						method="post">
						<div class="group-ipt user">
							<input type="text" name="sno" id="user" class="ipt"
								placeholder="请输入您的账号" required>
						</div>
						<div class="group-ipt password">
							<input type="password" name="spassword" id="password" class="ipt"
								placeholder="请输入您的登录密码" required>
						</div>
				</div>
			</div>
			<div class="container">
				<div id="captcha" style="position: relative"></div>
				<div id="msg"></div>
			</div>
			<div class="button">
				<button type="submit" class="login-btn register-btn" id="button"
					style="background-color: #228B22">登录</button>
				</form>
			</div>
			<div class="remember clearfix">
				<label class="forgot-password"> <a href="#">忘记密码？</a>
				</label>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>答达 - 大学生知识交流共享平台</p>
	</div>
	<script src='<%=request.getContextPath()%>//js/jquery.min.js' type="text/javascript">
		</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>//js/verify.js">
		</script>
	<script type="text/javascript">jigsaw.init(document.getElementById('captcha'),
			function() {
				document.getElementById('msg').innerHTML = '验证正确！'
			})</script>
</body>

</html>