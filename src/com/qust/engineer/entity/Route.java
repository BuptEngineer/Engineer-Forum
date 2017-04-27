package com.qust.engineer.entity;

import java.util.List;

public class Route {
	private int rt_id;//
	private String rt_name;//
	private String rt_desc;//
	private String rt_content;//
	private String rt_time;//
	private String rt_check;//
	private int rt_likeNum;//
	private User user;//
	private Category category;//
	public int getRt_id() {
		return rt_id;
	}
	public void setRt_id(int rt_id) {
		this.rt_id = rt_id;
	}
	public String getRt_name() {
		return rt_name;
	}
	public void setRt_name(String rt_name) {
		this.rt_name = rt_name;
	}
	public String getRt_desc() {
		return rt_desc;
	}
	public void setRt_desc(String rt_desc) {
		this.rt_desc = rt_desc;
	}
	
	public String getRt_content() {
		return rt_content;
	}
	public void setRt_content(String rt_content) {
		this.rt_content = rt_content;
	}
	public String getRt_time() {
		return rt_time;
	}
	public void setRt_time(String rt_time) {
		this.rt_time = rt_time;
	}
	public String getRt_check() {
		return rt_check;
	}
	public void setRt_check(String rt_check) {
		this.rt_check = rt_check;
	}
	public int getRt_likeNum() {
		return rt_likeNum;
	}
	public void setRt_likeNum(int rt_likeNum) {
		this.rt_likeNum = rt_likeNum;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Route [rt_id=" + rt_id + ", rt_name=" + rt_name + ", rt_desc="
				+ rt_desc + ", rt_content=" + rt_content + ", rt_time="
				+ rt_time + ", rt_check=" + rt_check + ", rt_likeNum="
				+ rt_likeNum + ", user=" + user + ", category=" + category
				+ "]";
	}

}
