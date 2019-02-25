package cn.rt.daoimpl;

import java.util.List;



import cn.rt.dao.ArticleDao;
import cn.rt.entity.Article;
import cn.rt.util.jdbc;

public  class ArticleDaoImpl implements ArticleDao {

	public ArticleDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public void Read(String ano) {
		// TODO Auto-generated method stub
		
	}

	public Article getById(String ano) {
		// TODO Auto-generated method stub
		String sql = "select * from article where ano = ?";
		return (Article) jdbc.getObjectById(Article.class, sql, ano);
	}
	
	
	
		@SuppressWarnings("unchecked")
		public List<Article> getPageIntroductionList(int currPage,int num,String sno) {
			int a,b;
			String c,d;
			String sql=null;
			a=(currPage-1)*num;
			c=String.valueOf(a);
			b=currPage*num;
			d=String.valueOf(b);
			if(sno==null)
			{
				 sql="select * from article  ORDER BY CAST(ano AS DECIMAL) DESC limit "+c+","+d;
			}
			else {
				 sql= "SELECT * FROM article WHERE sno="+sno+" ORDER BY CAST(ano AS DECIMAL) DESC LIMIT "+c+","+d;
			}
			
			return jdbc.getList(Article.class, sql);
		}

	
	
	
		public int getTotalCount(String sno) {
			String sql=null;
			if(sno==null)
			sql="select * from article";
			else
				sql="select * from article where sno="+sno;
			
			return jdbc.getListcount(sql);
		}

	

	@SuppressWarnings("unchecked")
	public List<Article> getAll(String name,String value) {
		
		String sql = null;
		if(name.equals("All")&&value.equals("ByASC"))
		{
			sql="SELECT * FROM article ORDER BY CAST(ano AS DECIMAL) asc; ";
		}
		else if (name.equals("All")&&value.equals("ByDESC"))
		{
			sql="SELECT * FROM article ORDER BY CAST(ano AS DECIMAL) desc; ";
		}
		else if(name.equals("All")&&value.equals("All"))
		{
			sql="select * from article ";
		}
		else  if(name.equals("atitle"))
		{
			sql="select * from article where atitle like '%"+value+"%'ORDER BY CAST(ano AS DECIMAL) desc";
		}
		else if(name.equals("atype"))
		{
			sql="SELECT * FROM article where atype='"+value+"' ORDER BY CAST(ano AS DECIMAL) desc; ";		
		}
		else {
			sql="select * from article where "+name+"='"+value+"'";
		}
		//return null;
		return jdbc.getList(Article.class, sql);
		}

	public void publishArticle(Article art) throws Exception {
		// TODO Auto-generated method stub
		String sql="insert into article(ano,atitle,atype,atext,atime,sno) values(?,?,?,?,?,?)";
		jdbc.executeSQL(sql,art.getAno(),art.getAtitle(),art.getAtype(),art.getAtext(),art.getAtime(),art.getSno());
		
	}

	public void deleteArticle(String name,String value) {
		// TODO Auto-generated method stub
		String sql="delete from article where ano=?";
		jdbc.executeSQL(sql, value);
		
	}

	public List<Article> read(String content) {
		// TODO Auto-generated method stub
		return null;
	}


}
