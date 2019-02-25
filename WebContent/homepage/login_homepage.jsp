<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="cn.rt.entity.Article"%>
<%@ page import="cn.rt.entity.Question"%>
<%@ page import="cn.rt.util.jdbc"%>
<%@ page import="cn.rt.service.QuestionService"%>
<%@ page import="cn.rt.serviceimpl.QuestionServiceImpl"%>
<%@ page import="cn.rt.service.ArticleService"%>
<%@ page import="cn.rt.serviceimpl.ArticleServiceImpl"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta author="徐虎">
<title>homepage</title>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/title.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/homepage.css">
</head>
<body background="<%=request.getContextPath()%>/image/background.jpg">
<a href="javascript:;" id="btn" title="回到顶部"></a>
	<ul id="ul01" class="nav nav-tabs">
		<!-- nav nav-pills -->
		<!--nav navbar-nav-->
		<li id="dada">&nbsp;&nbsp;答达&nbsp;&nbsp;</li>
		<li class="active">
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
				class="caret"></b> </a>
			<ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
				<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp"
					tabindex="-1">我的空间</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp" tabindex="-1">注销</a></li>
			</ul>
		</li>
		<img src="<%=request.getContextPath()%>/image/头像.jpg"
			class="img-circle navbar-right" height="40" width="40" id="头像" />&nbsp;&nbsp;&nbsp;
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
		<li><a href="<%=request.getContextPath()%>/essay/write_essay.jsp"
			class="LeftTag"> 写文章 </a></li>
		<li><a
			href="<%=request.getContextPath()%>/question/ask_question.jsp"
			class="LeftTag"> 提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a
			href="<%=request.getContextPath()%>/answer/write_answer.jsp"
			class="LeftTag"> 写回答 </a></li>
	</ul>

	<div id="div01" class="carousel slide" style="background-color: #555;">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#div01" data-slide-to="0" class="active"></li>
			<li data-target="#div01" data-slide-to="1"></li>
			<li data-target="#div01" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner" style="width:100%; height: 100%">
			<div class="item active" style="width:100%; height: 100%">
				<img src="<%=request.getContextPath()%>/image/heiban.jpg"
					alt="First slide" style="width:100%; height: 100%">
			</div>
			<div class="item">
				<img src="<%=request.getContextPath()%>/image/rengongzhineng.jpg"
					alt="Second slide" style="width:100%; height: 100%">
			</div>
			<div class="item">
				<img src="<%=request.getContextPath()%>/image/jingji.jpg"
					alt="Third slide" style="width:100%; height: 100%">
			</div>
		</div>
		<!-- 轮播（Carousel）导航 -->
		<a class="left carousel-control" href="#div01" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"> </span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#div01" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true">
		</span> <span class="sr-only">Next</span>
		</a>
	</div>

	<div id="div02">
		<img src="<%=request.getContextPath()%>/image/302594.jpg"
			alt="First slide" style="width:100%; height: 100%">
	</div>


	<div id="div03" class="nav nav-tabs">
		<li class="active"><a href="#" data-toggle="tab"
			style="color: forestgreen; font-size: 18px">&nbsp;文章&nbsp;</a></li> <a
			href="<%=request.getContextPath() %>/essay/all_essay.jsp"
			style="float: right; font-size: 18px">更多</a>
	</div>

<div id="div03_01">
	<%
            List<Article> list = new ArrayList<Article>();
            ArticleServiceImpl asi = new ArticleServiceImpl();
            list = asi.getAll("All", "ByDESC");
            int i = 0;
            while(i < 3 && i < list.size() ){
	            Article art = new Article();
	            art = (Article)(list.get(i));
	            String str=null;
	            if(art.getAtext().length()>100){
	            	str = art.getAtext().substring(0,100);
	            }else
	            	str = art.getAtext();
        %>
	<p id="p02">
		<a href="<%=request.getContextPath()%>/essay/essay_content.jsp?name=<%=art.getAno()%>"><strong style="font-size:130%;"><%=art.getAtitle()%></strong></a>
	</p>
	<p id="p03"><%=str%></p>
	<hr width=100% size="5">
	<%
               i++;
             }
         %>
         </div>
         
         
	<div class="nav nav-tabs" id="div04">
		<li class="active"><a href="#" data-toggle="tab"
			style="color: forestgreen; font-size: 18px">&nbsp;问题&nbsp;</a></li> <a
			href="<%=request.getContextPath()%>/question/all_question.jsp"
			style="float: right; font-size: 18px">更多</a>
	</div>
	
<div id="div03_02">
		<%
            List<Question> list2 = new ArrayList<Question>();
            QuestionServiceImpl asi2 = new QuestionServiceImpl();
            list2 = asi2.getAll("All", "ByDESC");
            int j = 0;
            while(j < 3 && j < list2.size() ){
	            Question art = new Question();
	            art = (Question)(list2.get(j));
	            String str=null;
	            if(art.getQtext().length()>20){
	            	str = art.getQtext().substring(0,20);
	            }else
	            	str = art.getQtext();
        %>
	
	<p id="p02">
		<a
			href="<%=request.getContextPath()%>/question/question_content.jsp?name=<%=art.getQno()%>"><strong style="font-size:130%"><%=art.getQtitle()%></strong></a>
	</p>
	<p id="p03"><%=str%></p>
	<hr width=100% size="5">
	<%
               j++;
             }
         %>
	</p>
	</div>

	<div class="nav nav-tabs" id="div05" style="float: left; width: 60%">
		<li class="active"><a href="#" data-toggle="tab"
			style="color: forestgreen; font-size: 18px">&nbsp;今日热文&nbsp;</a></li>
	</div>
    
    <div id="div06">
    <%
         int []r = new int[3];
         for(int l = 0;l < 3;l++){
        	 r[l] = (int)(Math.random()*20+l);
        	 for(int m = 0;m<l;m++){
        		 if(r[m]==r[l])
        			 l--;
        		 continue;
        	 }
         }
         for(j = 0;j<3;j++){
        	 Article art = new Article();
	            art = (Article)(list.get(r[j]));
	            String str=null;
	            if(art.getAtext().length()>100)
	            	str=art.getAtext().substring(0,100);
	            else str=art.getAtext();
    %>
   
	<p id="p02">
	<a href="<%=request.getContextPath()%>/essay/essay_content.jsp?name=<%=art.getAno()%>"><strong style="font-size:130%;"><%=art.getAtitle()%></strong></a>
	<p id="p03"><%=str%></p>
	<%
         }
	%>
	</div>
</body>
</html>