package com.qust.engineer.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qust.engineer.dao.AnswerDao;
import com.qust.engineer.entity.Answer;

public class AnswerService {

	private AnswerDao answerDao = new AnswerDao();
	
	/**
	 * 根据问题显示回答
	 * @param q_id
	 * @return
	 */
	public List<Answer>findAByQ(int q_id){
		
		List<Answer> answer = new ArrayList<Answer>();
		
		try {
			answer = answerDao.findAByQid(q_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return answer;
	}
	
	
	
	/**
	 * 添加回答
	 * @param answer
	 */
	public void add(Answer answer){
		try {
			answerDao.add(answer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 删除回答
	 * @param answer
	 */
	public void update(Answer answer){
		try {
			answerDao.update(answer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 删除回答
	 * @param answer
	 */
	public void delet(Answer answer){
		try {
			answerDao.delete(answer.getA_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 
	 * 判断回答是否已经被回答过
	 * @param answer
	 * @return
	 */
	public boolean IsAnswered(Answer answer){
		try {
			return answerDao.IsAnswered(answer);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
