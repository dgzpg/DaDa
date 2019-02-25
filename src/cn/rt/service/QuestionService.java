package cn.rt.service;

import java.util.List;

import cn.rt.entity.Question;

public interface QuestionService {

	/**
	 * @author 秦博
	 * 
	 */
	
	
	/**
	 * 
	 * @param ques
	 * 提出问题
	 * 
	 */
	public int add(Question ques);
	 
	/**
	 * 
	 * @param qno
	 * 根据问题编号获取完整问题信息
	 */
	public Question getById(String qno);
	
	/**
	 * 
	 * @param name
	 * @param value
	 * 获取全部问题
	 */
	public List<Question> getAll(String name, String value);
	
	/**
	 *
	 * @param name
	 * @param value
	 * 删除问题
	 */
	public int delete(String name, String value);
	
	/**
	 * 
	 * 获取全部问题
	 * 
	 */
	public List<Question> getAll();
	
	/**
	 * 
	 * @param sno
	 * 根据学号获取记录条数
	 */
   int getTotalCount(String sno) ;
	
	/**
	 * 
	 * @param currPage
	 * @param num
	 * @param sno
	 * 分页读取数据
	 */
	List<Question> getPageIntroductionList(int currPage, int num,String sno);
}
