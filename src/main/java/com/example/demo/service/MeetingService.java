package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.entity.Meeting;

/**
* @author Administrator
* @date 2019年9月26日
* @version 1.0
*/
public interface MeetingService {
	/**
	 * @param meeting
	 */
	int addMeeting(Meeting meeting);
	/**
	 * @param model
	 * @param projectId
	 */
	void queryMeetingsByProjectId(Model model, String projectId);
	/**
	 * @param model
	 * @param id
	 */
	void queryMeetingById(Model model, String id);
}
