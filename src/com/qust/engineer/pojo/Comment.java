package com.qust.engineer.pojo;

import java.util.Date;

public class Comment {
    private Integer acId;

    private String acContent;

    private Date acTime;

    private Integer uId;

    private Integer aId;

    public Integer getAcId() {
        return acId;
    }

    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public String getAcContent() {
        return acContent;
    }

    public void setAcContent(String acContent) {
        this.acContent = acContent == null ? null : acContent.trim();
    }

    public Date getAcTime() {
        return acTime;
    }

    public void setAcTime(Date acTime) {
        this.acTime = acTime;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getaId() {
        return aId;
    }

    public void setaId(Integer aId) {
        this.aId = aId;
    }
}