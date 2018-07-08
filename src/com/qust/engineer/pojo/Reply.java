package com.qust.engineer.pojo;

import java.util.Date;

public class Reply {
    private Integer acrId;

    private String acrContent;

    private Integer uId;

    private Integer acId;

    private Date acrTime;

    public Integer getAcrId() {
        return acrId;
    }

    public void setAcrId(Integer acrId) {
        this.acrId = acrId;
    }

    public String getAcrContent() {
        return acrContent;
    }

    public void setAcrContent(String acrContent) {
        this.acrContent = acrContent == null ? null : acrContent.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getAcId() {
        return acId;
    }

    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public Date getAcrTime() {
        return acrTime;
    }

    public void setAcrTime(Date acrTime) {
        this.acrTime = acrTime;
    }
}