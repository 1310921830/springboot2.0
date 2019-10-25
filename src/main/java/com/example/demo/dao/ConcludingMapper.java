package com.example.demo.dao;

import com.example.demo.entity.Concluding;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface ConcludingMapper {
	
	/**
	 * @param concluding
	 * @return
	 */
	int addConcliuding(Concluding concluding);
	/**
	 * @param projectId
	 * @return
	 */
	Concluding getConcludingByProjectId(String projectId);
	/**
	 * @param id
	 * @return
	 */
	Concluding getConcludingById(String id);
	
	/**
	 * @param concluding
	 * @return
	 */
	int updateConcluding(Concluding concluding);
	/**
	 * @param projectId
	 */
	void deleteConcluding(String projectId);
}
