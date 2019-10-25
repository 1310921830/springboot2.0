package com.example.demo.entity;

public class Dept {
    private Integer deptNo;//部门号

    private String deptName;//部门名称

    private String deptSite;//部门地址

    public Integer getDeptNo() {
        return deptNo;
    }

    public void setDeptNo(Integer deptNo) {
        this.deptNo = deptNo;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

    public String getDeptSite() {
        return deptSite;
    }

    public void setDeptSite(String deptSite) {
        this.deptSite = deptSite == null ? null : deptSite.trim();
    }
}