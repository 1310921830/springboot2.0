package com.example.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.PaddingMatterMapper;

import com.example.demo.service.PaddingMatterService;

/**
* @author Administrator
* @date 2019年9月25日
* @version 1.0
*/
@Service
public class PaddingMatterServiceImpl implements PaddingMatterService{
	@Autowired
	PaddingMatterMapper pmm;
	@Override
	public void getCount(Model model, String userId) {
		// TODO Auto-generated method stub
		model.addAttribute("count", pmm.getCount(userId));
	}
	@Override
	public void getMatters(Model model, String userId) {
		model.addAttribute("paddingMatters", pmm.getMatters(userId));
		
	}
	@Override
	public void updateMatter(String linkId) {
		// TODO Auto-generated method stub
		pmm.updateMatter(linkId);
	}
	

}
