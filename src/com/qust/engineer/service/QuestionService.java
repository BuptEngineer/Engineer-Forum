package com.qust.engineer.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qust.engineer.dao.QuestionDao;
import com.qust.engineer.entity.Question;

public class QuestionService {

	private QuestionDao questionDao = new QuestionDao();
	
	/**
	 * 查看本板块的问题
	 * @param ctg_id
	 * @return
	 */
	public List<Question> findQueByCtgId(int ctg_id){
		List<Question> question = new ArrayList<Question>();
		
		try {
		question = questionDao.findQueByCtgId(ctg_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	
	
	
	/**
	 * 查看最新十个问题
	 * @param category
	 */
	public List<Question> findNew10Q(){
		List<Question> question = new ArrayList<Question>();
		try {
			question = questionDao.findNew10Question();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	
	
	/**
	 * 查看最热的十个问题
	 * @return
	 */
	public List<Question> findHot10Q(){
		List<Question> question = new ArrayList<Question>();
		try {
			question = questionDao.findHot10Question();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	
	
	
	
	/**
	 * 添加问题
	 * @param question
	 */
	public void add(Question question) {
		try {
			questionDao.add(question);
		} catch (SQLException e) {
			throw new RuntimeException("添加问题时出错了："+e);
		}
	}
	
/**
 * 根据ID找到问题
 * @param q_id
 * @return
 */
	public Question findQById(int q_id){
		
		Question question = new Question();
		
		try {
		question=questionDao.findQ(q_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return question;
	}
	

	
	
	/**
	 * 删除问题
	 * @param q_id
	 */
	public void delete(int q_id){
		try {
			questionDao.delete(q_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
