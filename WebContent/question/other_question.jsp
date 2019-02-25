<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="cn.rt.util.jdbc"%>
<%@ page import="cn.rt.entity.Question"%>
<%@ page import="cn.rt.service.QuestionService"%>
<%@ page import="cn.rt.serviceimpl.QuestionServiceImpl"%>
<%@ page import="java.util.*"%>


<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>other_essay</title>
<script src='<%=request.getContextPath()%>/js/jquery.min.js'
	type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js'
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/title.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/all_essay.css">
<script type="text/javascript">

</script>
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
			    %> <a href="<%=request.getContextPath()%>/myspace/my_info.jsp" id="myTabDrop1"
			class="dropdown-toggle" data-toggle="dropdown"
			style="color: forestgreen; font-size: 18px"><%=sname%> <b
				class="caret"></b>
		</a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp" tabindex="-1">我的空间</a></li>
				<li><a href="unlogin_homepage.jsp" tabindex="-1">注销</a></li>
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
		<li><a href="<%=request.getContextPath()%>/essay/write_essay.jsp" class="LeftTag"> 写文章 </a>
		</li>
		<li><a href="<%=request.getContextPath()%>/question/ask_question.jsp" class="LeftTag">
				提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a href="<%=request.getContextPath()%>/answer/write_answer.jsp" class="LeftTag"> 写回答
		</a></li>
	</ul>
	<div id="div01">
		<p id="p01">所有问题</p>

		<hr width=100% size="5">
		<%
            List<Question> list2 = new ArrayList<Question>();
            QuestionServiceImpl qsi = new QuestionServiceImpl();
            list2 =(List<Question>)request.getAttribute("list");
            Iterator<Question> iter2 = list2.iterator(); 
            int j = 0;
            while(iter2.hasNext()&& j < 10){
	            Question art = iter2.next();
	            String str = null;
	            if(art.getQtext().length() > 100)
	            	str = art.getQtext().substring(0,100);
	            else
	            	str = art.getQtext();
        %>
		<p id="p02">
			<a href="<%=request.getContextPath()%>/essay/essay_content.jsp?name=<%=art.getQno()%>"><%=art.getQtitle()%></a>
		</p>
		<p id="p03"><%=str%></p>
		<hr width=100% size="5">
		<%
                 j++;
             }
         %>
	
</body>
</html>
