package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.entity.Task;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface TaskMapper {
	/**
	 * @param task
	 * @return
	 */
	int addTask(Task task);
	/**
	 * @param projectId
	 * @return
	 */
	List<Task> queryTasksByProjectId(String projectId);
	/**
	 * @param map
	 * @return
	 */
	List<Task> queryTasksByUser(Map<String, Object> map);
	/**
	 * @param id
	 * @return
	 */
	Task queryTaskById(String id);
}
