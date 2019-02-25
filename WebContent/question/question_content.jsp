<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="cn.rt.entity.Reply"%>
<%@ page import="cn.rt.entity.Student"%>
<%@ page import="cn.rt.entity.Question"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="cn.rt.serviceimpl.QuestionServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.ReplyServiceImpl"%>
<%@ page import="cn.rt.serviceimpl.StudentServiceImpl"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>question content</title>
<script src='<%=request.getContextPath()%>/js/jquery.min.js'
	type="text/javascript">
		</script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js'
	type="text/javascript">
		</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/title.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/question_content.css">
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

		<%
           String sname = (String)session.getAttribute("sname");
       %>
		<li class="dropdown navbar-right"><a
			href="<%=request.getContextPath()%>/myspace/my_info.jsp" id="myTabDrop1" class="dropdown-toggle"
			data-toggle="dropdown" style="color: forestgreen; font-size: 18px"><%=sname%>
				<b class="caret"></b>
		</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp" tabindex="-1">我的空间</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp" tabindex="-1">注销</a>
				</li>
			</ul></li>
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
		<li><a href="<%=request.getContextPath()%>/essay/write_essay.jsp" class="LeftTag"> 写文章 </a>
		</li>
		<li><a href="<%=request.getContextPath()%>/question/ask_question.jsp" class="LeftTag">
				提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a href="<%=request.getContextPath()%>/answer/write_answer.jsp" class="LeftTag"> 写回答
		</a></li>
	</ul>

	<form action="replyServlet" method="post">
		<div id="div01">
			<div id="div02">
				<a href="#"><img src="<%=request.getContextPath()%>/image/头像.jpg" class="img-circle"
					height="40" width="40" id="头像" />&nbsp;&nbsp;&nbsp;<%=sname%>
					</p></a><br />
				<%
    String qno = request.getParameter("name");
	Question question = new Question();
	question.setQno(qno);
	QuestionServiceImpl qri = new QuestionServiceImpl();
	question = qri.getById(qno);
%>
				<p id="p01">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=question.getQtitle()%></p>
				<p id="p02">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=question.getQtext()%></p>
				<hr width=100% size="5" />
				<p id="p03">回复</p>
				<p id="p04">
					<a href="<%=request.getContextPath()%>/answer/all_answer.jsp?name=<%=question.getQno()%>" id="more">more&nbsp;&nbsp;</a>
				</p>
				<hr width=100% size="5" />
				<%
    List<Reply> list = new ArrayList<Reply>();
    ReplyServiceImpl rsi = new ReplyServiceImpl();
    list = rsi.getAllDesc(qno, "All", "");
    int i = 0;
    while(i < 3){
    	StudentServiceImpl ssi = new StudentServiceImpl();
    	Student stu = new Student();
    	stu = ssi.getById(list.get(i).getSno());
    	
%>
				<p id="p05">
					<img src="/image/头像.jpg" class="img-circle" height="40"
						width="40" id="头像" />&nbsp;&nbsp;&nbsp;<%=stu.getSname()%></p>
				<p id="p06"><%=list.get(i).getRtext()%></p>
				<%
         i++;
    }
%>
			
	</form>
	<form
		action="<%=request.getContextPath()%>/replyservlet?action=toadd&qno=<%=question.getQno()%>"
		method="post">
		<hr width=100% size="5" />
		<p id="p03" style="font-size:130%">写回答</p>
		<hr width=100% size="5" />
		<textarea id="div01_01"
			style="resize: none; width: 100%; height: 100px"
			placeholder="请输入您的回答" name="rtext"></textarea>
		<br> <input type="checkbox" id="div01_02">匿名设置<br> <br>
		<input href="#" type="submit" value="发布" class="btn btn-default">
	</form>
	</div>
</body>
</html>

