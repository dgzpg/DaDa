package cn.rt.dao;

import java.util.List;

import cn.rt.entity.Comment;

public interface CommentDao {
	/**
	 * @author 滕宇
	 */


	/**
	 * @param com
	 * 发表评论
	 */
	int SubCom( Comment com );


	/**
	 *
	 * @param name
	 * @param ano
	 * 根据文章编号获取全部评论
	 */
	List<Comment>getAll( String name, String ano );


	/**
	 *
	 * 获取记录总数
	 */
	int getListCount();


	/**
	 *
	 **@param sno
	 * 根据学号获取用户评论条数
	 *
	 */
	int getTotalCount( String sno );


	/**
	 *
	 * @param currPage
	 * @param num
	 * @param sno
	 * 分页读取数据
	 */
	List<Comment> getPageIntroductionList( int currPage, int num, String sno );


	/**
	 *
	 * @param ano
	 * @param name
	 * @param value
	 * 降序读取数据
	 */
	List<Comment> getAllDesc( String ano, String name, String value );


	/**
	 *
	 * @param sno
	 * 根据用户信息读书全部数据
	 */
	List<Comment>getByUser( String sno );


	/**
	 *
	 *
	 * @param ano
	 * @param cno
	 *删除评论
	 */
	int delCom( String ano, String cno );
}
