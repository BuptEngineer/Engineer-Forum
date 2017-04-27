package com.qust.engineer.entity;

public class User {
	private int u_id;//
	private String u_email;//
	private String u_name;//
	private String u_pwd;//
	private String u_sex;//
	private String u_desc;//
	private String u_img;//
	private boolean u_status;//
	private String u_actnCode;//
	
	//剩下的表单属性
	private String confirmpass;//确认密码
	private String verifyCode;//验证码
	//修改密码
	private String newpassword;//新密码
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_pwd() {
		return u_pwd;
	}
	public void setU_pwd(String u_pwd) {
		this.u_pwd = u_pwd;
	}
	public String getU_sex() {
		return u_sex;
	}
	public void setU_sex(String u_sex) {
		this.u_sex = u_sex;
	}
	
	public String getU_desc() {
		return u_desc;
	}
	public void setU_desc(String u_desc) {
		this.u_desc = u_desc;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	public boolean isU_status() {
		return u_status;
	}
	public void setU_status(boolean u_status) {
		this.u_status = u_status;
	}
	public String getU_actnCode() {
		return u_actnCode;
	}
	public void setU_actnCode(String u_actnCode) {
		this.u_actnCode = u_actnCode;
	}
	public String getConfirmpass() {
		return confirmpass;
	}
	public void setConfirmpass(String confirmpass) {
		this.confirmpass = confirmpass;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_email=" + u_email + ", u_name="
				+ u_name + ", u_pwd=" + u_pwd + ", u_sex=" + u_sex
				+ ", u_desc=" + u_desc + ", u_img=" + u_img + ", u_status="
				+ u_status + ", u_actnCode=" + u_actnCode + ", confirmpass="
				+ confirmpass + ", verifyCode=" + verifyCode + ", newpassword="
				+ newpassword + "]";
	}
	
}
