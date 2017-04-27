package com.qust.engineer.service;

import java.sql.SQLException;
import java.util.List;

import com.qust.engineer.dao.RouteDao;
import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Route;

public class RouteService {
	private RouteDao routeDao = new RouteDao();
	
	/**
	 * ajax添加而更多
	 * @param begin
	 * @param ctg_id
	 * @return
	 */
	public List<Route> ajaxAddMore(String begin, String ctg_id) {
		try {
			return routeDao.ajaxAddMore(begin,ctg_id);
		} catch (SQLException e) {
			throw new RuntimeException("添加路线时出错了:"+e);
		}
	}
	/**
	 * 添加路线
	 * @param route
	 */
	public void add(Route route) {
		try {
			routeDao.add(route);
		} catch (SQLException e) {
			throw new RuntimeException("添加路线时出错了:"+e);
		}
	}
	/**
	 * 查找显示路线的详细信息
	 * @param rt_id
	 * @return
	 */
	public Route find(int rt_id) {
		try {
			return routeDao.findByRt_id(rt_id);
		} catch (SQLException e) {
			throw new RuntimeException("修改路线时出错了:"+e);
		}
	}
	/**
	 * 修改路线信息
	 * @param route
	 */
	public void edit(Route route) {
			try {
				routeDao.update(route);
			} catch (SQLException e) {
				throw new RuntimeException("修改路线时出错了:"+e);
			}
	}
	
	
	
}
