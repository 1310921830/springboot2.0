package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.entity.PaddingMatter;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface PaddingMatterMapper {
	/**
	 * @param paddingMatter
	 */
	void addPaddingMatter(PaddingMatter paddingMatter);
	/**
	 * @param userId
	 * @return
	 */
	Map<String, Object> getCount(String userId);
	/**
	 * @param userId
	 * @return
	 */
	List<PaddingMatter> getMatters(String userId);
	/**
	 * @param paddingMatter
	 */
	void updateMatter(String linkId);
}
