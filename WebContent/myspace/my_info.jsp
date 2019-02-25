<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="cn.rt.entity.Comment"%>
<%@ page import="cn.rt.entity.Student"%>
<%@ page import="cn.rt.entity.Article"%>
<%@ page import="cn.rt.entity.Reply"%>
<%@ page import="cn.rt.entity.Question"%>
<%@ page import="cn.rt.serviceimpl.CommentServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.QuestionServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.StudentServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.ArticleServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.ReplyServiceImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta author="徐虎">
<title>myspace</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/title.css">
<script src='<%=request.getContextPath()%>/js/jquery.min.js'
	type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js'
	type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/btt_btn.js'
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/myspace.css">
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
				class="caret"></b></a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp"
					tabindex="-1">我的空间</a></li>
				<li><a
					href="<%=request.getContextPath()%>/index.jsp"
					tabindex="-1">注销</a></li>
			</ul>
		</li>
		<div class="form-group">
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
		<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp" class="LeftTag" style="background-color: #48D1CC;color: white;">个人信息</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_article.jsp"  class="LeftTag">我的文章</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_comment.jsp" class="LeftTag">我的评论</a>
		</li>
		<li ><a href="<%=request.getContextPath()%>/myspace/my_question.jsp" class="LeftTag">我的提问</a></li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_reply.jsp" class="LeftTag">我的回答</a>
		</li>
	</ul>


			<div class="div01">
				<p id="p01">
					<%
				    String sno = (String)session.getAttribute("sno");
				    StudentServiceImpl ss = new StudentServiceImpl();
				    Student st = new Student();
				    st = ss.getById(sno);//模拟用户
				    String name = st.getSname();
				    String sinfo = st.getSinfo();
				%>
				
				<form
					action="<%=request.getContextPath()%>/StudentServlet?action=update"
					method="post">
					<img src="<%=request.getContextPath()%>/image/头像.jpg"
						class="img-circle" height="40" width="40" id="头像" />&nbsp;&nbsp;<input
						class="div01_00" type="text" value="<%=name%>" name="sname">
					<textarea class="div01_01" type="text" name="sinfo"><%=sinfo%></textarea>
					<button class="div01_02" type="submit">提交</button>
				</form>
			</div>

</body>

</html>