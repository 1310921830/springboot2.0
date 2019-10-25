package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.RiskReport;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface RiskReportMapper {
	/**
	 * @param riskReport
	 * @return
	 */
	int addReport(RiskReport riskReport);
	/**
	 * @param projectId
	 * @return
	 */
	List<RiskReport> queryReportsByProjectId(String projectId);
	/**
	 * @param projectId
	 * @return
	 * 企业领导只需要看到已经通过的风险报告
	 */
	List<RiskReport> queryPassReports(String projectId);
	/**
	 * @param id
	 * @return
	 * 报告信息
	 */
	RiskReport queryReportById(String id);
	/**
	 * @param riskReport
	 * @return
	 * 审核报告
	 */
	int updateReport(RiskReport riskReport);
}
