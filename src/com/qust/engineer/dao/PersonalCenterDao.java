package com.qust.engineer.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qust.engineer.entity.Answer;
import com.qust.engineer.entity.Question;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;

import cn.itcast.jdbc.TxQueryRunner;

public class PersonalCenterDao {
	private QueryRunner qr = new TxQueryRunner();
	//检查邮箱是否注册
	public boolean ajaxValidateEmail(String u_email) throws SQLException
	{
		String sql = "select count(*) from `tbl_user` where u_email=?";
		Number n = (Number) qr.query(sql, new ScalarHandler(),u_email);
		return n.intValue()==0;//不存在为真，表示可以修改
	}
	//修改用户信息
	public void quickUpdateInfor(User user) throws SQLException
	{
		String sql = "update `tbl_user` set u_email=?,u_name=?,u_pwd=?,u_sex=? where u_email=?";
		Object[] params = {user.getU_email(),user.getU_name(),user.getU_pwd(),user.getU_sex(),user.getU_email()};
		System.out.println(user);
		qr.update(sql, params);
	}
	//
	//完整修改用户信息
	public void completeUpdateInfor(User user) throws SQLException
	{
		
		String sql = "update `tbl_user` set u_name=?,u_sex=?,u_desc=? where u_email=?";
		Object[] params = {user.getU_name(),user.getU_sex(),user.getU_desc(),user.getU_email()};
		qr.update(sql, params);
		/*
		String sql = "update `tbl_user` set u_name=?,u_sex=?,u_desc=?,u_img=? where u_email=?";
		Object[] params = {user.getU_name(),user.getU_sex(),user.getU_desc(),user.getU_img(),user.getU_email()};
		qr.update(sql, params);*/
	}
	//根据用户id查找所有路线
	public List<Route> findRoutesById(int u_id) throws SQLException {
		String sql = "select * from `tbl_route` where u_id=?";
		List<Route> routes = new ArrayList<Route>();
		routes = qr.query(sql, new BeanListHandler<Route>(Route.class),u_id);
		return routes;
	}
	//根据用户uid查找所有提问
	public List<Answer> findAnswersById(int u_id) throws SQLException {
		String sql = "select * from `tbl_answer` where u_id=?";
		List<Answer> answers = new ArrayList<Answer>();
		answers = qr.query(sql, new BeanListHandler<Answer>(Answer.class),u_id);
		return answers;
	}
	//根据用户uid查找所有回答
	public List<Question> findQuestionsById(int u_id) throws SQLException {
		String sql = "select * from `tbl_question` where u_id=?";
		List<Question> questions = new ArrayList<Question>();
		questions = qr.query(sql, new BeanListHandler<Question>(Question.class),u_id);
		return questions;
	}
	public User findUserInforById(int u_id) throws SQLException {
		User user = new User();
		String sql = "select * from `tbl_user` where u_id=?";
		user =  qr.query(sql, new BeanHandler<User>(User.class),u_id);
		return user;
	}
			
}
