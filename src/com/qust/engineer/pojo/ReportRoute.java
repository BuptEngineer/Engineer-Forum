package com.qust.engineer.pojo;

import java.util.Date;

public class ReportRoute {
    private Integer rrId;

    private Integer rtId;

    private Integer fromUId;

    private Date rrTime;

    public Integer getRrId() {
        return rrId;
    }

    public void setRrId(Integer rrId) {
        this.rrId = rrId;
    }

    public Integer getRtId() {
        return rtId;
    }

    public void setRtId(Integer rtId) {
        this.rtId = rtId;
    }

    public Integer getFromUId() {
        return fromUId;
    }

    public void setFromUId(Integer fromUId) {
        this.fromUId = fromUId;
    }

    public Date getRrTime() {
        return rrTime;
    }

    public void setRrTime(Date rrTime) {
        this.rrTime = rrTime;
    }
}