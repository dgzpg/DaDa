package cn.rt.serviceimpl;

import java.util.List;


import cn.rt.dao.ReplyDao;
import cn.rt.daoimpl.ReplyDaoImpl;
import cn.rt.entity.Reply;
import cn.rt.service.ReplyService;

public class ReplyServiceImpl implements ReplyService{
      private ReplyDao repdao = new ReplyDaoImpl();
      
      
      public int add(Reply rep)
      {
    	  return repdao.add(rep);
      }
      
      public List<Reply> getall(String name, String qno)
      {
    	  return repdao.getall(name, qno);
      }
      
      public Reply getById(String qno) {
    	  return repdao.getById(qno);
      }
      public List<Reply> getAll(String name,String value)
  	  {
  		  return repdao.getAll(name, value);
  	  }
      
      
      public int delete(String sno, String qno, String rno)
      {
    	  return repdao.delete(sno,qno,rno);
      }
      
      public List<Reply> getByUser(String sno)
      {
    	  return repdao.getByUser(sno);
      }

	@Override
	public List<Reply> getAllDesc(String ano, String name, String value) {
		// TODO Auto-generated method stub
		return repdao.getAllDesc(ano, name, value);
	}

	@Override
	public int getTotalCount(String sno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Reply> getPageIntroductionList(int currPage, int num, String sno) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
