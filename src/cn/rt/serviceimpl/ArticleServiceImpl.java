package cn.rt.serviceimpl;

import java.util.List;


import cn.rt.dao.ArticleDao;
import cn.rt.daoimpl.ArticleDaoImpl;
import cn.rt.entity.Article;
import cn.rt.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {

	private ArticleDao article=new ArticleDaoImpl();
	public ArticleServiceImpl() {
		
	}

	public List<Article> read(String content) {
		
		// TODO Auto-generated method stub
		return null;
	}
	public Article getById(String ano) {
		// TODO Auto-generated method stub
		return article.getById(ano);
	}

	

	public List<Article> getAll(String name,String value)
	{
		return article.getAll(name, value);
	}

	public void publishArticle(Article art)throws Exception {
		  article.publishArticle(art);
		// TODO Auto-generated method stub
		
	}

	public void deleteArticle(String name,String value) {
		// TODO Auto-generated method stub
		article.deleteArticle(name,value);
		
	}
	@Override
	public int getTotalCount(String sno) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<Article> getPageIntroductionList(int currPage, int num, String sno) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
