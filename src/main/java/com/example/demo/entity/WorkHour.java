package com.example.demo.entity;
/**
* @author Administrator
* @date 2019年10月8日
* @version 1.0
*/
public class WorkHour {
	private String id;
	private String userId;
	private String projectId;
	
	private String date;
	private Double hours;
	public WorkHour(String id, String userId, String projectId, String date,Double hours) {
		super();
		this.id = id;
		this.userId = userId;
		this.projectId = projectId;
		this.date = date;
		this.hours = hours;
	}
	public WorkHour() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public Double getHours() {
		return hours;
	}
	public void setHours(Double hours) {
		this.hours = hours;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
