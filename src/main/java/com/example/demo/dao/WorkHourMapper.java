package com.example.demo.dao;

import com.example.demo.entity.WorkHour;

/**
* @author Administrator
* @date 2019年10月8日
* @version 1.0
*/
public interface WorkHourMapper {
	/**
	 * @param workHour
	 * @return
	 */
	int addHour(WorkHour workHour);
}
