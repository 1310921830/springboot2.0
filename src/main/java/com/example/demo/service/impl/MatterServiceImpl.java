package com.example.demo.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.MatterMapper;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.entity.BigMatter;
import com.example.demo.entity.PaddingMatter;

import com.example.demo.service.MatterService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/

@Service
public class MatterServiceImpl implements MatterService{
	@Autowired
	MatterMapper mm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public int addMatter(BigMatter matter) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = DateUtil.dateString1(new Date());
		matter.setId(id);
		matter.setDate(date);
		matter.setIsCheck("否");
		int result = mm.addMatter(matter);
		if (result > 0) {
			addPaddingMatter(matter);
		}
		return result;
	}

	@Override
	public void queryMattersByProjectId(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("matters", mm.queryMattersByProjectId(projectId));
	}

	@Override
	public void queryPassMatters(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("matters", mm.queryPassMatters(projectId));
	}

	@Override
	public void queryMatterById(Model model, String id) {
		BigMatter matter = mm.queryMatterById(id);
		model.addAttribute("matter", matter);
		
		if (null != matter) {
			model.addAttribute("prepared", um.getUserById(matter.getPreparedName()));
			model.addAttribute("checked", um.getUserById(matter.getReviewedName()));
		}
		
	}

	@Override
	public int updateMatter(BigMatter matter) {
		
		return mm.updateMatter(matter);
	}

	@Override
	public void addPaddingMatter(BigMatter matter) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = matter.getDate();
		String title = matter.getTitle();
		String type = "重大事项";
		String linkId = matter.getId();
		String checkById = matter.getReviewedName();
		String projectId = matter.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
		
	}

}
