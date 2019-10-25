package com.example.demo.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.example.demo.entity.Task;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
public interface TaskService {
	/**
	 * @param task
	 * @return
	 */
	int addTask(Task task);
	/**
	 * @param model
	 * @param projectId
	 */
	void queryTasksByProjectId(Model model, String projectId);
	/**
	 * @param model
	 * @param projectId
	 */
	void queryTasksByUser(Model model, Map<String, Object> map);
	
	/**
	 * @param model
	 * @param id
	 */
	void queryTaskById(Model model, String id);
}
