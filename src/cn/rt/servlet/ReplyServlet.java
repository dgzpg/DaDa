package cn.rt.servlet;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.rt.entity.Reply;
import cn.rt.serviceimpl.ReplyServiceImpl;
/**
 * Servlet implementation class upd_info_servlet
 */
@WebServlet("/replyservlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		ReplyServiceImpl rep = new ReplyServiceImpl();
		String action = request.getParameter("action");
		switch(action) {
		case "toadd":
			addRep(request,response,rep);
			break;
		case "del":
			delRep(request,response,rep);
			break;
		}
	}
	
	protected void addRep(HttpServletRequest request, HttpServletResponse response, ReplyServiceImpl rep) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("qno");  
		String rtext = request.getParameter("rtext"); 
		String sno = (String)(session.getAttribute("sno"));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String rtime=df.format(new Date());   
		String rno = null; 
	
		List<Reply> replys=rep.getAll("All","ByASC");
		for(Reply rep1: replys)
		{
			rno=rep1.getRno();
	
		}
		int num;
		num=Integer.valueOf(rno);
		num++;
		rno=String.valueOf(num);
		Reply repley=new Reply(rno,rtext,rtime,sno,name);
		rep.add(repley);
		request.getRequestDispatcher("/question/question_content.jsp?name="+name).forward(request, response);
	}
	
	protected void delRep(HttpServletRequest request, HttpServletResponse response, ReplyServiceImpl rep) {
		HttpSession session = request.getSession();
		String sno =(String)session.getAttribute("sno");
		String rno = request.getParameter("rno");
		String qno = request.getParameter("qno");
		int i = 0;
		i = rep.delete(sno, qno, rno); 
		try {
			if(i > 0)
			    request.getRequestDispatcher("/myspace/my_reply.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		   
}
