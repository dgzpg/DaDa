package cn.rt.daoimpl;

import java.util.List;

import cn.rt.dao.CommentDao;
import cn.rt.entity.Comment;
import cn.rt.util.jdbc;

public class CommentDaoImpl implements CommentDao{

	/**
	 * 
	 * @author 滕宇
	 * 
	 */
	
	public CommentDaoImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int SubCom(Comment com) {
		// TODO Auto-generated method stub
		String sql = "insert into comment(cno,ctext,ctime,sno,ano) values(?,?,?,?,?)";
		return jdbc.executeSQL(sql, com.getCno(),com.getCtext(),com.getCtime(),com.getSno(),com.getAno());
	}


	@SuppressWarnings("unchecked")
	@Override
    public List<Comment> getAll(String name,String value) {
		
		String sql = null;
		if(name.equals("All")&&value.equals("ByASC"))
		{
			sql="SELECT * FROM comment ORDER BY CAST(cno AS DECIMAL); ";
		}
		else if(name.equals("All")&&value.equals(""))
		{
			sql="select * from comment ";
		}
		else if(name.equals("All")&&value.equals("ByDESC")) {
			sql="SELECT * FROM comment ORDER BY CAST(ctime AS DECIMAL) desc; ";
		}
		else {
			sql="select * from comment where "+name+"='"+value+"'";
		}

		return jdbc.getList(Comment.class, sql);
	}
	
	
	
	

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		String sql = "select *from comment";
		return jdbc.getListcount(sql);
	}
	
	
	
	@SuppressWarnings("unchecked")
	public List<Comment> getPageIntroductionList(int currPage,int num,String sno) {
		int a,b;
		String c,d;
		String sql=null;
		a=(currPage-1)*num;
		c=String.valueOf(a);
		b=currPage*num;
		d=String.valueOf(b);
		if(sno==null)
		{
			sql="select * from comment  ORDER BY CAST(cno AS DECIMAL) DESC limit "+c+","+d;
		}
		else {
			 sql= "SELECT * FROM comment WHERE sno="+sno+" ORDER BY CAST(cno AS DECIMAL) DESC LIMIT "+c+","+d;
		}
		System.out.println(sql);
		
		return jdbc.getList(Comment.class, sql);
	}

	public int getTotalCount(String sno) {
		String sql=null;
		if(sno==null)
		sql="select * from comment";
		else
			sql="select * from comment where sno="+sno;
		
		return jdbc.getListcount(sql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getByUser(String sno) {
		// TODO Auto-generated method stub
		String sql = "select *from comment where sno = '"+sno+"'";
		return jdbc.getList(Comment.class, sql);
	}

	@Override
	public int delCom(String ano, String cno) {
		String sql = "delete from comment where ano=? and cno=?";
		// TODO Auto-generated method stub
		return jdbc.executeSQL(sql, ano,cno);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getAllDesc(String ano, String name, String value) {
		// TODO Auto-generated method stub
		String sql = null;
		if(name.equals("All") && value.equals(""))
		    sql = "select *from comment where ano='"+ano+"'ORDER BY CAST(ctime AS DECIMAL) desc;";
		return jdbc.getList(Comment.class, sql);
	}


}
