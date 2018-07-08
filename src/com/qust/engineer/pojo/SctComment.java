package com.qust.engineer.pojo;

import java.util.Date;

public class SctComment {
    private Integer scId;

    private String scContent;

    private Date scTime;

    private Integer uId;

    private Integer sId;

    public Integer getScId() {
        return scId;
    }

    public void setScId(Integer scId) {
        this.scId = scId;
    }

    public String getScContent() {
        return scContent;
    }

    public void setScContent(String scContent) {
        this.scContent = scContent == null ? null : scContent.trim();
    }

    public Date getScTime() {
        return scTime;
    }

    public void setScTime(Date scTime) {
        this.scTime = scTime;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }
}