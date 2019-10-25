package com.example.demo.dao;

import java.util.List;

import com.example.demo.entity.Meeting;

/**
* @author Administrator
* @date 2019年9月24日
* @version 1.0
*/
public interface MeetingMapper {
	/**
	 * @param meeting
	 * @return
	 */
	int addMeeting(Meeting meeting);
	/**
	 * @param projectId
	 * @return项目相关联的会议记录列表
	 */
	List<Meeting> queryMeetingsByProjectId(String projectId);
	/**
	 * @param id
	 * @return 指定会议记录信息
	 */
	Meeting queryMeetingById(String id);
}
