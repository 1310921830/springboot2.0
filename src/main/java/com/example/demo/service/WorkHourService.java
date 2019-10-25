package com.example.demo.service;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.WorkHour;

/**
* @author Administrator
* @date 2019年10月8日
* @version 1.0
*/
public interface WorkHourService {
	/**
	 * @param workHour
	 * @return
	 */
	int addHour(WorkHour workHour);
	/**
	 * @param file
	 * @return
	 * 导入excel
	 */
	String ImportExcel(MultipartFile file);
}
