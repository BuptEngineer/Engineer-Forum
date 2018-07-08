package com.qust.engineer.pojo;

import java.util.Date;

public class Letter {
    private Integer lId;

    private String lContent;

    private Integer fromUId;

    private Integer toUId;

    private Date ulTime;

    private Boolean lIsread;

    public Integer getlId() {
        return lId;
    }

    public void setlId(Integer lId) {
        this.lId = lId;
    }

    public String getlContent() {
        return lContent;
    }

    public void setlContent(String lContent) {
        this.lContent = lContent == null ? null : lContent.trim();
    }

    public Integer getFromUId() {
        return fromUId;
    }

    public void setFromUId(Integer fromUId) {
        this.fromUId = fromUId;
    }

    public Integer getToUId() {
        return toUId;
    }

    public void setToUId(Integer toUId) {
        this.toUId = toUId;
    }

    public Date getUlTime() {
        return ulTime;
    }

    public void setUlTime(Date ulTime) {
        this.ulTime = ulTime;
    }

    public Boolean getlIsread() {
        return lIsread;
    }

    public void setlIsread(Boolean lIsread) {
        this.lIsread = lIsread;
    }
}