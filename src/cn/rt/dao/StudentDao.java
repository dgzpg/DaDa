package cn.rt.dao;

import java.util.List;

import cn.rt.entity.Student;

public interface StudentDao {
	
   /**
    * @author 滕宇
    * 
    */
	
	/**
	 * 
	 * @param stu
	 * 学生注册
	 */
	public int add(Student stu);
	
    /**
     * 
     * @param stu
     * 学生数据更新
     */
	public int update(Student stu);
	
	/**
	 * 
	 * @param stu
	 * 删除学生记录
	 */
	public int delete(Student stu);
	
   /**
    * 
    * @param name
    * @param value
    * 获取全部学生信息
    */
	public List<Student> getAll(String name, String value);
	
	/**
	 * 
	 * @param sno
	 * 根据学号获取学生信息
	 */
	public Student getById(String sno);
}
