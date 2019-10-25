package com.example.demo.service;



import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.entity.Cost;

/**
* @author Administrator
* @date 2019年9月30日
* @version 1.0
*/
public interface CostService {
	/**
	 * @param cost
	 * @return
	 */
	int addCost(Cost cost);
	
	
	/**
	 * @param model
	 * @param httpSession
	 * @param projectId
	 */
	void queryCosts(Model model, HttpSession httpSession, String projectId);
	
	
	
	/**
	 * @param model
	 * @param id
	 */
	void queryCostById(Model model, String id);
	/**
	 * @param model
	 * @param projectId
	 */
	void querySum(Model model, String projectId);
	/**
	 * @param model
	 * @param projectId
	 */
	void querySumByWeek(Model model, String projectId);
	/**
	 * @param model
	 * @param projectId
	 */
	void querySumByMonth(Model model, String projectId);
}
