package cn.rt.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.rt.entity.Article;
import cn.rt.entity.Question;
import cn.rt.service.ArticleService;
import cn.rt.service.QuestionService;
import cn.rt.serviceimpl.ArticleServiceImpl;
import cn.rt.serviceimpl.QuestionServiceImpl;


@SuppressWarnings("serial")
@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {
	
    
    public ArticleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getParameter("action");
		ArticleService artService=new ArticleServiceImpl();
		QuestionService questionService=new QuestionServiceImpl();
		switch(action)
		{
		case "getAll":
			getAll(request,response,artService);//获取全部信息
			break;
		case "searchContext":
			searchContext(request,response,artService,questionService);//根据搜索框搜索
			break;
		case "read":
			readArticle(request,response,artService);//浏览文章
			break;
		case "publishArticle"://发布文章
			try {
				publishArticle(request,response,artService);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "deleteArticle"://删除文章
			deleteArticle(request,response,artService);
			break;
		case "getByTitle"://根据标题获取文章
			getByTitle(request,response,artService);
			break;
		case "getBySearch"://根据提示获取文章
			getBySearch(request,response,artService);
		}
	}

	private void getBySearch(HttpServletRequest request, HttpServletResponse response, ArticleService artService) {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		List<Article> list = new ArrayList<Article>();
		list = artService.getAll("atitle", search);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/essay/other_essay.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getByTitle(HttpServletRequest request, HttpServletResponse response, ArticleService artService) {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		List<Article> list = new ArrayList<Article>();
		switch(type){
		case "BigData":
			list = artService.getAll("atype", "辅修");
			break;
		case "Computer":
			list = artService.getAll("atype", "专业");
			break;
		case "Math":
			list = artService.getAll("atype", "留学");
			break;
		case "Economy":
			list = artService.getAll("atype", "考研");
			break;
		case "Psychology":
			list = artService.getAll("atype", "就业");
			break;
			default:
				list=artService.getAll("atype", "其他");
				break;
		}
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/essay/other_essay.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void searchContext(HttpServletRequest request, HttpServletResponse response, ArticleService artService,QuestionService questionService) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String text=request.getParameter("getText");
		String atitle="atitle";
		String qtitle="qtitle";
		List<Article> arts=artService.getAll(atitle, text);
		List<Question> questions=questionService.getAll(qtitle,text);
		request.setAttribute("arts", arts);
		request.setAttribute("questions", questions);
		request.getRequestDispatcher("/homepage/afterSearch.jsp").forward(request, response);
		
		
	}

	private void getAll(HttpServletRequest request, HttpServletResponse response, ArticleService artService) throws ServletException, IOException {
		String name=request.getParameter("name");
		String value=request.getParameter("value");
		List<Article> art=artService.getAll(name, value);
	
		request.setAttribute("art", art);
		if(value.equals("专业"))   
		{
			request.getRequestDispatcher("/homepage/cs.jsp").forward(request, response);
		}
		else if (value.equals("辅修"))
		{
			request.getRequestDispatcher("/homepage/big_data.jsp").forward(request, response);
		}
		else if (value.equals("留学"))
		{
			request.getRequestDispatcher("/homepage/math.jsp").forward(request, response);
		}
		else if (value.equals("考研"))
		{
			request.getRequestDispatcher("/homepage/economy.jsp").forward(request, response);
		}
		else if (value.equals("就业"))
		{
			request.getRequestDispatcher("/homepage/psychology.jsp").forward(request, response);
		}
		else if (value.equals("其他"))
		{
			request.getRequestDispatcher("/homepage/other.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/myspace/my_article.jsp").forward(request, response);
		}
	}

	/*ɾ�����²���*/
	private void deleteArticle(HttpServletRequest request, HttpServletResponse response, ArticleService artService) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String value=request.getParameter("value");
		artService.deleteArticle(name,value);
		request.getRequestDispatcher("/myspace/my_article.jsp").forward(request, response);
	}
	
	private void publishArticle(HttpServletRequest request, HttpServletResponse response,
			ArticleService artService) throws Exception {
		
		String atitle=request.getParameter("atitle");
		String atype=request.getParameter("atype");
		String atext=request.getParameter("atext");
		String sno = request.getParameter("sno");  //�û���
		String ano = null;   //���±��
		ArticleService articleService=new ArticleServiceImpl();
		List<Article> articles=articleService.getAll("All","ByASC");//��ȡ�������±��
		@SuppressWarnings("unused")
		String count;
		for(Article art1 : articles)
		{
			ano=art1.getAno();
	
		}
		int num;
		num=Integer.valueOf(ano);
		num++;
		ano=String.valueOf(num);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String atime=df.format(new Date());
		Article art=new Article(ano,atitle,atype,atext,atime,sno);
		artService.publishArticle(art);
		request.getRequestDispatcher("/essay/all_essay.jsp").forward(request, response);
	}
	
	private void readArticle(HttpServletRequest request, HttpServletResponse response, ArticleService artService) {
		// TODO Auto-generated method stub
		
	}

}
