package com.example.demo.service;



import org.springframework.ui.Model;

import com.example.demo.entity.BigMatter;


/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
public interface MatterService {
	/**
	 * @param matter
	 * @return
	 */
	int addMatter(BigMatter matter);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryMattersByProjectId(Model model, String projectId);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryPassMatters(Model model, String projectId);
	
	/**
	 * @param model
	 * @param id
	 */
	void queryMatterById(Model model, String id);
	/**
	 * @param matter
	 * @return
	 */
	int updateMatter(BigMatter matter);
	/**
	 * @param matter
	 */
	void addPaddingMatter(BigMatter matter);
}
