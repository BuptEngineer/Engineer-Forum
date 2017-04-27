package com.qust.engineer.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.RuntimeErrorException;



import com.qust.engineer.dao.PersonalCenterDao;
import com.qust.engineer.entity.Answer;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;

public class PersonalCenterService {
	PersonalCenterDao personalCenterDao = new PersonalCenterDao();
	//检查邮箱是否注册
	public boolean ajaxValidateEmail(String email)
	{
		try {
			return personalCenterDao.ajaxValidateEmail(email);
		} catch (SQLException e) {
			throw new RuntimeException("ajax检测邮箱是否已经注册过这里出错了"+e);
		}		
	}
	//修改用户信息
	public void quickUpdateInfor(User form) {
		
		try
		{
			personalCenterDao.quickUpdateInfor(form);
		}
		catch(SQLException e)
		{
			throw new RuntimeException("修改用户信息这里出错了"+e);
		}		
	}
	//修改用户信息
		public void completeUpdateInfor(User form) {
			
			try
			{
				personalCenterDao.completeUpdateInfor(form);
			}
			catch(SQLException e)
			{
				throw new RuntimeException("修改用户信息这里出错了"+e);
			}		
		}
	//根据uid查找用户路线
	public List<Route> findRoutesById(int u_id) {
		List<Route> routes = new ArrayList<Route>();
		try 
		{
			routes = personalCenterDao.findRoutesById(u_id);
		} 
		catch (SQLException e) 
		{
			throw new RuntimeException("根据uid查找路线这里出错了"+e);
		}		
		return routes;
	}
	//根据uid查找用户提问
	public List<Answer> findAnswersById(int u_id) {		
		List<Answer> answers = new ArrayList<Answer>();
		try 
		{
			answers = personalCenterDao.findAnswersById(u_id);
		} 
		catch (SQLException e) 
		{
			throw new RuntimeException("根据uid查找路线这里出错了"+e);
		}		
		return answers;
	}
	//根据用户uid查找用户回答
	public List<Question> findQuestionsById(int u_id) {
		List<Question> questions = new ArrayList<Question>();
		try 
		{
			questions = personalCenterDao.findQuestionsById(u_id);
		} 
		catch (SQLException e) 
		{
			throw new RuntimeException("根据uid查找question这里出错了"+e);
		}	
		return questions;
	}
	public User findUserInforById(int u_id) {
		User user = new User();
		try {
			user = personalCenterDao.findUserInforById(u_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("根据uid查找question这里出错了"+e);
		}
		
		return user;
	}
	
}
