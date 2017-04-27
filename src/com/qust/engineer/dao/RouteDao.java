package com.qust.engineer.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;

public class RouteDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 添加
	 * @param route
	 * @throws SQLException 
	 */
	public void add(Route route) throws SQLException {
		String sql = "insert into tbl_route(rt_name,rt_desc," +
				"rt_content,u_id,ctg_id) values(?,?,?,?,?) ";
		Object[] params = {route.getRt_name(),route.getRt_desc(),route.getRt_content(),
				route.getUser().getU_id(),route.getCategory().getCtg_id()};
		qr.update(sql, params);
		
	}
	/**
	 * 按id查找路线
	 * @param rt_id
	 * @throws SQLException 
	 */
	public Route findByRt_id(int rt_id) throws SQLException {
		String sql = "SELECT r.*,u.u_name,u.u_img,c.ctg_name,c.ctg_img "
				+"FROM tbl_route r,tbl_user u,tbl_category c " + 
				" WHERE rt_id =? AND r.u_id = u.u_id AND r.ctg_id = c.ctg_id;";
		Map<String,Object> map = qr.query(sql, new MapHandler(),rt_id);
		Route route = toRoute(map);
		return route;
	}
	
	/**
	 * 修改路线
	 * @param route
	 * @throws SQLException 
	 */
	public void update(Route route) throws SQLException {
		String sql = "update tbl_route set rt_name=?,rt_desc=?,rt_content=? where rt_id=?";
		Object[] params = {route.getRt_name(),route.getRt_desc(),
				route.getRt_content(),route.getRt_id()};
		qr.update(sql,params);
	}
	
	
	/**
	 * 将map中的值转换成route,category,user
	 * @param map
	 * @return
	 */
	private Route toRoute(Map<String, Object> map) {
		Route route = CommonUtils.toBean(map, Route.class);
		Category c = CommonUtils.toBean(map, Category.class);
		route.setCategory(c);
		
		User user = CommonUtils.toBean(map, User.class);
		route.setUser(user);
		return route;
	}
	/**
	 * ajax查找更多
	 * @param begin
	 * @param ctg_id
	 * @return 
	 * @throws SQLException 
	 */
	public List<Route> ajaxAddMore(String begin, String ctg_id) throws SQLException {
		String sql = "select c.*,r.rt_id,r.rt_name,r.rt_time,r.rt_desc, " +
				"r.rt_likeNum,u.u_id,u.u_name,u.u_img,u.u_desc " +
				" from tbl_category c,tbl_route r,tbl_user u " +
				" where r.ctg_id = ? and c.ctg_id=r.ctg_id and r.u_id=u.u_id limit ?,3";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(),ctg_id,begin);
		List<Route> routes = toRouteList(mapList);
		return routes;
	}
	/**
	 * 将mapList转化为routeList
	 * @param mapList
	 * @return
	 */
	private List<Route> toRouteList(List<Map<String, Object>> mapList) {
		List<Route> routes = new ArrayList<Route>();
		for(Map map:mapList){
			Route route = toRoute_min(map);
			routes.add(route);
		}
		return routes;
	}
	/**
	 * 将map中的值转换成route,user
	 * @param map
	 * @return
	 */
	private Route toRoute_min(Map<String, Object> map) {
		Route route = CommonUtils.toBean(map, Route.class);	
		User user = CommonUtils.toBean(map, User.class);
		route.setUser(user);
		return route;
	}
	
	
}
