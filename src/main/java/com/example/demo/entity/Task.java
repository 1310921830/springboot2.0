package com.example.demo.entity;

public class Task {
    private String id;

    private String startTime;

    private String endTime;

    private String task1;

    private String task2;

    private String task3;

    private String task4;

    private String task5;

    private String projectId;

    private String userId;
    
    public Task(String id, String startTime, String endTime, String task1, String task2, String task3, String task4,
			String task5, String projectId, String userId) {
		super();
		this.id = id;
		this.startTime = startTime;
		this.endTime = endTime;
		this.task1 = task1;
		this.task2 = task2;
		this.task3 = task3;
		this.task4 = task4;
		this.task5 = task5;
		this.projectId = projectId;
		this.userId = userId;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public String getTask1() {
        return task1;
    }

    public void setTask1(String task1) {
        this.task1 = task1 == null ? null : task1.trim();
    }

    public String getTask2() {
        return task2;
    }

    public void setTask2(String task2) {
        this.task2 = task2 == null ? null : task2.trim();
    }

    public String getTask3() {
        return task3;
    }

    public void setTask3(String task3) {
        this.task3 = task3 == null ? null : task3.trim();
    }

    public String getTask4() {
        return task4;
    }

    public void setTask4(String task4) {
        this.task4 = task4 == null ? null : task4.trim();
    }

    public String getTask5() {
        return task5;
    }

    public void setTask5(String task5) {
        this.task5 = task5 == null ? null : task5.trim();
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
}