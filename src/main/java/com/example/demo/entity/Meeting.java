package com.example.demo.entity;

public class Meeting {
    
	private String id;

    private String title;//会议名称

    private String date;//日期

    private String site;//地址

    private String minutedBy;//记录人  

    private String calledBy;//召集人

    private String startTime;//开始时间

    private String duration;//持续时长

    private String aim;//目标

    private String attenders;//参会人员

    private String materials;//发放材料

    private String speakingNotes;//发言记录

    private String decisions;//会议决定

    private String scope;//发放范围

    private String projectId;

    private String link;

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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site == null ? null : site.trim();
    }

    public String getMinutedBy() {
        return minutedBy;
    }

    public void setMinutedBy(String minutedBy) {
        this.minutedBy = minutedBy == null ? null : minutedBy.trim();
    }

    public String getCalledBy() {
        return calledBy;
    }

    public void setCalledBy(String calledBy) {
        this.calledBy = calledBy == null ? null : calledBy.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration == null ? null : duration.trim();
    }

    public String getAim() {
        return aim;
    }

    public void setAim(String aim) {
        this.aim = aim == null ? null : aim.trim();
    }

    public String getAttenders() {
        return attenders;
    }

    public void setAttenders(String attenders) {
        this.attenders = attenders == null ? null : attenders.trim();
    }

    public String getMaterials() {
        return materials;
    }

    public void setMaterials(String materials) {
        this.materials = materials == null ? null : materials.trim();
    }

    public String getSpeakingNotes() {
        return speakingNotes;
    }

    public void setSpeakingNotes(String speakingNotes) {
        this.speakingNotes = speakingNotes == null ? null : speakingNotes.trim();
    }

    public String getDecisions() {
        return decisions;
    }

    public void setDecisions(String decisions) {
        this.decisions = decisions == null ? null : decisions.trim();
    }

    public String getScope() {
        return scope;
    }

    public void setScope(String scope) {
        this.scope = scope == null ? null : scope.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }
}