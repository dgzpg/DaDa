<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="cn.rt.entity.Article"%>
<%@ page import="cn.rt.entity.Question"%>
<%@ page import="cn.rt.util.jdbc"%>
<%@ page import="cn.rt.service.ArticleService"%>
<%@ page import="cn.rt.serviceimpl.ArticleServiceImpl"%>
<%@ page import="cn.rt.service.QuestionService"%>
<%@ page import="cn.rt.serviceimpl.QuestionServiceImpl"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta author="徐虎">
<title>其他</title>
<script src='<%=request.getContextPath()%>/js/jquery.min.js' type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/title.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/other_homepage.css">
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
			<li class="active">
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
		<li><a href="<%=request.getContextPath()%>/essay/write_essay.jsp" class="LeftTag"> 写文章 </a>
		</li>
		<li><a href="<%=request.getContextPath()%>/question/ask_question.jsp" class="LeftTag">
				提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a href="<%=request.getContextPath()%>/answer/write_answer.jsp" class="LeftTag"> 写回答
		</a></li>
	</ul>


	<div id="div03" class="nav nav-tabs">
		<li class="active"><a href="#" data-toggle="tab"
			style="color: forestgreen; font-size: 18px">&nbsp;文章&nbsp;</a></li> <a
			href="<%=request.getContextPath()%>/ArticleServlet?action=getByTitle&type=Other"
			style="float: right; font-size: 18px">更多</a>
	</div>
	<!--  从此处开始修改，使其显示三条数据 -->
		<div id="div01">
			<%
				List<Article> list = new ArrayList<Article>();
				ArticleServiceImpl asi = new ArticleServiceImpl();
				list = asi.getAll("atype", "其他");
				Iterator<Article> iter = list.iterator();
				int i = 0;String Ano=null;
				while(iter.hasNext() && i < 3){
					Article art = iter.next();
					Ano=art.getAno();
						%>
			<form action="essay_content.jsp" method="post">
				<!-- 显示文章标题 -->
				<p id="p02">
					<a href="<%=request.getContextPath()%>/essay/essay_content.jsp?name=<%=Ano%>"><strong style="font-size:130%"><%=art.getAtitle()%></strong></a>
				</p>
				<!-- 显示文章内容     文章标题和内容每个里面都会重复 -->
				<p id="p03">
					<%=(String)(art.getAtext()).substring(0,100)%>
				</p>
				<p id="p04">
				<%=art.getAtime()%>
				</p>
				<hr width=100% size="5">
				<%
										 i++;
 									  }
 									%>

				<hr width=100% size="5">
		</div>


	<div id="div04" class="nav nav-tabs">
		<li class="active"><a href="#" data-toggle="tab"
			style="color: forestgreen; font-size: 18px">&nbsp;问题&nbsp;</a></li> <a
			href="<%=request.getContextPath()%>/question/all_question.jsp"
			 style="float: right; font-size: 18px">更多</a>
	</div>
	<!--  从此处开始修改，使其显示三条数据 -->
		<div id="div02">
			<%
				List<Question> list2 = new ArrayList<Question>();
				QuestionServiceImpl qsi = new QuestionServiceImpl();
				list2 = qsi.getAll("qtitle", "其他");
				Iterator<Question> iter2 = list2.iterator();
				int j = 0;String qno=null;
				System.out.println(list2.size());
				while(iter2.hasNext() && j < 3){
					Question que = new Question();
					que = iter2.next();
					String str = null;
					qno=que.getQno();
					if(que.getQtext().length()>50)
						str = que.getQtext().substring(0,50);
					else str = que.getQtext();
						%>
			<form action="essay_content.jsp" method="post">
				<!-- 显示文章标题 -->
				<p id="p02">
					<a href="<%=request.getContextPath()%>/question/question_content.jsp?name=<%=qno%>"><strong style="font-size:130%"><%=que.getQtitle()%></strong></a>
				</p>
				<!-- 显示文章内容     文章标题和内容每个里面都会重复 -->
				<p id="p03">
					<%=str%>
				</p>
				<p id = "p04">
				<%=que.getQtime()%>
				</p>
				<hr width=100% size="5">
				<%
										 j++;
 									  }
 									%>

				<hr width=100% size="5">
		</div>


</body>
</html>