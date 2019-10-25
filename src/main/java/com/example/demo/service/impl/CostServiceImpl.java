package com.example.demo.service.impl;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.CostMapper;
import com.example.demo.entity.Cost;
import com.example.demo.entity.User;
import com.example.demo.service.CostService;

/**
* @author Administrator
* @date 2019年9月30日
* @version 1.0
*/
@Service
public class CostServiceImpl implements CostService{
	@Autowired
	CostMapper cm;
	@Override
	public int addCost(Cost cost) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		cost.setId(id);
		return cm.addCost(cost);
	}
	@Override
	public void queryCosts(Model model, HttpSession httpSession, String projectId) {
		// TODO Auto-generated method stub
		User user = (User) httpSession.getAttribute("user");
		if("企业领导".equals(user.getPosition())) {
			model.addAttribute("costs", cm.queryCostsToBoss(projectId));
		}else if("部门经理".equals(user.getPosition())) {
			model.addAttribute("costs",cm.queryCostsToDept(projectId));
		}else if("项目经理".equals(user.getPosition())) {
			model.addAttribute("costs",cm.queryCosts(projectId));
		}
	}
	

	

	@Override
	public void queryCostById(Model model, String id) {
		// TODO Auto-generated method stub
		model.addAttribute("cost", cm.queryCostById(id));
	}
	@Override
	public void querySum(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("sum", cm.querySum(projectId));
	}
	@Override
	public void querySumByWeek(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("sumWeek", cm.querySumByWeek(projectId));
	}
	@Override
	public void querySumByMonth(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("sumMonth", cm.querySumByMonth(projectId));
	}

	

}
