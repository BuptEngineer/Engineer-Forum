package com.qust.engineer.pojo;

import java.util.Date;

public class Answer {
    private Integer aId;

    private Integer qId;

    private Integer uId;

    private Date aTime;

    private Integer aLikenum;

    private String aContent;

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }

    public Integer getqId() {
        return qId;
    }

    public void setqId(Integer qId) {
        this.qId = qId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Date getaTime() {
        return aTime;
    }

    public void setaTime(Date aTime) {
        this.aTime = aTime;
    }

    public Integer getaLikenum() {
        return aLikenum;
    }

    public void setaLikenum(Integer aLikenum) {
        this.aLikenum = aLikenum;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent == null ? null : aContent.trim();
    }
}