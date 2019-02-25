package cn.rt.dao;

import java.util.List;
import cn.rt.entity.Reply;

public interface ReplyDao {
     /**
      * @author 秦博
      * 
      */
	
	/**
	 * 
	 * @param rep
	 * 回复问题
	 */
	public int add(Reply rep);
	
	/**
	 * 
	 * @param qno
	 * 根据问题编号获取回复信息
	 */
	public Reply getById(String qno);
	
	/**
	 * 
	 * @param name
	 * @param value
	 * 进行问题回复的相关查询
	 */
	public List<Reply> getAll(String name,String value);
	
	/**
	 * 
	 * @param qno
	 * 根据问题编号获取元组
	 */
	public List<Reply> getall(String name, String qno);
	
	/**
	 * 
	 * @param sno
	 * @param qno
	 * @param rno
	 * 删除回复的相关信息
	 */
	public int delete(String sno, String qno, String rno);
	
	public List<Reply> getByUser(String sno);
	
	List<Reply> getAllDesc(String ano, String name, String value);
	
	/**
	 * 
	 * @param sno
	 * 获取某个用户的总评论数
	 */
    int getTotalCount(String sno) ;
	
    /**
	 * 
	 * 分页读取数据
	 */
	List<Reply> getPageIntroductionList(int currPage, int num,String sno);
}
