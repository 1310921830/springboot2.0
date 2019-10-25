package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Project;

/**
* @author Administrator
* @date 2019年9月20日
* @version 1.0
*/
public interface ProjectMapper {
	/**
	 * @param project
	 * @return影响条数
	 * 企业领导立项
	 */
	int saveProject(Project project); 
	
	/**
	 * @return 所有项目列表
	 * 企业领导查看
	 */
	List<Project> getAllProjects();
	
	/**
	 * @param deptManagerId
	 * @return 部门经理主管项目
	 */
	List<Project> getProjectsByDeptManagerId(String deptManagerId);
	/**
	 * @param projectManagerId
	 * @return 项目经理负责项目
	 */
	List<Project> getProjectsByProjectManagerId(String projectManagerId);
	
	/**
	 * @param userId
	 * @return项目成员所在项目
	 */
	List<Project> getSomeProjects(String userId);
	/**
	 * @param id
	 * @return 查询指定项目信息
	 */
	Project getProjectById(String id);
	/**
	 * @param project
	 * @return
	 */
	int updateProcess(Project project);
	/**
	 * @param project
	 * @return
	 */
	int updateProject(Project project);
}