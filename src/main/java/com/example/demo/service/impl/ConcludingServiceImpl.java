package com.example.demo.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.ConcludingMapper;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.entity.Concluding;
import com.example.demo.entity.PaddingMatter;

import com.example.demo.service.ConcludingService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月26日
* @version 1.0
*/
@Service
public class ConcludingServiceImpl implements ConcludingService{
	@Autowired
	ConcludingMapper cm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	
	@Override
	public int addConcliuding(Concluding concluding) {
		//先删除之前的结题报告
		cm.deleteConcluding(concluding.getProjectId());
		String id = (new Date()).getTime() + "";
		String date = DateUtil.dateString1(new Date());
		concluding.setId(id);
		concluding.setDate(date);
		concluding.setIsCheck("否");
		int result = cm.addConcliuding(concluding);
		if (result > 0) {
			addPaddingMatter(concluding);
		}
		return result;
	}

	@Override
	public void getConcludingByProjectId(Model model, String projectId) {
		Concluding concluding = cm.getConcludingByProjectId(projectId);
		model.addAttribute("concluding", concluding);
		if (null != concluding) {
			model.addAttribute("prepared", um.getUserById(concluding.getPreparedName()));
			model.addAttribute("checked", um.getUserById(concluding.getReviewedName()));
		}
		
	}

	@Override
	public void getConcludingById(Model model, String id) {
		Concluding concluding = cm.getConcludingById(id);
		model.addAttribute("concluding", concluding);
		if (null != concluding) {
			model.addAttribute("prepared", um.getUserById(concluding.getPreparedName()));
			model.addAttribute("checked", um.getUserById(concluding.getReviewedName()));
		}
		
	}

	@Override
	public int updateConcluding(Concluding concluding) {
		// TODO Auto-generated method stub
		return cm.updateConcluding(concluding);
	}

	@Override
	public void addPaddingMatter(Concluding concluding) {
		String id = (new Date()).getTime() + "";
		String date = concluding.getDate();
		String title = concluding.getTitle();
		String type = "结题报告";
		String linkId = concluding.getId();
		String checkById = concluding.getReviewedName();
		String projectId = concluding.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
		
	}

}
