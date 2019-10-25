package com.example.demo.entity;

public class Staff {
    private String id;//编号

    private String projectId;//项目id

    private String userId;//员工id

    private Double workFee=0d;//工时费
    
    
    public Staff() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Staff(String id, String projectId, String userId, Double workFee) {
		super();
		this.id = id;
		this.projectId = projectId;
		this.userId = userId;
		this.workFee = workFee;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Double getWorkFee() {
        return workFee;
    }

    public void setWorkFee(Double workFee) {
        this.workFee = workFee;
    }
}