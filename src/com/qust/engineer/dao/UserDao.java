package com.qust.engineer.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.qust.engineer.entity.User;

import cn.itcast.jdbc.TxQueryRunner;


public class UserDao {
	private QueryRunner qr = new TxQueryRunner();
	//ajax邮箱注册校验
	public boolean ajaxValidateEmail(String u_email) throws SQLException{
		String sql = "select count(*) from `tbl_user` where u_email=?";
		Number n = (Number) qr.query(sql, new ScalarHandler(),u_email);
		return n.intValue()==0;//不存在为真，表示可以注册		
	}
	//注册后的添加用户
	public void add(User user) throws SQLException{
		String sql = "insert into `tbl_user`(u_email,u_name,`u_pwd`,u_sex,`u_status`," +
				"u_actnCode) values (?,?,?,?,?,?)" ;
		Object[] params = {user.getU_email(),user.getU_name(),user.getU_pwd(),
				user.getU_sex(),user.isU_status(),user.getU_actnCode()};
		qr.update(sql,params);	
	}
	//按激活码查找用户
	public User findByActivationCode(String u_actnCode) throws SQLException{
		String sql = "select u_id,u_name,u_img from `tbl_user` where u_actnCode=?";
		return qr.query(sql, new BeanHandler<User>(User.class),u_actnCode);
	}
	//修改激活状态
	public void updateStatus(int u_id,boolean u_status) throws SQLException{
		String sql = "update `tbl_user` set `u_status`=? where user_id=?";
		qr.update(sql,u_status,u_id);
	}
	public User findByEmail(String u_email) throws SQLException {
		String sql = "select * from `tbl_user` where u_email=?";		
		return qr.query(sql, new BeanHandler<User>(User.class),u_email);
	}
	//修改密码时，按用户id和密码查找，若查出记录，则说明原密码正确
	public boolean findByUser_idAndPassword(int u_id, String u_pwd) throws SQLException {
		String sql="select count(*) from `tbl_user` where u_id=? and `u_pwd`=?";
		Number n=(Number) qr.query(sql, new ScalarHandler(),u_id,u_pwd);
		return n.intValue()>0;
	}
	// 根据用户ID来查找用户信息
	public User findByUser_id(int u_id) throws SQLException {
		String sql="select u_id,u_name,u_img,u_desc from `tbl_user` where u_id=?";
		User user=qr.query(sql,new BeanHandler<User>(User.class),u_id);
		return user;
	}
	//修改密码
	public void updatePassword(int u_id, String newpassword) throws SQLException {
		String sql="update `tbl_user` set u_pwd=? where u_id=?";
		qr.update(sql, newpassword,u_id);	
	}
	
}
