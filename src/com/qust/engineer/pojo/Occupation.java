package com.qust.engineer.pojo;

public class Occupation {
    private Integer oId;

    private String oName;

    private String oDesc;

    private Integer ctgId;

    public Integer getoId() {
        return oId;
    }

    public void setoId(Integer oId) {
        this.oId = oId;
    }

    public String getoName() {
        return oName;
    }

    public void setoName(String oName) {
        this.oName = oName == null ? null : oName.trim();
    }

    public String getoDesc() {
        return oDesc;
    }

    public void setoDesc(String oDesc) {
        this.oDesc = oDesc == null ? null : oDesc.trim();
    }

    public Integer getCtgId() {
        return ctgId;
    }

    public void setCtgId(Integer ctgId) {
        this.ctgId = ctgId;
    }
}