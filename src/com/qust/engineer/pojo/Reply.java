package com.qust.engineer.pojo;

import java.util.Date;

public class Reply {
    private Integer rId;

    private String rContent;

    private Integer uId;

    public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public Integer getRpId() {
		return rpId;
	}

	public void setRpId(Integer rpId) {
		this.rpId = rpId;
	}

	private Integer pId;
    
    private Integer rpId;

    private Date rTime;
    
    private User user;
    
    public User getUser() {
    	return this.user;
    }
    
    public void setUser(User user) {
    	this.user = user;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent == null ? null : rContent.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Date getrTime() {
        return rTime;
    }

    public void setrTime(Date rTime) {
        this.rTime = rTime;
    }
}