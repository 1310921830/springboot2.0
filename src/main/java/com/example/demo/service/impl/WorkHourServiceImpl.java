package com.example.demo.service.impl;


import java.io.InputStream;
import java.util.Date;
import java.util.UUID;


import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.WorkHourMapper;

import com.example.demo.entity.WorkHour;
import com.example.demo.service.WorkHourService;
import com.example.demo.util.DateUtil;

/**
 * @author Administrator
 * @date 2019年10月8日
 * @version 1.0
 */
@Service
public class WorkHourServiceImpl implements WorkHourService {
	@Autowired
	WorkHourMapper wm;

	@Override
	public int addHour(WorkHour workHour) {
		// TODO Auto-generated method stub
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		workHour.setId(id);
		return wm.addHour(workHour);
	}

	@Override
	public String ImportExcel(MultipartFile file) {
		try {
			// 文件流
			InputStream inputStream = file.getInputStream();
			// 工作簿
			Workbook workbook = WorkbookFactory.create(inputStream);
			
			// 工作表
			Sheet sheet = workbook.getSheetAt(0);
			// 行数
			int rows = sheet.getPhysicalNumberOfRows();
		
			if (rows > 1) {
				//
				for (int i = 1; i < rows; i++) {
					Row row = sheet.getRow(i);
					WorkHour workHour = new WorkHour();

					row.getCell(0).setCellType(CellType.STRING);
					String userId = row.getCell(0).getStringCellValue();
					workHour.setUserId(userId);
					
					row.getCell(1).setCellType(CellType.STRING);
					String projectId = row.getCell(1).getStringCellValue();
					workHour.setProjectId(projectId);
					
				
					Date date = row.getCell(2).getDateCellValue();
					workHour.setDate(DateUtil.dateString1(date));
					
					
					row.getCell(3).setCellType(CellType.STRING);
					Double hours = Double.parseDouble(row.getCell(3).getStringCellValue());
					workHour.setHours(hours);
					
					addHour(workHour);
				};

			};

			inputStream.close();
			return "01";
		} catch (Exception e) {
			return "03";
		}
		
	}

}
