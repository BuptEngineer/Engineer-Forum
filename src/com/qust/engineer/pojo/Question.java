package com.qust.engineer.pojo;

import java.util.Date;

public class Question {
    private Integer qId;

    private String qName;

    private String qDesc;

    private Integer uId;

    private Integer ctgId;

    private Date qTime;

    public Integer getqId() {
        return qId;
    }

    public void setqId(Integer qId) {
        this.qId = qId;
    }

    public String getqName() {
        return qName;
    }

    public void setqName(String qName) {
        this.qName = qName == null ? null : qName.trim();
    }

    public String getqDesc() {
        return qDesc;
    }

    public void setqDesc(String qDesc) {
        this.qDesc = qDesc == null ? null : qDesc.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getCtgId() {
        return ctgId;
    }

    public void setCtgId(Integer ctgId) {
        this.ctgId = ctgId;
    }

    public Date getqTime() {
        return qTime;
    }

    public void setqTime(Date qTime) {
        this.qTime = qTime;
    }
}