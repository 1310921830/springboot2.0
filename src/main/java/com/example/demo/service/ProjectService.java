package com.example.demo.service;



import org.springframework.ui.Model;

import com.example.demo.entity.Project;

/**
* @author Administrator
* @date 2019年9月20日
* @version 1.0
*/
public interface ProjectService {
	/**
	 * @param project
	 * @return影响条数
	 * 企业领导立项
	 */
	int saveProject(Project project, String[] staffs);
	
	
	/**
	 * @param model
	 * 加载所有项目
	 */
	void getAllProjects(Model model);
	
	/**
	 * @param model
	 * @param deptManagerId
	 */
	void getProjectsByDeptManagerId(Model model, String deptManagerId);
	
	/**
	 * @param model
	 * @param projectManagerId
	 */
	void getProjectsByProjectManagerId(Model model, String projectManagerId);
	/**
	 * @param model
	 * @param userId
	 */
	void getSomeProjects(Model model, String userId);
	/**
	 * @param model
	 * @param id
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
