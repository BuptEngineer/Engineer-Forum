package com.qust.engineer.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.TxQueryRunner;

import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;
import com.qust.engineer.service.CategoryService;

public class CategoryDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 查找所有的分类
	 * @return
	 * @throws SQLException 
	 */
	public List<Category> findAll() throws SQLException {
		String sql = "select ctg_id,ctg_name,ctg_desc from tbl_category";
		List<Category> categorys = new ArrayList<Category>();
		categorys = qr.query(sql, new BeanListHandler<Category>(Category.class));
		return categorys;
	}
	/**
	 * 按id查找分类
	 * @param ctg_id
	 * @throws SQLException 
	 */
	public Category findByCtg_id(String ctg_id) throws SQLException {
		String sql = "select * from tbl_category where ctg_id = ?";
		Category category  = qr.query(sql, 
				new BeanHandler<Category>(Category.class),ctg_id);
		return category;
		
	}
	/**
	 * 按分类来查看所有的路线
	 * @param ctg_id
	 * @return
	 * @throws SQLException 
	 */
	public Category findRoutesByCtg_id(String ctg_id) throws
	SQLException ,IndexOutOfBoundsException{
		String sql = "select c.*,r.rt_id,r.rt_name,r.rt_time,r.rt_desc, " +
				"r.rt_likeNum,u.u_id,u.u_name,u.u_img,u.u_desc " +
				" from tbl_category c,tbl_route r,tbl_user u " +
				" where r.ctg_id = ? and c.ctg_id=r.ctg_id and r.u_id=u.u_id limit 0,3";
		List<Map<String,Object>> mapList = qr.query(sql, new MapListHandler(),ctg_id);
		List<Route> routes = toRouteList(mapList);
		//将一个map中的category取出来，然后把routeList设置到category中
		Category category = CommonUtils.toBean(mapList.get(0), Category.class);
		category.setRoutes(routes);
		return category;
	}
	/**
	 * 将mapList转化为routeList
	 * @param mapList
	 * @return
	 */
	private List<Route> toRouteList(List<Map<String, Object>> mapList) {
		List<Route> routes = new ArrayList<Route>();
		for(Map map:mapList){
			Route route = toRoute(map);
			routes.add(route);
		}
		return routes;
	}
	/**
	 * 将map中的值转换成route,user
	 * @param map
	 * @return
	 */
	private Route toRoute(Map<String, Object> map) {
		Route route = CommonUtils.toBean(map, Route.class);	
		User user = CommonUtils.toBean(map, User.class);
		route.setUser(user);
		return route;
	}
	
	/**
	 * 查找热门的标签和问题
	 * @throws SQLException 
	 */
	public List<Category> findHotTag() throws SQLException {
		String sql = "select ctg_id from tbl_category limit ?,5";
		List<Category> ctgs = qr.query(sql, new BeanListHandler<Category>(Category.class),0);
		List<Category> cates = new ArrayList<Category>();
		for(Category ctg:ctgs){
			try {
				Category cate = findRoutesByCtg_id(ctg.getCtg_id()+"");
				cates.add(cate);
			} catch (IndexOutOfBoundsException e) {
				Category category = findByCtg_id(ctg.getCtg_id()+"");
				cates.add(category);
			}
			
		}
		return cates;
	}
	
	/**
	 * 添加分类 【后台管理】
	 * @param category
	 * @throws SQLException 
	 */
	public void add(Category category) throws SQLException {
		String sql = "insert into tbl_category(ctg_name,ctg_img,ctg_desc) values(?,?,?)";
		Object[] params = {category.getCtg_name(),category.getCtg_img(),
				category.getCtg_desc()};
		qr.update(sql,params);
	}
	/**
	 * 修改分类 【后台管理】
	 * @param category
	 * @throws SQLException 
	 */
	public void update(Category category) throws SQLException {
		String sql = "update tbl_category set ctg_name=?,ctg_desc=? where ctg_id=?";
		Object[] params = {category.getCtg_name(),category.getCtg_desc(),
				category.getCtg_id()};
		qr.update(sql,params);
	}
	/**
	 * 删除分类时，先查看分类下面是否有学习路线
	 * @param ctg_id
	 * @return
	 * @throws SQLException 
	 */
	public int findRouteNumByCtg_id(String ctg_id) throws SQLException {
		int num = 0;
		String sql = "select count(*) from tbl_route where ctg_id = ?";
		Number n = (Number) qr.query(sql, new ScalarHandler(),ctg_id);
		num = n.intValue();
		return num;
	}
	/**
	 * 删除分类
	 * @param ctg_id
	 * @throws SQLException 
	 */
	public void deleteByCtg_id(String ctg_id) throws SQLException {
		String sql = "delete from tbl_category where ctg_id=?";
		qr.update(sql,ctg_id);
	}
	

	/**
	 * 按id查找分类 int类型
	 * @param ctg_id
	 * @throws SQLException 
	 */
	public Category findByCtg_id(int ctg_id) throws SQLException {
		String sql = "select * from tbl_category where ctg_id = ?";
		Category category  = qr.query(sql, 
				new BeanHandler<Category>(Category.class),ctg_id);
		return category;
	}

}
