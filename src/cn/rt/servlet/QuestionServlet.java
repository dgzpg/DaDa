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
import javax.servlet.http.HttpSession;

import cn.rt.entity.Question;
import cn.rt.service.QuestionService;
import cn.rt.serviceimpl.QuestionServiceImpl;


@SuppressWarnings("serial")
@WebServlet("/questionservlet")
public class QuestionServlet extends HttpServlet {
	
    
    public QuestionServlet() {
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
		/*鑾峰彇瑕佹墽琛岀殑鎿嶄綔*/
		String action=request.getParameter("action");
		QuestionService quesService=new QuestionServiceImpl();
	
		switch(action)
		{
		case "getAll":
			getAll(request,response,quesService);
			break;
		case "read":
			readQuestion(request,response,quesService);
			break;
		case "publishQuestion":
			try {
				publishQuestion(request,response,quesService);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "deleteQuestion":
			deleteQuestion(request,response,quesService);
			break;
		case "getByTitle":
			getByTitle(request,response,quesService);
			break;
		case "getBySearch":
			getBySearch(request,response,quesService);
			break;
		}
	}
	
	private void getBySearch(HttpServletRequest request, HttpServletResponse response, QuestionService quesService) {
		// TODO Auto-generated method stub
		String search = request.getParameter("search");
		List<Question> list = new ArrayList<Question>();
		list = quesService.getAll("qtitle", search);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/question/other_question.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getByTitle(HttpServletRequest request, HttpServletResponse response, QuestionService quesService) {
		// TODO Auto-generated method stub
		String type = request.getParameter("type");
		List<Question> list = new ArrayList<Question>();
		switch(type){
		case "BigData":
			list = quesService.getAll("atype", "辅修");
			break;
		case "Computer":
			list = quesService.getAll("atype", "专业");
			break;
		case "Math":
			list = quesService.getAll("atype", "留学");
			break;
		case "Economy":
			list = quesService.getAll("atype", "考研");
			break;
		case "Psychology":
			list = quesService.getAll("atype", "就业");
			break;
		default:
			list=quesService.getAll("atype", "其他");
			break;
		}
		
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("/question/question_content.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getAll(HttpServletRequest request, HttpServletResponse response, QuestionService quesService) throws ServletException, IOException {
		String name=request.getParameter("name");
		String value=request.getParameter("value");
		List<Question> ques=quesService.getAll(name, value);
	
		request.setAttribute("ques", ques);
		if(value.equals("专业"))
		{
			request.getRequestDispatcher("/homepage/cs.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/myspace/my_info.jsp").forward(request, response);
		}
	}

	
	
	private void publishQuestion(HttpServletRequest request, HttpServletResponse response,
			QuestionService quesService) throws Exception {
		
		String qtitle=request.getParameter("qtitle");
		String qtype=request.getParameter("qtype");
		String qtext=request.getParameter("qtext");
		String qno = null; 
		QuestionService questionService=new QuestionServiceImpl();
		List<Question> questions=questionService.getAll("All","ByASC");
		int  anos=1;
		int count=1;
		int num;
		for(Question que1 : questions)
		{
			num=Integer.valueOf(que1.getQno());
			if(anos==num)
			{
				anos++;
			}
			else {
				qno=String.valueOf(anos);
				break;
			}
			count++;
		}
		if(anos==count)
		{
			qno=String.valueOf(anos);
		}
		HttpSession session = request.getSession();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String qtime=df.format(new Date());
		String sno=(String) session.getAttribute("sno");
		Question ques=new Question(qno,qtitle,qtype,qtext,qtime,sno);
		quesService.add(ques);
		   request.getRequestDispatcher("/question/all_question.jsp").forward(request, response);
	}
	
	
	private void deleteQuestion(HttpServletRequest request, HttpServletResponse response, QuestionService quesService) throws ServletException, IOException {
		
		String name=request.getParameter("name");
		String value=request.getParameter("value");
		quesService.delete(name,value);
		request.getRequestDispatcher("/myspace/my_question.jsp").forward(request, response);
	}
	
	private void readQuestion(HttpServletRequest request, HttpServletResponse response, QuestionService quesService) {
		// TODO Auto-generated method stub
		
	}

}
