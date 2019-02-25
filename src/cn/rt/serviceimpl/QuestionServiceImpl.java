package cn.rt.serviceimpl;

import java.util.List;


import cn.rt.dao.QuestionDao;
import cn.rt.daoimpl.QuestionDaoImpl;
import cn.rt.entity.Question;
import cn.rt.service.QuestionService;

public class QuestionServiceImpl implements QuestionService{
	private QuestionDao quesdao=new QuestionDaoImpl();
	
	
	public int add(Question ques)
	{
		return quesdao.add(ques);
	}
	
	public Question getById(String qno)
	{
		return quesdao.getById(qno);
	}
	public List<Question> getAll(String name,String value)
	{
		return quesdao.getAll(name, value);
	}
	
	
	public int delete(String name, String value)
	{
		return quesdao.delete(name,value);
	}
	
	
	public List<Question> getAll()
	{
		return quesdao.getAll();
	}

	@Override
	public int getTotalCount(String sno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Question> getPageIntroductionList(int currPage, int num, String sno) {
		// TODO Auto-generated method stub
		return null;
	}

	
	

}
