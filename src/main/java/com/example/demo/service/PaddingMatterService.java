package com.example.demo.service;

import org.springframework.ui.Model;

/**
* @author Administrator
* @date 2019年9月25日
* @version 1.0
*/
public interface PaddingMatterService {
	/**
	 * @param model
	 * @param userId
	 */
	void getCount(Model model, String userId);
	/**
	 * @param model
	 * @param userId
	 */
	void getMatters(Model model, String userId);
	
	/**
	 * @param linkId
	 */
	void updateMatter(String linkId);
}
