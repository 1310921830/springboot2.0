package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import com.example.demo.entity.DailyReport;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface DailyReportMapper {
	/**
	 * @param report
	 * @return
	 */
	int addReport(DailyReport report);
	/**
	 * @param projectId
	 * @return
	 */
	List<DailyReport> queryReportsByProjectId(Map<String, Object> map);
	/**
	 * @param projectId
	 * @return
	 */
	List<DailyReport> queryPassReports(String projectId);
	/**
	 * @param id
	 * @return
	 */
	DailyReport queryReportById(String id);
	/**
	 * @param report
	 * @return
	 */
	int updateReport(DailyReport report);
}
