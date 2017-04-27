package com.qust.engineer.entity;

public class Answer {

	private int a_id;
	private Question question;
	private String a_content;
	private User user;
	private String a_time;
	private int a_likenum;
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getA_time() {
		return a_time;
	}
	public void setA_time(String a_time) {
		this.a_time = a_time;
	}
	public int getA_likenum() {
		return a_likenum;
	}
	public void setA_likenum(int a_likenum) {
		this.a_likenum = a_likenum;
	}
	@Override
	public String toString() {
		return "Answer [a_id=" + a_id + ", question=" + question
				+ ", a_content=" + a_content + ", user=" + user + ", a_time="
				+ a_time + ", a_likenum=" + a_likenum + "]";
	}

	
}
