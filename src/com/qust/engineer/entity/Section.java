package com.qust.engineer.entity;

public class Section {
	private int s_id;//
	private int s_num;
	private String s_name;
	private String s_content;//
	private Route route;//所属于哪一条学习路线
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	@Override
	public String toString() {
		return "Section [s_id=" + s_id + ", s_num=" + s_num + ", s_name="
				+ s_name + ", s_content=" + s_content + ", route=" + route
				+ "]";
	}
	
}
