package com.qust.engineer.pojo;

public class Category {
    private Integer ctgId;

    private String ctgName;

    private Integer pctgId;

    private String ctgDesc;

    
    public Category(String ctgName, String ctgDesc) {
		super();
		this.ctgName = ctgName;
		this.ctgDesc = ctgDesc;
	}

	public Integer getCtgId() {
        return ctgId;
    }

    public void setCtgId(Integer ctgId) {
        this.ctgId = ctgId;
    }

    public String getCtgName() {
        return ctgName;
    }

    public void setCtgName(String ctgName) {
        this.ctgName = ctgName == null ? null : ctgName.trim();
    }

    public Integer getPctgId() {
        return pctgId;
    }

    public void setPctgId(Integer pctgId) {
        this.pctgId = pctgId;
    }

    public String getCtgDesc() {
        return ctgDesc;
    }

    public void setCtgDesc(String ctgDesc) {
        this.ctgDesc = ctgDesc == null ? null : ctgDesc.trim();
    }
}