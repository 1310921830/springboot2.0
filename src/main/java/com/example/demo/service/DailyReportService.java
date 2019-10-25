package com.example.demo.service;



import java.util.Map;

import org.springframework.ui.Model;

import com.example.demo.entity.DailyReport;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
public interface DailyReportService {
	/**
	 * @param report
	 * @return
	 */
	int addReport(DailyReport report);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryReportsByProjectId(Model model, Map<String, Object> map);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryPassReports(Model model, String projectId);
	
	/**
	 * @param model
	 * @param id
	 */
	void queryReportById(Model model, String id);
	/**
	 * @param report
	 * @return
	 */
	int updateReport(DailyReport report);
	/**
	 * @param report
	 */
	void addPaddingMatter(DailyReport report);
}
