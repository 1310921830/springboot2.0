package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.entity.Attence;



/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface AttenceMapper {
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
	 * @param map
	 * @return
	 */
	Attence queryAttence(Map<String, String> map);
}
