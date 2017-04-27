package com.qust.engineer.entity;

public class Question {

	private int q_id;
	private String 	q_name;
	private String	q_desc;
	private User user;
	private Category category;
	private String	q_time;
	private int a_num;
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}
	public String getQ_desc() {
		return q_desc;
	}
	public void setQ_desc(String q_desc) {
		this.q_desc = q_desc;
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
	public String getQ_time() {
		return q_time;
	}
	public void setQ_time(String q_time) {
		this.q_time = q_time;
	}
	@Override
	public String toString() {
		return "Question [q_id=" + q_id + ", q_name=" + q_name + ", q_desc="
				+ q_desc + ", user=" + user + ", category=" + category
				+ ", q_time=" + q_time + ", a_num=" + a_num + "]";
	}

	
	
}
