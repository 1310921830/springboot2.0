package com.example.demo.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.SchemeMapper;
import com.example.demo.dao.UserMapper;

import com.example.demo.entity.PaddingMatter;
import com.example.demo.entity.Scheme;
import com.example.demo.service.SchemeService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年10月8日
* @version 1.0
*/
@Service
public class SchemeServiceImpl implements SchemeService{
	@Autowired
	SchemeMapper sm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public int addScheme(Scheme scheme) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = DateUtil.dateString1(new Date());
		scheme.setId(id);
		scheme.setDate(date);
		scheme.setIsCheck("否");
		int result = sm.addScheme(scheme);
		if (result > 0) {
			addPaddingMatter(scheme);
		}
		return result;
	}

	@Override
	public void querySchemesByProjectId(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("schemes", sm.querySchemesByProjectId(projectId));
	}

	@Override
	public void queryPassSchemes(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("schemes", sm.queryPassSchemes(projectId));
	}

	@Override
	public void querySchemeById(Model model, String id) {
		// TODO Auto-generated method stub
		Scheme scheme = sm.querySchemeById(id);
		model.addAttribute("scheme", scheme);
		
		if (null != scheme) {
			model.addAttribute("prepared", um.getUserById(scheme.getPreparedName()));
			model.addAttribute("checked", um.getUserById(scheme.getReviewedName()));
		}
	}

	@Override
	public int updateScheme(Scheme scheme) {
		// TODO Auto-generated method stub
		return sm.updateScheme(scheme);
	}

	@Override
	public void addPaddingMatter(Scheme scheme) {
		// TODO Auto-generated method stub
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = scheme.getDate();
		String title = scheme.getTitle();
		String type = "奖惩/绩效";
		String linkId = scheme.getId();
		String checkById = scheme.getReviewedName();
		String projectId = scheme.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
	}

}
