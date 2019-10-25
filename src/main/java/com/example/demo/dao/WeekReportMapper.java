package com.example.demo.dao;

import java.util.List;
import com.example.demo.entity.WeekReport;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface WeekReportMapper {
	/**
	 * @param report
	 * @return
	 */
	int addReport(WeekReport report);
	/**
	 * @param projectId
	 * @return
	 */
	List<WeekReport> queryReportsByProjectId(String projectId);
	/**
	 * @param projectId
	 * @return
	 */
	List<WeekReport> queryPassReports(String projectId);
	/**
	 * @param id
	 * @return
	 */
	WeekReport queryReportById(String id);
	/**
	 * @param report
	 * @return
	 */
	int updateReport(WeekReport report);
}
