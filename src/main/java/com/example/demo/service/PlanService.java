package com.example.demo.service;

import org.springframework.ui.Model;


import com.example.demo.entity.Plan;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface PlanService {
	/**
	 * @param plan
	 * @return
	 */
	int addPlan(Plan plan);
	/**
	 * @param projectId
	 * @return
	 */
	void getPlanByProjectId(Model model, String projectId);
	/**
	 * @param model
	 * @param id
	 */
	void getPlanById(Model model, String id);
	/**
	 * @param plan
	 * @return
	 */
	int updatePlan(Plan plan);
	/**
	 * @param paddingMatter
	 */
	void addPaddingMatter(Plan plan);
	
}
