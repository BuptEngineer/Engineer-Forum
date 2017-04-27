package com.qust.engineer.entity;

import java.util.List;

public class Category {
	private int ctg_id;//
	private String ctg_name;//
	private String ctg_img;//
	private String ctg_desc;//
	private List<Route> routes;//
	public int getCtg_id() {
		return ctg_id;
	}
	public void setCtg_id(int ctg_id) {
		this.ctg_id = ctg_id;
	}
	public String getCtg_name() {
		return ctg_name;
	}
	public void setCtg_name(String ctg_name) {
		this.ctg_name = ctg_name;
	}
	public String getCtg_img() {
		return ctg_img;
	}
	public void setCtg_img(String ctg_img) {
		this.ctg_img = ctg_img;
	}
	public String getCtg_desc() {
		return ctg_desc;
	}
	public void setCtg_desc(String ctg_desc) {
		this.ctg_desc = ctg_desc;
	}
	public List<Route> getRoutes() {
		return routes;
	}
	public void setRoutes(List<Route> routes) {
		this.routes = routes;
	}
	@Override
	public String toString() {
		return "Category [ctg_id=" + ctg_id + ", ctg_name=" + ctg_name
				+ ", ctg_img=" + ctg_img + ", ctg_desc=" + ctg_desc
				+ ", routes=" + routes + "]";
	}
	
}
