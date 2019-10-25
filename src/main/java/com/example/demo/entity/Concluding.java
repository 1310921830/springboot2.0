package com.example.demo.entity;

public class Concluding {
    private String id;

    private String title;//标题
    
    private String date;//日期

    private String startTime;//开始时间

    private String exceptedFinishDate;//计划完成时间

    private String actualFinishDate;//实际完成时间

    private String timeAnalysis;//时间分析

    private Double expectedExpense;//计划花费

    private Double actualExpense;//实际花费

    private String costAnalysis;//费用分析

    private String exceptDeliverables;//计划完成成果

    private String actualDeliverables;//实际完成成果

    private String undeliverables;//未完成

    private String deliverablesAnalysis;//完成度分析

    private String experience;//总结经验

    private String projectId;//项目id

    private String isCheck;//是否审核

    private String isPass;//是否通过

    private String opinion;//批注

    private String link;//附件地址

    private String preparedName;//制作人

    private String reviewedName;//审核人

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getExceptedFinishDate() {
        return exceptedFinishDate;
    }

    public void setExceptedFinishDate(String exceptedFinishDate) {
        this.exceptedFinishDate = exceptedFinishDate == null ? null : exceptedFinishDate.trim();
    }

    public String getActualFinishDate() {
        return actualFinishDate;
    }

    public void setActualFinishDate(String actualFinishDate) {
        this.actualFinishDate = actualFinishDate == null ? null : actualFinishDate.trim();
    }

    public String getTimeAnalysis() {
        return timeAnalysis;
    }

    public void setTimeAnalysis(String timeAnalysis) {
        this.timeAnalysis = timeAnalysis == null ? null : timeAnalysis.trim();
    }

    public Double getExpectedExpense() {
        return expectedExpense;
    }

    public void setExpectedExpense(Double expectedExpense) {
        this.expectedExpense = expectedExpense;
    }

    public Double getActualExpense() {
        return actualExpense;
    }

    public void setActualExpense(Double actualExpense) {
        this.actualExpense = actualExpense;
    }

    public String getCostAnalysis() {
        return costAnalysis;
    }

    public void setCostAnalysis(String costAnalysis) {
        this.costAnalysis = costAnalysis == null ? null : costAnalysis.trim();
    }

    public String getExceptDeliverables() {
        return exceptDeliverables;
    }

    public void setExceptDeliverables(String exceptDeliverables) {
        this.exceptDeliverables = exceptDeliverables == null ? null : exceptDeliverables.trim();
    }

    public String getActualDeliverables() {
        return actualDeliverables;
    }

    public void setActualDeliverables(String actualDeliverables) {
        this.actualDeliverables = actualDeliverables == null ? null : actualDeliverables.trim();
    }

    public String getUndeliverables() {
        return undeliverables;
    }

    public void setUndeliverables(String undeliverables) {
        this.undeliverables = undeliverables == null ? null : undeliverables.trim();
    }

    public String getDeliverablesAnalysis() {
        return deliverablesAnalysis;
    }

    public void setDeliverablesAnalysis(String deliverablesAnalysis) {
        this.deliverablesAnalysis = deliverablesAnalysis == null ? null : deliverablesAnalysis.trim();
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience == null ? null : experience.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getIsCheck() {
        return isCheck;
    }

    public void setIsCheck(String isCheck) {
        this.isCheck = isCheck == null ? null : isCheck.trim();
    }

    public String getIsPass() {
        return isPass;
    }

    public void setIsPass(String isPass) {
        this.isPass = isPass == null ? null : isPass.trim();
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion == null ? null : opinion.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getPreparedName() {
        return preparedName;
    }

    public void setPreparedName(String preparedName) {
        this.preparedName = preparedName == null ? null : preparedName.trim();
    }

    public String getReviewedName() {
        return reviewedName;
    }

    public void setReviewedName(String reviewedName) {
        this.reviewedName = reviewedName == null ? null : reviewedName.trim();
    }

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}