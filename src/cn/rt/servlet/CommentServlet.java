package cn.rt.servlet;

import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.rt.entity.Comment;
import cn.rt.serviceimpl.CommentServiceImpl;

/**
 * Servlet implementation class commentservlet
 */
@WebServlet("/commentservlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		CommentServiceImpl csi = new CommentServiceImpl();
		
		String action = request.getParameter("action");
		System.out.println(action);
		switch(action) {
		case "sub":
			subCom(request,response,csi);
			break;
		case "del":
			delCom(request,response,csi);
			break;
		case "all":
			getAll(request,response,csi);
			break;
		}
	}
	
	private void getAll(HttpServletRequest request, HttpServletResponse response, CommentServiceImpl csi) {
		// TODO Auto-generated method stub
		String ano = request.getParameter("ano");
		List<Comment> list = new ArrayList<Comment>();
		list = csi.getAll("ano", ano);
		request.setAttribute("list", list);
	}

	protected void subCom(HttpServletRequest request, HttpServletResponse response, CommentServiceImpl csi) {
		HttpSession session = request.getSession();
		String sno = (String)(session.getAttribute("sno"));
		String ano = request.getParameter("ano");
		String ctext = request.getParameter("ctext");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ctime=df.format(new Date());
		List<Comment> list = new ArrayList<Comment>();
		list = csi.getAll("All", "ByDESC");
		String cno = String.valueOf(list.size());
		Comment com = new Comment();
		com.setCno(cno);
		com.setCtext(ctext);
		com.setCtime(ctime);
		com.setSno(sno);//模拟用户
		com.setAno(ano);
		List<String> info = new ArrayList<String>();
		try {
			int i = 0;
			i = csi.SubCom(com);
			if(i > 0) {
				info.add("评论发表成功!");
				request.getRequestDispatcher("/essay/essay_content.jsp?name="+ano).forward(request, response);
				
			}else {
				info.add("评论发表失败!");
				request.getRequestDispatcher("/essay/essay_content.jsp?name="+ano).forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	protected void delCom(HttpServletRequest request, HttpServletResponse response, CommentServiceImpl csi) {
		String cno = request.getParameter("cno");
		String ano = request.getParameter("ano");
		int i = 0;
		i = csi.delCom(ano, cno);
		try {
			if(i > 0)
			{
				request.getRequestDispatcher("/myspace/my_comment.jsp").forward(request,response);
			   
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
