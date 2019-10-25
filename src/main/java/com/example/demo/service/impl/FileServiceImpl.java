package com.example.demo.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.service.FileService;

/**
 * @author Administrator
 * @date 2019年9月26日
 * @version 1.0
 */
@Service
public class FileServiceImpl implements FileService {

	@Override
	public Map<String, Object> uploadFile(MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
		String fileName = "";
		if (file.isEmpty()) {
			return map;
		} else {
			// 原始文件名称
			String originalFilename = file.getOriginalFilename();
			// 后缀
			String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")).toLowerCase();

			// 保存文件名
			fileName = getFileName() + suffix;

			// 文件保存路径
			String filePath = "F:/imgs/";
			File f = new File("F:/imgs");
			if(!f.exists()){
				f.mkdirs();
			}
			File uploadPath = new File(filePath, fileName);
			try {
				// 新建文件
				uploadPath.createNewFile();
				// 上传
				file.transferTo(uploadPath);
			} catch (IOException e) {
				// TODO: handle exception
			}

			map.put("filename", fileName);
			map.put("filepath", filePath);
			return map;
		}
	}

	@Override
	public void downloadFile(HttpServletRequest request, HttpServletResponse response, String path) {
		// 
		File file = new File(path);
		String filename = path.substring(path.lastIndexOf("/") + 1);
		System.out.println(filename);
		try {
			if (!file.exists()) {
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(
						"<html><body><script type='text/javascript'>alert('文件不存在');</script></body></html>");
				response.getWriter().close();
				return;
			}
			// 
			filename = URLEncoder.encode(filename, "UTF-8");
			// 
			response.addHeader("Content-Disposition", "attachment;filename=" + filename);
			// 
			response.setContentType("multipart/form-data");
			// 
			FileInputStream in = new FileInputStream(file);
			// 
			OutputStream out = response.getOutputStream();
			// 
			byte buffer[] = new byte[1024]; // 
			int len = 0;
			// 
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
			// 
			in.close();
			// 
			out.close();
		} catch (IOException e) {
			
		}
		

	}

	public String getFileName() {
		SimpleDateFormat simpledateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		Random random = new Random();
		return simpledateFormat.format(new Date()) + random.nextInt(10000);
	}
	
	

	
}
