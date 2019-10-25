package com.example.demo.dao;


import java.util.List;
import java.util.Map;

import com.example.demo.entity.Cost;



/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface CostMapper {
	/**
	 * @param cost
	 * @return
	 */
	int addCost(Cost cost);
	/**
	 * @param projectId
	 * @return
	 */
	List<Cost> queryCosts(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<Cost> queryCostsToDept(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<Cost> queryCostsToBoss(String projectId);
	/**
	 * @param id
	 * @return
	 */
	Cost queryCostById(String id);
	/**
	 * @param projectId
	 * @return
	 */
	Map<String, Object> querySum(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<Map<String, Object>> querySumByWeek(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<Map<String, Object>> querySumByMonth(String projectId);

}
