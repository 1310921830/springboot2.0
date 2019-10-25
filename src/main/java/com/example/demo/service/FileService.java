package com.example.demo.service;
/**
* @author Administrator
* @date 2019年9月26日
* @version 1.0
*/


import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	/**
	 * @param file
	 * @return
	 */
	Map<String, Object> uploadFile(MultipartFile file);
	/**
	 * @param request
	 * @param response
	 * @param path
	 */
	void downloadFile(HttpServletRequest request,
                      HttpServletResponse response, String path);
	
	
}
