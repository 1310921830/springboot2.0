package com.example.demo.service;



import java.util.List;


import org.springframework.ui.Model;

import com.example.demo.entity.Attence;

/**
* @author Administrator
* @date 2019年10月12日
* @version 1.0
*/
public interface AttenceService {
	/**
	 * @param attence
	 * @return
	 */
	int addAttence(Attence attence);
	
	/**
	 * @param userId
	 * @return
	 */
	List<Attence> queryAttences(String userId);
	
	/**
	 * @param model
	 * @param userId
	 * @param date
	 */
	void queryAttence(Model model, String userId);
}
