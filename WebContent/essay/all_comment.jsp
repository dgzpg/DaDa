<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import = "cn.rt.entity.Comment" %>
<%@ page import = "cn.rt.entity.Student" %>
    <%@ page import = "cn.rt.util.jdbc" %>
    <%@ page import = "cn.rt.service.CommentService" %>
    <%@ page import = "cn.rt.serviceimpl.CommentServiceImpl" %>
    <%@ page import = "cn.rt.serviceimpl.StudentServiceImpl" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.util.List"%>
    <%@ page import = "cn.rt.util.PageSupport"%>
    <%@ page import = " cn.rt.daoimpl.CommentDaoImpl" %>

    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>all_comment</title>
<script src='<%=request.getContextPath()%>/js/jquery.min.js' type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/all_comment.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/title.css">
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
		<li><a href="<%=request.getContextPath()%>/essay/write_essay.jsp" class="LeftTag"> 写文章 </a>
		</li>
		<li><a href="<%=request.getContextPath()%>/question/ask_question.jsp" class="LeftTag">
				提&nbsp;&nbsp;&nbsp;&nbsp;问 </a></li>
		<li><a href="<%=request.getContextPath()%>/answer/write_answer.jsp" class="LeftTag"> 写回答
		</a></li>
	</ul>
	<div id="div01">
		<p id="p01" style="font-size:200%">所有评论</p>
		<hr width=100% size="5">
		 <%
				//获取当前页码
				String currntPage = request.getParameter("pageIndex");
				if (currntPage == null)
					currntPage = "1";
				/*当前页面*/
				int pageIndex = Integer.parseInt(currntPage);
				//获取成员记录总数量
				CommentDaoImpl art=new CommentDaoImpl();
				int totalCount = art.getTotalCount(null);
				//每页显示记录数
				int pageSize = 10;
				/*获取总页数*/
				PageSupport pages = new PageSupport();
				pages.setCurrPageNo(pageIndex);
				pages.setPageSize(pageSize);
				pages.setRecordCount(totalCount);
				int totalPage=pages.getTotalPageCount();
				 String ano = request.getParameter("name");


				//控制首页和 末页
				if (pageIndex < 1)
					pageIndex = 1;
				else if (pageIndex > totalPage)
					pageIndex = totalPage;

				//每页显示的成员列表
				List<Comment> list = art.getPageIntroductionList(pageIndex,pageSize,null);
				//request.setAttribute("introList", introList);
				//request.setAttribute("pageIndex", pageIndex);
				Iterator<Comment> iter = list.iterator();
   while(iter.hasNext()){
	   Comment arts = iter.next();
	   String str = null;
       if(arts.getCtext().length() > 100)
       	str = arts.getCtext().substring(0,100);
       else
       	str = arts.getCtext();
       StudentServiceImpl ssi = new StudentServiceImpl();
       Student stu = new Student();
       stu = ssi.getById(arts.getSno());
%>
<p id="p02">
<%=stu.getSname()%>
</p>
<p id="p03"><%=str%></p>
<p id="p04"><%=arts.getCtime()%>
<hr width=100% size="5">
<%
    }
%>

			
		<!--  	<input type="hidden" id="totalPage" value="<%=totalPage%>" />-->
		
	        
	       
	        <div class="roll_page">


<div >
<ul >
	共<%=totalCount%>条记录&nbsp;&nbsp; <%=pageIndex%>/<%=totalPage%>页&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="<%=pageIndex%>>1 }" >
				<a href="all_comment2.jsp?pageIndex=1">首页&nbsp;</a>
				<a href="all_comment2.jsp?pageIndex=<%=pageIndex-1%>">上一页&nbsp;</a>
	</c:if>
	<c:if test="<%=pageIndex%> < <%=totalPage%> }" >
				<a href="all_comment2.jsp?pageIndex=<%=pageIndex+1%>">下一页&nbsp;</a>
				<a href="all_comment2.jsp?pageIndex=<%=totalPage%>">最后一页</a>
	</c:if>


 <form href="all_comment2.jsp">
 <span >跳转至
    <input type="text" name="pageIndex" id="pageIndex" class="page-key" />页
    <input  type="submit" value="GO">
    </span>
    </form>
</ul>
<hr width=100% size="5">
</div> 
	</div>
	<form
		action="<%=request.getContextPath()%>/commentservlet?action=sub&ano=<%=ano%>"
		method="post">
		<p id="p03" style="font-size:130%">写评论</p>
		<hr width=100% size="5" />
		<textarea id="div01_01"
			style="resize: none; width: 100%; height: 100px"
			placeholder="请输入您的评论" name="ctext"></textarea>
		<br> <input type="checkbox" id="div01_02">匿名设置<br> <br>
		<input href="#" type="submit" value="发布" class="btn btn-default">
	</form>
</body>
</html>
