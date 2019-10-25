package com.example.demo.entity;

/**
 * @author Administrator
 *
 */
public class PaddingMatter {
    private String id;
   
    private String date;//日期
    
    private String title;//标题

    private String type;//类型

    private String linkId;//关联id

    private String checkById;//审核人id
    
    private String projectId;//项目id
    
    private Integer status;//状态
    
    public PaddingMatter() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaddingMatter(String id, String date,String title, String type, String linkId, String checkById,String projectId,Integer status) {
		super();
		this.id = id;
		this.date = date;
		this.title = title;
		this.type = type;
		this.linkId = linkId;
		this.checkById = checkById;
		this.projectId = projectId;
		this.status = status;
	}

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getLinkId() {
        return linkId;
    }

    public void setLinkId(String linkId) {
        this.linkId = linkId == null ? null : linkId.trim();
    }

    public String getCheckById() {
        return checkById;
    }

    public void setCheckById(String checkById) {
        this.checkById = checkById == null ? null : checkById.trim();
    }

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}