package cn.rt.serviceimpl;

import java.util.List;


import cn.rt.dao.CommentDao;
import cn.rt.daoimpl.CommentDaoImpl;
import cn.rt.entity.Comment;
import cn.rt.service.CommentService;

public class CommentServiceImpl implements CommentService {

	
	private CommentDao cmdao = new CommentDaoImpl(); 
	public CommentServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int SubCom(Comment com) {
		// TODO Auto-generated method stub
		return cmdao.SubCom(com);
	}

	@Override
	public List<Comment> getAll(String name, String ano) {
		// TODO Auto-generated method stub
		return cmdao.getAll(name, ano);
	}
	
	public int getListCount() {
		return cmdao.getListCount();
	}


	@Override
	public List<Comment> getByUser(String sno) {
		// TODO Auto-generated method stub
		return cmdao.getByUser(sno);
	}

	@Override
	public int delCom(String ano, String cno) {
		// TODO Auto-generated method stub
		return cmdao.delCom(ano, cno);
	}

	@Override
	public List<Comment> getAllDesc(String ano, String name, String value) {
		// TODO Auto-generated method stub
		return cmdao.getAllDesc(ano, name, value);
	}

	@Override
	public int getTotalCount(String sno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Comment> getPageIntroductionList(int currPage, int num, String sno) {
		// TODO Auto-generated method stub
		return null;
	}

}
