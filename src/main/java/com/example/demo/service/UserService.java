package com.example.demo.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.entity.User;

/**
* @author Administrator
* @date 2019��8��26��
* @version 1.0
*/
public interface UserService {
	
	/**
	 * @param user
	 * @return
	 */
	int saveUser(User user);
	
	/**
	 * @param map
	 * @return
	 */
	User getUser(Map<String, String> map);
	/**
	 * @param model
	 * @param projectId
	 */
	void getUsersByStaff(Model model, String projectId);
	/**
	 * @param model
	 *
	 */
	void queryUsersByPosition(Model model);
	/**
	 * @param model
	 * @param deptNo
	 */
	void getDeptById(Model model, int deptNo);
	/**
	 * @param url
	 * @param httpSession
	 * @return
	 */
	int changeUserImg(String url, HttpSession httpSession);
	/**
	 * @param oldPwd
	 * @param newPwd
	 * @param httpSession
	 * @return
	 */
	int updatePwd(String oldPwd, String newPwd, HttpSession httpSession);
	/**
	 * @param model
	 * @param userId
	 */
	void getDeptManager(Model model, String userId);
	/**
	 * @param model
	 * @param userId
	 */
	void getProjectManager(Model model, String userId);
	/**
	 * @return
	 */
	User getBoss();
	/**
	 * @param id
	 * @return
	 */
	User getUserById(String id);
	/*
	* @Param: []
	* @return: java.util.List<com.example.demo.entity.User>
	* @Author: XuXingxing
	* @Date: 2019-10-25 
	*/
	List<User> getAllUsers();
}
