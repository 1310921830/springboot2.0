package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.BigMatter;






/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface MatterMapper {
	/**
	 * @param matter
	 * @return
	 */
	int addMatter(BigMatter matter);
	/**
	 * @param projectId
	 * @return
	 */
	List<BigMatter> queryMattersByProjectId(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<BigMatter> queryPassMatters(String projectId);
	/**
	 * @param id
	 * @return
	 */
	BigMatter queryMatterById(String id);
	/**
	 * @param matter
	 * @return
	 */
	int updateMatter(BigMatter matter);
}
