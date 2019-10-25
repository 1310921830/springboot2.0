package com.example.demo.service.impl;

import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.example.demo.dao.PaddingMatterMapper;
import com.example.demo.dao.RiskReportMapper;
import com.example.demo.dao.UserMapper;
import com.example.demo.entity.PaddingMatter;
import com.example.demo.entity.RiskReport;
import com.example.demo.service.RiskReportService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年9月27日
* @version 1.0
*/
@Service
public class RiskReportServiceImpl implements RiskReportService{
	@Autowired
	RiskReportMapper rrm;
	@Autowired
	UserMapper um;
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public int addReport(RiskReport riskReport) {
		String id = (new Date()).getTime() + "";
		String date = DateUtil.dateString1(new Date());
		riskReport.setId(id);
		riskReport.setDate(date);
		riskReport.setIsCheck("否");
		int result = rrm.addReport(riskReport);
		if (result > 0) {
			addPaddingMatter(riskReport);
		}
		return result;
	}

	@Override
	public void queryReportsByProjectId(Model model, String projectId) {
		model.addAttribute("riskReports", rrm.queryReportsByProjectId(projectId));
		
	}

	@Override
	public void queryPassReports(Model model, String projectId) {
		model.addAttribute("riskReports", rrm.queryPassReports(projectId));
		
	}

	@Override
	public void queryReportById(Model model, String id) {
		RiskReport riskReport = rrm.queryReportById(id);
		model.addAttribute("riskReport", riskReport);
		if (null != riskReport) {
			model.addAttribute("prepared", um.getUserById(riskReport.getPreparedName()));
			model.addAttribute("checked", um.getUserById(riskReport.getReviewedName()));
		}
		
	}

	@Override
	public int updateReport(RiskReport riskReport) {
		
		return rrm.updateReport(riskReport);
	}

	@Override
	public void addPaddingMatter(RiskReport riskReport) {
		String id = (new Date()).getTime() + "";
		String date = riskReport.getDate();
		String title = riskReport.getTitle();
		String type = "风险报告";
		String linkId = riskReport.getId();
		String checkById = riskReport.getReviewedName();
		String projectId = riskReport.getProjectId();
		PaddingMatter paddingMatter = new PaddingMatter(id, date, title, type, linkId, checkById, projectId, 1);
		pmm.addPaddingMatter(paddingMatter);
		
	}

}
