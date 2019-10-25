package com.example.demo.service.impl;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dao.DailyReportMapper;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.entity.DailyReport;
import com.example.demo.entity.PaddingMatter;
import com.example.demo.service.DailyReportService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
@Service
public class DailyReportServiceImpl implements DailyReportService{
	@Autowired
	DailyReportMapper drm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public int addReport(DailyReport report) {
		String id = (new Date()).getTime() + "";
		String date = DateUtil.dateString1(new Date());
		report.setId(id);
		report.setDate(date);
		report.setIsCheck("否");
		int result = drm.addReport(report);
		if (result > 0) {
			addPaddingMatter(report);
		}
		return result;
	}

	@Override
	public void queryReportsByProjectId(Model model, Map<String, Object> map) {
		// TODO Auto-generated method stub
		model.addAttribute("dailyReports", drm.queryReportsByProjectId(map));
	}

	@Override
	public void queryPassReports(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("dailyReports", drm.queryPassReports(projectId));
	}

	@Override
	public void queryReportById(Model model, String id) {
		// TODO Auto-generated method stub
		DailyReport report = drm.queryReportById(id);
		model.addAttribute("dailyReport", report);
		if (null != report) {
			model.addAttribute("prepared", um.getUserById(report.getPreparedName()));
			model.addAttribute("checked", um.getUserById(report.getReviewedName()));
		}
	}

	@Override
	public int updateReport(DailyReport report) {
		// TODO Auto-generated method stub
		return drm.updateReport(report);
	}

	@Override
	public void addPaddingMatter(DailyReport report) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = report.getDate();
		String title = report.getTitle();
		String type = "日报";
		String linkId = report.getId();
		String checkById = report.getReviewedName();
		String projectId = report.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
		
	}
	
}
