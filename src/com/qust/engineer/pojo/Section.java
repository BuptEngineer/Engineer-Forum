package com.qust.engineer.pojo;

public class Section {
    private Integer sId;

    private Integer sNum;

    private String sName;

    private Integer rtId;

    private String sContent;

    public Integer getsId() {
        return sId;
    }

    public void setsId(Integer sId) {
        this.sId = sId;
    }

    public Integer getsNum() {
        return sNum;
    }

    public void setsNum(Integer sNum) {
        this.sNum = sNum;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public Integer getRtId() {
        return rtId;
    }

    public void setRtId(Integer rtId) {
        this.rtId = rtId;
    }

    public String getsContent() {
        return sContent;
    }

    public void setsContent(String sContent) {
        this.sContent = sContent == null ? null : sContent.trim();
    }
}