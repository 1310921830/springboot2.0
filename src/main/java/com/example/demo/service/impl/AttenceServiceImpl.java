package com.example.demo.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.AttenceMapper;
import com.example.demo.entity.Attence;
import com.example.demo.service.AttenceService;
import com.example.demo.util.DateUtil;

/**
* @author Administrator
* @date 2019年10月12日
* @version 1.0
*/
@Service
public class AttenceServiceImpl implements AttenceService{
	@Autowired
	AttenceMapper am;
	@Override
	public int addAttence(Attence attence) {
		String id = UUID.randomUUID().toString();
		id = id.replaceAll("-", "");
		String date = DateUtil.dateString1(new Date());
		attence.setId(id);
		attence.setDate(date);
		return am.addAttence(attence);
	}

	@Override
	public List<Attence> queryAttences(String userId) {
		// TODO Auto-generated method stub
		return am.queryAttences(userId);
	}

	@Override
	public void queryAttence(Model model, String userId) {
		Map<String, String> map= new HashMap<String, String>();
		map.put("userId", userId);
		String date = DateUtil.dateString1(new Date());
		map.put("date", date);
		model.addAttribute("attence", am.queryAttence(map));
		
	}

}
