package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.entity.Concluding;


/**
* @author Administrator
* @date 2019年9月26日
* @version 1.0
*/
public interface ConcludingService {
	/**
	 * @param concluding
	 * @return
	 */
	int addConcliuding(Concluding concluding);
	/**
	 * @param projectId
	 * @return
	 */
	void getConcludingByProjectId(Model model, String projectId);
	/**
	 * @param model
	 * @param id
	 */
	void getConcludingById(Model model, String id);
	/**
	 * @param concluding
	 * @return
	 */
	int updateConcluding(Concluding concluding);
	/**
	 * @param paddingMatter
	 */
	void addPaddingMatter(Concluding concluding);
}
