package com.qust.engineer.pojo;

import java.util.Date;

public class Route {
    private Integer rtId;

    private String rtName;

    private String rtDesc;

    private Date rtTime;

    private Boolean rtCheck;

    private Integer rtLikenum;

    private Integer uId;

    private Integer oId;

    public Integer getRtId() {
        return rtId;
    }

    public void setRtId(Integer rtId) {
        this.rtId = rtId;
    }

    public String getRtName() {
        return rtName;
    }

    public void setRtName(String rtName) {
        this.rtName = rtName == null ? null : rtName.trim();
    }

    public String getRtDesc() {
        return rtDesc;
    }

    public void setRtDesc(String rtDesc) {
        this.rtDesc = rtDesc == null ? null : rtDesc.trim();
    }

    public Date getRtTime() {
        return rtTime;
    }

    public void setRtTime(Date rtTime) {
        this.rtTime = rtTime;
    }

    public Boolean getRtCheck() {
        return rtCheck;
    }

    public void setRtCheck(Boolean rtCheck) {
        this.rtCheck = rtCheck;
    }

    public Integer getRtLikenum() {
        return rtLikenum;
    }

    public void setRtLikenum(Integer rtLikenum) {
        this.rtLikenum = rtLikenum;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }
}