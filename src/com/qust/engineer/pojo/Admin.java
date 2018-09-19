package com.qust.engineer.pojo;

public class Admin {
    private Integer admId;

    private String admName;

    private String admPwd;

    private Boolean admIssuper;

    public Integer getAdmId() {
        return admId;
    }

    public void setAdmId(Integer admId) {
        this.admId = admId;
    }

    public String getAdmName() {
        return admName;
    }

    public void setAdmName(String admName) {
        this.admName = admName == null ? null : admName.trim();
    }

    public String getAdmPwd() {
        return admPwd;
    }

    public void setAdmPwd(String admPwd) {
        this.admPwd = admPwd == null ? null : admPwd.trim();
    }

    public Boolean getAdmIssuper() {
        return admIssuper;
    }

    public void setAdmIssuper(Boolean admIssuper) {
        this.admIssuper = admIssuper;
    }
}