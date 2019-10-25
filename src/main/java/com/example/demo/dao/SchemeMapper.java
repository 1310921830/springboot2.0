package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Scheme;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface SchemeMapper {
	/**
	 * @param scheme
	 * @return
	 */
	int addScheme(Scheme scheme);
	/**
	 * @param projectId
	 * @return
	 */
	List<Scheme> querySchemesByProjectId(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<Scheme> queryPassSchemes(String projectId);
	/**
	 * @param id
	 * @return
	 */
	Scheme querySchemeById(String id);
	/**
	 * @param scheme
	 * @return
	 */
	int updateScheme(Scheme scheme);
}
