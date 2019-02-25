package cn.rt.daoimpl;

import java.util.List;
import cn.rt.dao.QuestionDao;
import cn.rt.entity.Question;
import cn.rt.util.jdbc;

public class QuestionDaoImpl implements QuestionDao {

	
	
	public int add(Question ques) {
		String sql="insert into question(qno,qtitle,qtype,qtext,qtime,sno) values(?,?,?,?,?,?)";
		return jdbc.executeSQL(sql, ques.getQno(), ques.getQtitle(),ques.getQtype(),ques.getQtext(), ques.getQtime(), ques.getSno());
	}
	
@SuppressWarnings("unchecked")
public List<Question> getAll(String name,String value) {
		
		String sql;
		if(name.equals("All")&&value.equals("ByASC"))
		{
			sql="SELECT * FROM question ORDER BY CAST(qno AS DECIMAL); ";
		}
		else if(name.equals("All")&&name.equals("All"))
		{
			sql="select * from question ";
		}
		else if(name.equals("qtitle")) {
			sql="select * from question where qtitle like '%"+value+"%'ORDER BY CAST(qno AS DECIMAL) desc;";
		}
		else if (name.equals("All")&&value.equals("ByDESC"))
		{
			sql="SELECT * FROM question ORDER BY CAST(qno AS DECIMAL) desc; ";
		}
		else  
		{
			sql="select * from question where "+name+"="+value;
		}
		return jdbc.getList(Question.class, sql);
		}

public Question getById(String qno)
{
	String sql = "select * from question where qno=?";
	return (Question) jdbc.getObjectById(Question.class, sql, qno);
}

	// 鍒犻櫎闂淇℃伅
	public int delete(String name, String value) {
		String sql = "delete from question where qno = ?";
		return jdbc.executeSQL(sql, value);
	}

	@SuppressWarnings("unchecked")
	public List<Question> getAll() {
		// TODO Auto-generated method stub
		String sql = "select * from question";
		return jdbc.getList(Question.class, sql);
	}

	@Override

	public int getTotalCount(String sno) {
		String sql=null;
		if(sno==null)
		sql="select * from question";
		else
			sql="select * from question where sno="+sno;
		
		return jdbc.getListcount(sql);
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Question> getPageIntroductionList(int currPage,int num,String sno) {
		int a,b;
		String c,d;
		String sql=null;
		a=(currPage-1)*num;
		c=String.valueOf(a);
		b=(currPage)*num;
		d=String.valueOf(b);
		if(sno==null && b >0)
		{
			 sql="select * from question ORDER BY CAST(qno AS DECIMAL) DESC limit "+c+","+d;
		}
		else if(sno !=null && b > 0){
			 sql= "SELECT * FROM question WHERE sno="+sno+" ORDER BY CAST(qno AS DECIMAL) DESC LIMIT "+c+","+d;
		}
		return jdbc.getList(Question.class, sql);
	}
	
}
