package com.example.demo.service;



import org.springframework.ui.Model;
import com.example.demo.entity.WeekReport;

/**
* @author Administrator
* @date 2019年9月29日
* @version 1.0
*/
public interface WeekReportService {
	/**
	 * @param report
	 * @return
	 */
	int addReport(WeekReport report);
	
	/**
	 * @param model
	 * @param projectId
	 */
	void queryReportsByProjectId(Model model, String projectId);
	
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
	int updateReport(WeekReport report);
	/**
	 * @param report
	 */
	void addPaddingMatter(WeekReport report);
}
