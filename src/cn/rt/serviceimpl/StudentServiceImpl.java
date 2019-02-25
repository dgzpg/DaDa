package cn.rt.serviceimpl;

import java.util.List;


import cn.rt.dao.StudentDao;
import cn.rt.daoimpl.StudentDaoImpl;
import cn.rt.entity.Student;
import cn.rt.service.StudentService;

public class StudentServiceImpl implements StudentService{
	
	private StudentDao studao=new StudentDaoImpl();

	public int add(Student stu) {
		return studao.add(stu);
	}

	@Override
	public int update(Student stu) {
		return studao.update(stu);
	}

	@Override
	public int delete(Student stu) {
		return studao.delete(stu);
	}

	@Override
	public List<Student> getAll(String name, String value) {
		return studao.getAll(name, value);
	}

	@Override
	public Student getById(String sno) {
		// TODO Auto-generated method stub
		return studao.getById(sno);
	}

}
