package com.example.demo.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.example.demo.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.UserMapper;
import com.example.demo.entity.User;
import com.example.demo.service.UserService;
import com.example.demo.util.Md5Util;

/**
* @author Administrator
* @date 2019��8��26��
* @version 1.0
*/

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper um;
	@Override
	public int saveUser(User user) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = DateUtil.dateString1(new Date());
		String password=null;
		try {
			password = Md5Util.encrypt("111111");//����
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		user.setUserId(id);
		user.setPwd(password);

		return um.saveUser(user);
	}
	

	@Override
	public User getUser(Map<String, String> map) {
		String password=null;
		try {
			password = Md5Util.encrypt(map.get("pwd"));//����
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.put("pwd",password);
		return um.getUser(map);
	}

	
	@Override
	public void queryUsersByPosition(Model model) {
		model.addAttribute("deptManagers",um.queryUsersByPosition("部门经理") );
		model.addAttribute("projectManagers",um.queryUsersByPosition("项目经理") );
		model.addAttribute("emps",um.queryUsersByPosition("普通员工") );
		
	}

	@Override
	public void getDeptById(Model model, int deptNo) {
		// TODO Auto-generated method stub
		model.addAttribute("dept", um.getDeptById(deptNo));
	}

	@Override
	public int changeUserImg(String url, HttpSession httpSession) {
		// TODO Auto-generated method stub
		User user=(User) httpSession.getAttribute("user");
		user.setHeadPortrait(url);
		return um.updateUser(user);
	}

	@Override
	public void getDeptManager(Model model, String userId) {
		model.addAttribute("deptManager", um.getUserById(userId));
		
	}

	@Override
	public void getProjectManager(Model model, String userId) {
		model.addAttribute("projectManager", um.getUserById(userId));
		
	}

	@Override
	public void getUsersByStaff(Model model, String projectId) {
		model.addAttribute("users", um.getUsersByStaff(projectId));
		
	}

	@Override
	public User getBoss() {
		// TODO Auto-generated method stub
		return um.getBoss();
	}

	@Override
	public int updatePwd(String oldPwd, String newPwd, HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		System.out.println(oldPwd);
		
		try {
			System.out.println(Md5Util.encrypt(oldPwd));
			System.out.println(user.getPwd());
			if(user.getPwd().equals(Md5Util.encrypt(oldPwd))) {
				user.setPwd(Md5Util.encrypt(newPwd));
				return um.updateUser(user);
			}else {
				return 0;
			}
		} catch (UnsupportedEncodingException e) {
			return 0;
		}
		
	}

	@Override
	public User getUserById(String id) {
		
		return um.getUserById(id);
	}

	@Override
	public List<User> getAllUsers() {
		return um.getAllUsers();
	}
}
