package com.qust.engineer.pojo;

import java.util.Date;

public class ScReply {
    private Integer scrId;

    private String scrContent;

    private Integer uId;

    private Integer scId;

    private Date scrTime;

    public Integer getScrId() {
        return scrId;
    }

    public void setScrId(Integer scrId) {
        this.scrId = scrId;
    }

    public String getScrContent() {
        return scrContent;
    }

    public void setScrContent(String scrContent) {
        this.scrContent = scrContent == null ? null : scrContent.trim();
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public Date getScrTime() {
        return scrTime;
    }

    public void setScrTime(Date scrTime) {
        this.scrTime = scrTime;
    }
}