package cn.rt.daoimpl;

import java.util.List;


import cn.rt.dao.ReplyDao;
import cn.rt.entity.Question;
import cn.rt.entity.Reply;
import cn.rt.util.jdbc;

public class ReplyDaoImpl implements ReplyDao{

		public int add(Reply rep) {
			String sql="insert into Reply(rno,rtext,rtime,sno,qno) values(?,?,?,?,?)";
			return jdbc.executeSQL(sql, rep.getRno(),rep.getRtext(),rep.getRtime(),rep.getSno(),rep.getQno());
		}
		
		
		@SuppressWarnings("unchecked")
		public List<Reply> getall(String name, String qno) {
			// TODO Auto-generated method stub
			String sql = "select *from reply where qno = '"+qno+"'";
			
			return jdbc.getList(Reply.class, sql);
		}

		@SuppressWarnings("unchecked")
		public List<Reply> getAll(String name,String value) {
			
			String sql;

			if(name.equals("All")&&value.equals("ByASC"))
			{
				sql="SELECT * FROM reply ORDER BY CAST(rno AS DECIMAL); ";
			}

			else if(name.equals("All")&&name.equals("All"))
			{
				sql="select * from reply ";
			}

			else if (name.equals("All")&&value.equals("ByDESC"))
			{
				sql="SELECT * FROM reply ORDER BY CAST(rno AS DECIMAL) desc; ";
			}
			else  
			{
				sql="select * from reply where "+name+"="+value;
			}
			return jdbc.getList(Reply.class, sql);
			}
		
		public Reply getById(String qno)
		{
			String sql = "select * from reply where qno=?";
			return (Reply) jdbc.getObjectById(Question.class, sql, qno);
		}

		public int delete(String sno, String qno, String rno)
		{
			String sql="delete from Reply where sno=? and qno=? and rno=?";
			// TODO Auto-generated method stub
			return jdbc.executeSQL(sql, sno,qno,rno);
		}
		
		@SuppressWarnings("unchecked")
		public List<Reply> getByUser(String sno) {
			// TODO Auto-generated method stub
			String sql = "select *from reply where sno = '"+sno+"'";
			return jdbc.getList(Reply.class, sql);
		}
		
		
		@SuppressWarnings("unchecked")
		@Override
		public List<Reply> getAllDesc(String ano, String name, String value) {
			// TODO Auto-generated method stub
			String sql = null;
			if(name.equals("All") && value.equals(""))
			    sql = "select *from reply where qno='"+ano+"'ORDER BY CAST(rno AS DECIMAL) desc;";
			return jdbc.getList(Reply.class, sql);
		}
		
		
		@Override
		public int getTotalCount(String sno) {
			String sql=null;
			if(sno==null)
			sql="select * from reply";
			else
				sql="select * from reply where sno="+sno;
			
			return jdbc.getListcount(sql);
		}
		
		
		@SuppressWarnings("unchecked")
		public List<Reply> getPageIntroductionList(int currPage,int num,String sno) {
			int a,b;
			String c,d;
			String sql=null;
			a=(currPage-1)*num;
			c=String.valueOf(a);
			b=currPage*num;
			d=String.valueOf(b);
			if(sno==null)
			{
				sql="select * from reply  ORDER BY CAST(rno AS DECIMAL) DESC limit "+c+","+d;
			}
			else {
				 sql= "SELECT * FROM reply WHERE sno="+sno+" ORDER BY CAST(rno AS DECIMAL) DESC LIMIT "+c+","+d;
			}
			
			return jdbc.getList(Reply.class, sql);
		}

}
