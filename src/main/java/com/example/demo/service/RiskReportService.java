package com.example.demo.service;


import org.springframework.ui.Model;
import com.example.demo.entity.RiskReport;

/**
* @author Administrator
* @date 2019年9月27日
* @version 1.0
*/
public interface RiskReportService {
	/**
	 * @param riskReport
	 * @return
	 */
	int addReport(RiskReport riskReport);
	/**
	 * @param projectId
	 * @return
	 */
	void queryReportsByProjectId(Model model, String projectId);
	/**
	 * @param projectId
	 * @return
	 * 企业领导只需要看到已经通过的风险报告
	 */
	void queryPassReports(Model model, String projectId);
	/**
	 * @param id
	 * @return
	 * 报告信息
	 */
	void queryReportById(Model model, String id);
	/**
	 * @param riskReport
	 * @return
	 * 审核报告
	 */
	int updateReport(RiskReport riskReport);

	
	/**
	 * @param riskReport
	 */
	void addPaddingMatter(RiskReport riskReport);
}
