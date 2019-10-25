package com.example.demo.dao;

import com.example.demo.entity.Plan;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface PlanMapper {
	/**
	 * @param plan
	 * @return
	 */
	int addPlan(Plan plan);
	/**
	 * @param projectId
	 * @return
	 */
	Plan getPlanByProjectId(String projectId);
	/**
	 * @param id
	 * @return
	 */
	Plan getPlanById(String id);
	/**
	 * @param plan
	 * @return
	 */
	int updatePlan(Plan plan);
	/**
	 * @param id
	 */
	void deletePlan(String projectId);
}
