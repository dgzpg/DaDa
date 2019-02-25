<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>write essay</title>
<script src='<%=request.getContextPath()%>/js/jquery.min.js' type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/title.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/write_essay.css">
</head>
</head>
<body background="<%=request.getContextPath()%>/image/background.jpg">
<a href="javascript:;" id="btn" title="回到顶部"></a>
	<ul id="ul01" class="nav nav-tabs">
		<!-- nav nav-pills -->
		<!--nav navbar-nav-->
		<li id="dada">&nbsp;&nbsp;答达&nbsp;&nbsp;</li>
		<li>
				<a href="<%=request.getContextPath()%>/homepage/login_homepage.jsp" class="TopTag">&nbsp;首页&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/cs.jsp" class="TopTag">&nbsp;专业&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/big_data.jsp" class="TopTag">&nbsp;辅修&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/economy.jsp" class="TopTag">&nbsp;考研&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/math.jsp" class="TopTag">&nbsp;留学&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/psychology.jsp" class="TopTag">&nbsp;就业&nbsp;</a>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/homepage/other.jsp" class="TopTag">&nbsp;其他&nbsp;</a>
			</li>

		<li class="dropdown navbar-right">
			<%
			    String sname = (String)session.getAttribute("sname");
			%> <a href="../myspace/my_info.jsp" id="myTabDrop1"
			class="dropdown-toggle" data-toggle="dropdown"
			style="color: forestgreen; font-size: 18px"><%=sname%> <b
				class="caret"></b>
		</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp" tabindex="-1">我的空间</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp" tabindex="-1">注销</a></li>
			</ul>
		</li>
		<img src="<%=request.getContextPath()%>/image/头像.jpg" class="img-circle navbar-right" height="40"
			width="40" id="头像" />&nbsp;&nbsp;&nbsp;
		<form action="<%=request.getContextPath()%>/homepage/afterSearch.jsp"
				class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" name="text" class="form-control"
						placeholder="请输入搜索的内容">
				</div>
				<input type="submit" value="搜索" class="btn btn-default">
			</form>

	</ul>

	<ul id="ul02">
		<li style="background-color: #48D1CC"><a
			href="<%=request.getContextPath()%>/essay/write_essay.jsp" style="color:white" class="LeftTag"> 写文章 </a></li>
		<li><a href="<%=request.getContextPath()%>/question/ask_question.jsp" class="LeftTag">
				提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a href="<%=request.getContextPath()%>/answer/write_answer.jsp" class="LeftTag"> 写回答
		</a></li>
	</ul>

	<div id="div01">
		<%
	   String sno = (String)session.getAttribute("sno");
	%>
		<form
			action="<%=request.getContextPath()%>/ArticleServlet?action=publishArticle&sno=<%=sno%>"
			method="post">
			<input id="div01_01" type="text" name="atitle" placeholder="请输入文章标题"><br>
			<textarea id="div01_02" clos=",50" rows="5" warp="virtual"
				name="atext" placeholder="请输入文章正文"></textarea>
			<p id="div01_03">文章分类</p>
			<select name="atype" id="div01_04">
				<option>--请选择--</option>
				<option>专业</option>
				<option>辅修</option>
				<option>考研</option>
				<option>留学</option>
				<option>就业</option>
			</select> <input type="checkbox" id="div01_05">
			<p id="div01_06">匿名设置</p>


			<input id="div01_07" href="#" type="submit" value="发布"
				class="btn btn-default">
		</form>
		<a href="<%=request.getContextPath()%>/essay/write_essay.jsp"> <input id="div01_08"
			type="submit" value="取消" class="btn btn-default"></a>

	</div>


</body>
</html>