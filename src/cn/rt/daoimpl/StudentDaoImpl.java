package cn.rt.daoimpl;

import java.util.List;


import cn.rt.dao.StudentDao;
import cn.rt.entity.Student;
import cn.rt.util.jdbc;

public class StudentDaoImpl  implements StudentDao {

	
	public int add(Student stu) {
		String sql="insert into student(sno,sname,spassword,sinfo) values(?,?,?,?)";
		return jdbc.executeSQL(sql, stu.getSno(),stu.getSname(),stu.getSpassword(),stu.getSinfo());
	}
	
	
	public int delete(Student stu) {
		String sql = "delete from  student where Sno=?";
		return jdbc.executeSQL(sql, stu.getSno(),stu.getSname(),stu.getSpassword());
	}

	
	public int update(Student stu) {
		String sql="update student set sname=?,sinfo=? where sno = "+stu.getSno();
		return jdbc.executeSQL(sql, stu.getSname(),stu.getSinfo());
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Student> getAll(String name, String value)
	{
		
		String sql;
		if(name.equals("All"))
		{
			sql="select * from student";
		}
		else
		{
			sql="select * from student where sno ="+value;
		}
		return jdbc.getList(Student.class, sql);
	}

	@Override
	public Student getById(String sno) {
		// TODO Auto-generated method stub
		String sql = "select *from student where sno = ?";
		return (Student)jdbc.getObjectById(Student.class, sql, sno);
	}
}
