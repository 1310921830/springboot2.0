package com.example.demo.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dao.MeetingMapper;
import com.example.demo.entity.Meeting;
import com.example.demo.service.MeetingService;

/**
* @author Administrator
* @date 2019年9月26日
* @version 1.0
*/
@Service
public class MeetingServiceImpl implements MeetingService{
	@Autowired
	MeetingMapper mm;
	@Override
	public int addMeeting(Meeting meeting) {
		String id = (new Date()).getTime() + "";
		meeting.setId(id);
		return mm.addMeeting(meeting);
	}

	@Override
	public void queryMeetingsByProjectId(Model model, String projectId) {
		// TODO Auto-generated method stub
		model.addAttribute("meetings", mm.queryMeetingsByProjectId(projectId));
	}

	@Override
	public void queryMeetingById(Model model, String id) {
		model.addAttribute("meeting", mm.queryMeetingById(id));
		
	}

}
