package com.example.demo.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.dao.WeekReportMapper;
import com.example.demo.entity.PaddingMatter;
import com.example.demo.entity.WeekReport;
import com.example.demo.service.WeekReportService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
@Service
public class WeekReportServiceImpl implements WeekReportService{
	@Autowired
	WeekReportMapper wrm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public int addReport(WeekReport report) {
		String id = (new Date()).getTime() + "";
		String date = DateUtil.dateString1(new Date());
		report.setId(id);
		report.setDate(date);
		report.setIsCheck("否");
		int result = wrm.addReport(report);
		if (result > 0) {
			addPaddingMatter(report);
		}
		return result;
	}

	@Override
	public void queryReportsByProjectId(Model model, String projectId) {
		model.addAttribute("weekReports", wrm.queryReportsByProjectId(projectId));
		
	}

	@Override
	public void queryPassReports(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("weekReports", wrm.queryPassReports(projectId));
	}

	@Override
	public void queryReportById(Model model, String id) {
		WeekReport report = wrm.queryReportById(id);
		model.addAttribute("weekReport", report);
		if (null != report) {
			model.addAttribute("prepared", um.getUserById(report.getPreparedName()));
			model.addAttribute("checked", um.getUserById(report.getReviewedName()));
		}
		
	}

	@Override
	public int updateReport(WeekReport report) {
		// TODO Auto-generated method stub
		return wrm.updateReport(report);
	}

	@Override
	public void addPaddingMatter(WeekReport report) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = report.getDate();
		String title = report.getTitle();
		String type = "周报";
		String linkId = report.getId();
		String checkById = report.getReviewedName();
		String projectId = report.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
		
	}

}
