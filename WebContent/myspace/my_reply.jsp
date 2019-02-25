<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
   <%@ page import = "cn.rt.entity.Reply" %>
    <%@ page import = "cn.rt.entity.Question" %>
    <%@ page import = "cn.rt.util.jdbc" %>
    <%@ page import = "cn.rt.service.QuestionService" %>
    <%@ page import = "cn.rt.serviceimpl.QuestionServiceImpl" %>
    <%@ page import = "cn.rt.service.ReplyService" %>
    <%@ page import = "cn.rt.serviceimpl.ReplyServiceImpl" %>
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.util.List"%>
    <%@ page import = "cn.rt.util.PageSupport"%>
    <%@ page import = " cn.rt.daoimpl.ReplyDaoImpl" %>

    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PU"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd ">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta author="徐虎">
<title>myspace</title>
<link rel="stylesheet" type="text/css" href="../css/title.css">
<script src='<%=request.getContextPath()%>/js/jquery.min.js' type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/bootstrap.js' type="text/javascript"></script>
<script src='<%=request.getContextPath()%>/js/btt_btn.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myspace.css">
<script type="text/javascript">//删除
				function del() {
				
				  window.location.reload();
			}</script> 

</head>
<body background="../image/background.jpg">
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
				<li><a href="../myspace/my_info.jsp" tabindex="-1">我的空间</a></li>
				<li><a href="<%=request.getContextPath()%>/index.jsp" tabindex="-1">注销</a>
				</li>
			</ul></li>
		<img src="../image/头像.jpg" class="img-circle navbar-right" height="40"
			width="40" id="头像" />&nbsp;&nbsp;&nbsp;
		<form action="../homepage/afterSearch.jsp"class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" name="text"class="form-control" placeholder="请输入搜索的内容">
				</div>
				<input  type="submit" value = "搜索" class="btn btn-default">
		</form>

	</ul>
	<ul id="ul02">
		<li><a href="<%=request.getContextPath()%>/myspace/my_info.jsp" class="LeftTag">个人信息</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_article.jsp"  class="LeftTag">我的文章</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_comment.jsp" class="LeftTag">我的评论</a>
		</li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_question.jsp" class="LeftTag">我的提问</a></li>
		<li><a href="<%=request.getContextPath()%>/myspace/my_reply.jsp" class="LeftTag" style="background-color: #48D1CC;color: white;">我的回答</a>
		</li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="ul02_01">
			<div class="div01">
					 <%
				//获取当前页码
				String currntPage = request.getParameter("pageIndex");
				if (currntPage == null)
					currntPage = "1";
				/*当前页面*/
				String sno="2016210001";
				int pageIndex = Integer.parseInt(currntPage);
				//获取成员记录总数量
				ReplyDaoImpl art=new ReplyDaoImpl();
				int totalCount = art.getTotalCount(sno);
				//每页显示记录数
				int pageSize = 5;
				/*获取总页数*/
				PageSupport pages = new PageSupport();
				pages.setCurrPageNo(pageIndex);
				pages.setPageSize(pageSize);
				pages.setRecordCount(totalCount);
				int totalPage=pages.getTotalPageCount();


				//控制首页和 末页
				if (pageIndex < 1)
					pageIndex = 1;
				else if (pageIndex > totalPage)
					pageIndex = totalPage;

				//每页显示的成员列表
				List<Reply> list = art.getPageIntroductionList(pageIndex,pageSize,sno);
				//request.setAttribute("introList", introList);
				//request.setAttribute("pageIndex", pageIndex);
				Iterator<Reply> iter = list.iterator();
   int i = 0;
   while(iter.hasNext()){
	   Reply arts = iter.next();
	   String str = null;
       if(arts.getRtext().length() > 100)
       	str = arts.getRtext().substring(0,100);
       else
       	str = arts.getRtext();
       QuestionServiceImpl que = new QuestionServiceImpl();
       Question ques = new Question();
       ques = que.getById(arts.getQno());
%>
<p id="p02">
	<a href="<%=request.getContextPath()%>/answer/all_answer.jsp?name=<%=arts.getQno()%>"><strong style="font-size:130%"><%=ques.getQtitle()%></strong></a>
	<form action="<%=request.getContextPath()%>/replyservlet?action=del&qno=<%=ques.getQno()%>&rno=<%=arts.getRno()%>"
				method="post"><input type="submit" style="float: right"value="删除"></form>		
</p>
<p id="p03"><%=str%></p>
<p id="p04"><%=arts.getRtime()%></p>

<hr width=100% size="5">
<%
        i++;
    }
%>

			
		<!--  	<input type="hidden" id="totalPage" value="<%=totalPage%>" />-->
		
	        
	       
	        <div class="roll_page">


<div >
<ul >
	共<%=totalCount%>条记录&nbsp;&nbsp; <%=pageIndex%>/<%=totalPage%>页&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="<%=pageIndex%>>1 }" >
				<a href="my_reply2.jsp?pageIndex=1">首页&nbsp;</a>
				<a href="my_reply2.jsp?pageIndex=<%=pageIndex-1%>">上一页&nbsp;</a>
	</c:if>
	<c:if test="<%=pageIndex%> < <%=totalPage%> }" >
				<a href="my_reply2.jsp?pageIndex=<%=pageIndex+1%>">下一页&nbsp;</a>
				<a href="my_reply2.jsp?pageIndex=<%=totalPage%>">最后一页</a>
	</c:if>


 <form href="my_reply2.jsp">
 <span >跳转至
    <input type="text" name="pageIndex" id="pageIndex" class="page-key" />页
    <input  type="submit" value="GO">
    </span>
    </form>
</ul>
</div> 
	</div>
</body>

</html>