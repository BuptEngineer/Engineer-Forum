package com.qust.engineer.pojo;

public class User {
    private Integer uId;

    private String uEmail;

    private String uName;

    private String uPwd;

    private String uSex;

    private String uDesc;

    private String uImg;

    private Boolean uStatus;

    private String uActncode;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd == null ? null : uPwd.trim();
    }

    public String getuSex() {
        return uSex;
    }

    public void setuSex(String uSex) {
        this.uSex = uSex == null ? null : uSex.trim();
    }

    public String getuDesc() {
        return uDesc;
    }

    public void setuDesc(String uDesc) {
        this.uDesc = uDesc == null ? null : uDesc.trim();
    }

    public String getuImg() {
        return uImg;
    }

    public void setuImg(String uImg) {
        this.uImg = uImg == null ? null : uImg.trim();
    }

    public Boolean getuStatus() {
        return uStatus;
    }

    public void setuStatus(Boolean uStatus) {
        this.uStatus = uStatus;
    }

    public String getuActncode() {
        return uActncode;
    }

    public void setuActncode(String uActncode) {
        this.uActncode = uActncode == null ? null : uActncode.trim();
    }

	@Override
	public String toString() {
		return "User [uId=" + uId + ", uEmail=" + uEmail + ", uName=" + uName + ", uPwd=" + uPwd + ", uSex=" + uSex
				+ ", uDesc=" + uDesc + ", uImg=" + uImg + ", uStatus=" + uStatus + ", uActncode=" + uActncode + "]";
	}
    
}