package com.example.demo.service.impl;

import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.TaskMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.entity.Task;
import com.example.demo.service.TaskService;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
@Service
public class TaskServiceImpl implements TaskService{
	@Autowired
	TaskMapper tm;
	@Autowired
	UserMapper um;
	@Override
	public int addTask(Task task) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		task.setId(id);
		return tm.addTask(task);
	}

	@Override
	public void queryTasksByProjectId(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("tasks", tm.queryTasksByProjectId(projectId));
	}

	@Override
	public void queryTasksByUser(Model model, Map<String, Object> map) {
		// TODO Auto-generated method stub
		model.addAttribute("tasks", tm.queryTasksByUser(map));
	}

	@Override
	public void queryTaskById(Model model, String id) {
		// TODO Auto-generated method stub
		Task task = tm.queryTaskById(id);
		if(null!=task) {
			model.addAttribute("projectStaff",um.getUserById(task.getUserId()));
		}
		model.addAttribute("task", tm.queryTaskById(id));
		
	}

}
