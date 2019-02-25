package cn.rt.service;


import java.util.List;


import cn.rt.entity.Article;

public interface ArticleService {
	/**
	 * @author 彭广
	 *
	 */
	
	List<Article> read( String content );


	/**
	 *
	 * @param name
	 * @param value
	 * @return 获取全部文章信息
	 */
	public List<Article> getAll( String name, String value );


	/**
	 *
	 * @param art
	 * @throws Exception
	 * 发表文章
	 */
	void publishArticle( Article art ) throws Exception;


	/**
	 *
	 * @param name
	 * @param value
	 * 删除文章
	 */
	void deleteArticle( String name, String value );


	/**
	 *
	 * @param ano
	 * 根据文章编号获取文章
	 */
	Article getById( String ano );


	/**
	 *
	 * @param sno
	 * 获取记录总数
	 */
	int getTotalCount( String sno );


	/**
	 *
	 * @param currPage
	 * @param num
	 * @param sno
	 * 分页读取信息
	 */
	List<Article> getPageIntroductionList( int currPage, int num, String sno );
}
