package com.example.demo.service.impl;

import java.util.Date;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dao.ProjectMapper;
import com.example.demo.dao.StaffMapper;
import com.example.demo.entity.Project;
import com.example.demo.entity.Staff;
import com.example.demo.service.ProjectService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月20日
* @version 1.0
*/
@Service
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	ProjectMapper pm;
	@Autowired
	StaffMapper sm;
	@Override
	public int saveProject(Project project,String[] staffs) {
		
		String id = (new Date()).getTime()+"";
		String date = DateUtil.dateString1(new Date());
		project.setId(id);
		project.setEstablishedTime(date);
		project.setStatus("启动");
		int result=pm.saveProject(project);
		if(result>0) {
			//进行人员分配
			for(String str:staffs) {
				String id1 = UUID.randomUUID().toString();
				id1 = id1.replaceAll("-", "");
				Staff staff = new Staff(id1, id, str, 0d);
				sm.addStaff(staff);
			}
		}
		return result;
	}

	@Override
	public void getAllProjects(Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("projects", pm.getAllProjects());
	}

	@Override
	public void getProjectsByDeptManagerId(Model model, String deptManagerId) {
		model.addAttribute("projects", pm.getProjectsByDeptManagerId(deptManagerId));
		
	}

	@Override
	public void getProjectsByProjectManagerId(Model model, String projectManagerId) {
		model.addAttribute("projects", pm.getProjectsByProjectManagerId(projectManagerId));
		
	}

	@Override
	public Project getProjectById(String id) {
		return pm.getProjectById(id);
		
	}

	@Override
	public void getSomeProjects(Model model, String userId) {
		model.addAttribute("projects", pm.getSomeProjects(userId));
		
	}

	@Override
	public int updateProcess(Project project) {
		// TODO Auto-generated method stub
		return pm.updateProcess(project);
	}

	@Override
	public int updateProject(Project project) {
		// TODO Auto-generated method stub
		return pm.updateProject(project);
	}

}
