package com.qust.engineer.service;

import java.sql.SQLException;
import java.util.List;

import com.qust.engineer.dao.CategoryDao;
import com.qust.engineer.entity.Category;
import com.qust.engineer.service.exception.CategoryException;

public class CategoryService {
	private CategoryDao ctgDao = new CategoryDao();
	
	/**
	 * 查找显示所有的分类
	 * @return
	 */
	public List<Category> findAll() {
		try {
			return ctgDao.findAll();
		} catch (SQLException e) {
			throw new RuntimeException("查找所有的分类时出错了："+e);
		}
	}
	/**
	 * 按分类查找路线集合
	 * @param ctg_id
	 * @return
	 */
	public Category findRoutesByCtg(String ctg_id) throws IndexOutOfBoundsException {
		try {
			return ctgDao.findRoutesByCtg_id(ctg_id);
		} catch (SQLException e) {
			throw new RuntimeException("按分类查找路线"+e);
		}
	}
	
		
	/**
	 * 
	 * @param ctg_id
	 * @return
	 */
	public Category findByCtg_id(String ctg_id) {
		try {
			return ctgDao.findByCtg_id(ctg_id);
		} catch (SQLException e) {
			throw new RuntimeException("按id查找分类时出错了："+e);
		}
	}

	/**
	 * 添加分类 【后台管理】
	 * @param category
	 */
	public void add(Category category) {
		try {
			ctgDao.add(category);
		} catch (SQLException e) {
			throw new RuntimeException("添加分类时出错了："+e);
		}
	}
	/**
	 * 修改分类 【后台管理】
	 * @param category
	 */
	public void edit(Category category) {
		try {
			ctgDao.update(category);
		} catch (SQLException e) {
			throw new RuntimeException("修改分类时出错了："+e);
		}
	}
	/**
	 * 删除分类
	 * @param ctg_id
	 * @throws CategoryException 
	 */
	public void delete(String ctg_id) throws CategoryException {
		int num;
		try {
			num = ctgDao.findRouteNumByCtg_id(ctg_id);
			if(num>0){
				throw new CategoryException("该分类下面有学习路线，不能删除！");
			}else{
				ctgDao.deleteByCtg_id(ctg_id);
			}
		} catch (SQLException e) {
			throw new RuntimeException("删除分类时出错了："+e);
		}
		
		
	}
	/**
	 * 查找热门的标签和路线
	 * @return
	 */
	public List<Category> findHotTag() {
		try {
			return ctgDao.findHotTag();
		} catch (SQLException e) {
			throw new RuntimeException("查找热门分类时出错了："+e);
		}
	}
}
