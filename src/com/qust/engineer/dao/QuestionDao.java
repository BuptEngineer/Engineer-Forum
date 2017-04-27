package com.qust.engineer.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;

import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.User;

public class QuestionDao {

	private QueryRunner qr = new TxQueryRunner();
	
	/*
	 *
	 *添加问题
	 *
	 */
	public void add(Question question) throws SQLException{
		String sql = "INSERT INTO tbl_question (q_name,q_desc,u_id,ctg_id,q_time) VALUES (?,?,?,?,?)";
		question.toString();
		Object[] params = {question.getQ_name(),question.getQ_desc(),question.getUser().getU_id(),question.getCategory().getCtg_id(),question.getQ_time()};
		qr.update(sql, params);
	}
	
	
	
	/*
	 * 
	 * 根据板块查找分类
	 * 
	 */

	public List<Question> findQueByCtgId(int ctg_id) throws SQLException {
		String sql = "select * from tbl_question  where  ctg_id = ?";
		
		List<Question> question = new ArrayList<Question>();
		question = qr.query(sql, new BeanListHandler<Question>(Question.class),ctg_id);
		
		UserDao userDao = new UserDao();
		CategoryDao categoryDao = new CategoryDao();
		
		for (Question question2 : question) {
			question2.setUser(userDao.findByUser_id(this.findUserIdByQid(question2.getQ_id())));
			question2.setCategory(categoryDao.findByCtg_id(this.findCtgidByQid(question2.getQ_id())));
			question2.setA_num(this.findANum(question2.getQ_id()));
		}
		return question;
	}
	
	
	/*
	 * 
	 * 通过QuestionID来找到相应的userID
	 * 用途：用于findQueByCtgId()
	 * 
	 */
	public int findUserIdByQid(int q_id) throws SQLException{
		String sql = "select u_id from tbl_question where q_id = ?";
		int u_id=(int) qr.query(sql, new ScalarHandler(),q_id);
		return u_id;
	}
	
	
	/*
	 * 
	 * 通过QuestionID来找到相应的ctg_id
	 * 用途：用于findQueByCtgId()
	 *
	 */
	public int findCtgidByQid(int q_id) throws SQLException{
		String sql = "select ctg_id from tbl_question where q_id = ?";
		int ctg_id=(int) qr.query(sql, new ScalarHandler(),q_id);
		return ctg_id;
	}
	
	
	/**
	 * 通过q_id找到目录
	 * @param q_id
	 * @return
	 * @throws SQLException
	 */
	public Category findCByQid(int q_id) throws SQLException{
		String sql = "SELECT * FROM tbl_category WHERE ctg_id IN(SELECT ctg_id FROM tbl_question WHERE q_id = ?)";
		Category category  = qr.query(sql, 
				new BeanHandler<Category>(Category.class),q_id);
		return category;
	}
	
	/**
	 * 通过问题来返回用户名和用户图像
	 * @param q_id
	 * @return
	 * @throws SQLException
	 */
	public User findUByQid(int q_id) throws SQLException {
		String sql = "SELECT u_name,u_img FROM tbl_user WHERE u_id IN(SELECT u_id FROM tbl_question WHERE q_id = ?)";
		return qr.query(sql, new BeanHandler<User>(User.class),q_id);
	}
	
	
	/*
	 * 
	 * 查找前十条最新问题
	 * 
	 */
	public List<Question> findNew10Question() throws SQLException {
		String sql = "SELECT * FROM tbl_question ORDER BY q_time DESC LIMIT 0,10  ";
		
		List<Question> question = new ArrayList<Question>();
		question = qr.query(sql, new BeanListHandler<Question>(Question.class));
		
		UserDao userDao = new UserDao();
		CategoryDao categoryDao = new CategoryDao();
		
		for (Question question2 : question) {
			question2.setUser(userDao.findByUser_id(this.findUserIdByQid(question2.getQ_id())));
			question2.setCategory(categoryDao.findByCtg_id(this.findCtgidByQid(question2.getQ_id())));
			question2.setA_num(this.findANum(question2.getQ_id()));

		}
		return question;
	}
	
	
	
	/*
	 * 
	 * 显示回答最多的10个问题，也就是用回答数量来标识问题热度
	 * 
	 */
	public List<Question> findHot10Question() throws SQLException {
		String sql = "SELECT * FROM tbl_question NATURAL JOIN (SELECT q_id,COUNT(q_id) num FROM " +
				"tbl_answer GROUP BY q_id ORDER BY COUNT(q_id))a ORDER BY num DESC LIMIT 0,10";
		
		List<Question> question = new ArrayList<Question>();
		question = qr.query(sql, new BeanListHandler<Question>(Question.class));
		
		UserDao userDao = new UserDao();
		CategoryDao categoryDao = new CategoryDao();
		
		for (Question question2 : question) {
			question2.setUser(userDao.findByUser_id(this.findUserIdByQid(question2.getQ_id())));
			question2.setCategory(categoryDao.findByCtg_id(this.findCtgidByQid(question2.getQ_id())));
			question2.setA_num(this.findANum(question2.getQ_id()));

		}
		return question;
	}
	
	/**
	 * 根据q_id返回一个 Question对象
	 * @param q_id
	 * @return
	 * @throws SQLException
	 */
	public Question findQ(int q_id) throws SQLException{
		String sql = "select *from tbl_question where q_id =?";		
		Question question =  qr.query(sql, new BeanHandler<Question>(Question.class),q_id);
		question.setCategory(this.findCByQid(q_id));
		question.setUser(this.findUByQid(q_id));
		question.setA_num(this.findANum(q_id));

		return question;
	}
	
	
	/**
	 * 根据q_id返回 回答个数
	 * @param q_id
	 * @return
	 * @throws SQLException
	 */
	public int findANum(int q_id) throws SQLException{
		String sql="SELECT COUNT(*) FROM tbl_answer WHERE  q_id = ?";
		Number n=(Number) qr.query(sql, new ScalarHandler(),q_id);
		return n.intValue();
	}
	
	
	

	
	/*
	 * 
	 * 根据qID删除问题
	 * 
	 */
	public void delete(int q_id) throws SQLException{
		String sql = "delete from tbl_question where q_id=?";
		qr.update(sql,q_id);
	}
	
	
	
	
	
	
}
