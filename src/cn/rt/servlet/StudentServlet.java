package cn.rt.servlet;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.rt.entity.Student;
import cn.rt.serviceimpl.StudentServiceImpl;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
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
		StudentServiceImpl ssi = new StudentServiceImpl();
		
		String action = request.getParameter("action");
		switch(action) {
		case "login":
			stuLog(request,response,ssi);
			break;
		case "update":
			stuUpd(request,response,ssi);
			break;
		case "toaddstu": 
			toaddstu(request, response, ssi);
			
			break;
		}
	}
	
	private void toaddstu(HttpServletRequest request, HttpServletResponse response, StudentServiceImpl ssi) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		 String sno= request.getParameter("sno");
		 Student stu=new Student();
		 stu=ssi.getById(sno);
		 if(stu!=null)
		 {
			  request.getRequestDispatcher("/login_register/register2.jsp").forward(request, response);
		 }
		 else {
		   String sname = request.getParameter("sname");
		   String spassword= request.getParameter("spassword");
		   String rpsw= request.getParameter("rpsw");
		   String sinfo="暂无介绍！";
		   
		   //进行三种判断
		  if(sno==null||sno.trim().isEmpty()){
				request.setAttribute("msg", "帐号不能为空");
				request.getRequestDispatcher("/login_register/register.jsp").forward(request, response);
			
			}
			if(spassword==null||spassword.trim().isEmpty()){
				request.setAttribute("msg", "密码不能为空");
				request.getRequestDispatcher("/login_register/register.jsp").forward(request, response);
			
			}
			if(!spassword.equals(rpsw)){
				request.setAttribute("msg", "两次输入的密码不同");
				request.getRequestDispatcher("/login_register/register.jsp").forward(request, response);
			
			}
		
			Student stu2=new Student(sno,sname,spassword,sinfo);
			//System.out.println();
		   ssi.add(stu2);
		   // 转发到页面
		   request.getRequestDispatcher("/login_register/login.jsp").forward(request, response);
		 }
	}

	protected void stuLog(HttpServletRequest request, HttpServletResponse response, StudentServiceImpl ssi) {
		String sno = request.getParameter("sno");
		String spassword = request.getParameter("spassword");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setSpassword(spassword);
		List<Student> s = new ArrayList<Student>();
		try {
			StudentServiceImpl stuimpl = new StudentServiceImpl();
			s = stuimpl.getAll("", sno);
			if(s == null||s.size()==0) {
				request.getRequestDispatcher("/login_register/login2.jsp").forward(request,response);
			}
			if(s.get(0).getSpassword().equals(spassword) && !s.isEmpty()) {
					String sname = s.get(0).getSname();
					HttpSession session=request.getSession();
					session.setAttribute("sname", sname);
					session.setAttribute("sno", sno);
					session.setAttribute("spassword", spassword);
					request.getRequestDispatcher("/homepage/login_homepage.jsp").forward(request, response);
				}
			else {
					request.getRequestDispatcher("/login_register/login2.jsp").forward(request,response);
				}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void stuUpd(HttpServletRequest request, HttpServletResponse response, StudentServiceImpl ssi) {
		HttpSession session = request.getSession();
		String sno = (String)session.getAttribute("sno");
		String sname = request.getParameter("sname");
		String sinfo = request.getParameter("sinfo");
		Student stu = new Student();
		stu.setSno(sno);
		stu.setSname(sname);
		stu.setSinfo(sinfo);
		session.setAttribute("sname", sname);
		List<String> info = new ArrayList<String>();
		try {
			StudentServiceImpl stuimp = new StudentServiceImpl();
			int i = 0;
			i = stuimp.update(stu);
			if(i == 0) {
			
				request.setAttribute("info", info);
				request.getRequestDispatcher("/myspace/my_info.jsp").forward(request, response);
			}else {
				
				request.getRequestDispatcher("/myspace/my_info.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
