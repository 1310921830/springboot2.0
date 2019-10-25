package com.example.demo.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.example.demo.entity.Attence;
import com.example.demo.entity.BigMatter;
import com.example.demo.entity.Concluding;
import com.example.demo.entity.Cost;
import com.example.demo.entity.DailyReport;
import com.example.demo.entity.Meeting;
import com.example.demo.entity.Plan;
import com.example.demo.entity.Project;
import com.example.demo.entity.RiskReport;
import com.example.demo.entity.Scheme;
import com.example.demo.entity.Task;
import com.example.demo.entity.User;
import com.example.demo.entity.WeekReport;
import com.example.demo.entity.WorkHour;
import com.example.demo.service.AttenceService;
import com.example.demo.service.ConcludingService;
import com.example.demo.service.CostService;
import com.example.demo.service.DailyReportService;
import com.example.demo.service.FileService;
import com.example.demo.service.MatterService;
import com.example.demo.service.MeetingService;
import com.example.demo.service.PaddingMatterService;
import com.example.demo.service.PlanService;
import com.example.demo.service.ProjectService;
import com.example.demo.service.RiskReportService;
import com.example.demo.service.SchemeService;
import com.example.demo.service.TaskService;
import com.example.demo.service.UserService;
import com.example.demo.service.WeekReportService;
import com.example.demo.service.WorkHourService;


/**
 * @author Administrator
 *
 */
@Controller
@Api(value = "工具类管理", protocols = "http/https", tags = "工具类管理【xk】")
public class MainControl {
	@Autowired
	FileService fs;// 文件service接口
	@Autowired
	UserService us;// 用户service接口
	@Autowired
	ProjectService ps;// 项目service接口
	@Autowired
	PlanService planService;// 项目计划service接口
	@Autowired
	PaddingMatterService pms;// 待办事项service接口
	@Autowired
	ConcludingService cs;// 结题报告service接口
	@Autowired
	MeetingService ms;// 会议记录service接口
	@Autowired
	RiskReportService rrs;// 风险报告service接口
	@Autowired
	TaskService ts;// 任务service接口
	@Autowired
	MatterService matterService;// 重大事项service接口
	@Autowired
	DailyReportService drs;// 日报service接口
	@Autowired
	WeekReportService wrs;// 周报service接口
	@Autowired
	CostService costService;// 项目支出service接口
	@Autowired
	SchemeService ss;// 奖惩绩效service接口
	@Autowired
	WorkHourService ws;// 工时service接口
	@Autowired
	AttenceService as;// 考勤service接口
	// 首页

	@GetMapping(value = "/login")
	@ApiOperation(httpMethod = "GET",value = "登陆页面",notes = "获取登录页面")
	public String showIndex(Model model) {

		return "login";
	}

	// 登录进入主页
	@PostMapping(value = "/login")
	@ApiOperation(httpMethod = "POST",value = "登陆验证接口",notes = "登录成功进入index首页")
	public String login(@RequestParam Map<String, String> map, HttpSession httpSession, Model model) {

		User user = us.getUser(map);
		if (null == user) {
			return "login";
		}
		httpSession.setAttribute("user", user);
		User boss = us.getBoss();
		httpSession.setAttribute("boss", boss);
		return "index";
	}

	// 上面
	@GetMapping(value = "/top")
	public String top() {
		return "top";
	}

	// 左侧菜单栏
	@GetMapping(value = "/left")
	public String left(Model model, HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("user");
		pms.getCount(model, user.getUserId());
		return "left";
	}

	// 右
	@GetMapping(value = "/right")
	public String right() {
		return "right";
	}

	// 下
	@GetMapping(value = "/bottom")
	public String bottom() {
		return "bottom";
	}

	// 待办事项列表页面
	@GetMapping(value = "/paddingMatters")
	public String paddingMatters(Model model, String userId) {

		pms.getMatters(model, userId);
		return "paddingMatters";
	}

	// 退出
	@GetMapping(value = "/loginout")
	public String loginOut(HttpSession httpSession) {
		httpSession.removeAttribute("user");
		return "logout";
	}

	// 查看个人信息
	@GetMapping(value = "/userInfo")
	public String userInfo(Model model, int deptNo) {
		us.getDeptById(model, deptNo);
		return "userInfo";
	}

	// 更改头像
	@ResponseBody
	@RequestMapping(value = "/changeImg")
	public int changeImg(String url, HttpSession httpSession) {

		return us.changeUserImg(url, httpSession);
	}

	// 更改密码
	@ResponseBody
	@PostMapping(value = "/updatePwd")
	public int updatePwd(String oldPwd, String newPwd, HttpSession httpSession) {

		return us.updatePwd(oldPwd, newPwd, httpSession);
	}

	// 立项页面
	@GetMapping(value = "/saveProject")
	public String saveProject(Model model) {
		us.queryUsersByPosition(model);
		return "saveProject";
	}

	// 企业领导立项
	@ResponseBody
	@PostMapping(value = "/saveProject")
	public int saveProject(Project project, String[] staffs) {
		return ps.saveProject(project, staffs);
	}

	// 企业领导查看所有项目
	@GetMapping(value = "/getAllProjects")
	public String getAllProjects(Model model) {
		ps.getAllProjects(model);
		return "showProjects";
	}

	// 部门经理查看项目
	@GetMapping(value = "/getDeptProjects")
	public String getDeptProjects(Model model, String deptMgId) {
		ps.getProjectsByDeptManagerId(model, deptMgId);
		return "showProjects";
	}

	// 项目经理查看项目
	@GetMapping(value = "/getProjects")
	public String getProjects(Model model, String pjMgId) {
		ps.getProjectsByProjectManagerId(model, pjMgId);
		return "showProjects";
	}

	// 项目成员查看项目
	@GetMapping(value = "/getSomeProjects")
	public String getSomeProjects(Model model, String userId) {
		ps.getSomeProjects(model, userId);
		return "showProjects";
	}

	// 查看项目详细信息
	@GetMapping(value = "/projectDetail")
	public String projectDetail(String id, Model model) {
		// 项目信息
		Project project = ps.getProjectById(id);
		model.addAttribute("project", project);
		// 部门经理和项目经理
		us.getDeptManager(model, project.getDeptManagerId());
		us.getProjectManager(model, project.getProjectManagerId());
		// 项目成员
		us.getUsersByStaff(model, id);
		//
		return "projectDetail";
	}

	// 项目经理项目计划页面
	@GetMapping(value = "/addPlan")
	public String addPlan(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addPlan";
	}

	// 项目经理提交项目计划
	@ResponseBody
	@PostMapping(value = "/addPlan")
	public int addPlan(Plan plan) {
		int result = planService.addPlan(plan);
		if (result > 0) {
			Project project = new Project();
			project.setId(plan.getProjectId());
			project.setStatus("进行");
			ps.updateProject(project);
		}
		return result;
	}

	// 部门经理审核项目计划
	@ResponseBody
	@PostMapping(value = "/updatePlan")
	public int updatePlan(Plan plan) {
		int result = planService.updatePlan(plan);
		if(result>0){
			pms.updateMatter(plan.getId());
		}
		return result;
	}

	// 项目计划查看
	@GetMapping(value = "/showPlan")
	public String showPlan(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		planService.getPlanByProjectId(model, projectId);
		return "showPlan";
	}

	// 从未审核事项到项目计划
	@GetMapping(value = "/getPlan")
	public String getPlan(Model model, String id, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		planService.getPlanById(model, id);
		return "showPlan";
	}

	// 项目经理项目总结页面
	@GetMapping(value = "/addConcluding")
	public String addConcluding(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addConcluding";
	}

	// 项目经理提交结题报告
	@ResponseBody
	@PostMapping(value = "/addConcluding")
	public int addConcluding(Concluding concluding) {
		int result = cs.addConcliuding(concluding);
		if (result > 0) {
			Project project = new Project();
			project.setId(concluding.getProjectId());
			project.setStatus("完成");
			ps.updateProject(project);
		}
		return cs.addConcliuding(concluding);
	}

	// 企业领导审核结题报告
	@ResponseBody
	@PostMapping(value = "/updateConcluding")
	public int updateConcluding(Concluding concluding) {
		int result = cs.updateConcluding(concluding);
		if (result > 0) {
			pms.updateMatter(concluding.getId());
		}
		return result;
	}

	// 结题报告查看
	@GetMapping(value = "/showConcluding")
	public String showConcluding(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		cs.getConcludingByProjectId(model, projectId);
		return "showConcluding";
	}

	// 从未审核事项到结题报告
	@GetMapping(value = "/getConcluding")
	public String getConcluding(Model model, String id, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		cs.getConcludingById(model, id);
		return "showConcluding";
	}

	// 项目经理会议记录页面
	@GetMapping(value = "/addMeeting")
	public String addMeeting(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addMeeting";
	}

	// 项目经理提交会议记录
	@ResponseBody
	@PostMapping(value = "/addMeeting")
	public int addMeeting(Meeting meeting) {
		return ms.addMeeting(meeting);
	}

	// 会议记录列表
	@GetMapping(value = "/showMeetings")
	public String showMeetings(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		ms.queryMeetingsByProjectId(model, projectId);
		return "showMeetings";
	}

	// 会议记录详细信息
	@GetMapping(value = "/meetingDetail")
	public String meetingDetail(Model model, String projectId, String id) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		ms.queryMeetingById(model, id);
		return "meetingDetail";
	}

	// 风险报告提交页面
	@GetMapping(value = "/addRiskReport")
	public String addRiskReport(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addRiskReport";
	}

	// 项目经理提交风险报告
	@ResponseBody
	@PostMapping(value = "/addRiskReport")
	public int addRiskReport(RiskReport riskReport) {
		return rrs.addReport(riskReport);
	}

	// 部门经理审核风险报告
	@ResponseBody
	@PostMapping(value = "/updateRisk")
	public int updateRisk(RiskReport riskReport) {
		int result = rrs.updateReport(riskReport);
		if (result > 0) {
			pms.updateMatter(riskReport.getId());
		}
		return result;
	}

	// 项目经理风险报告列表
	@GetMapping(value = "/showRiskReports")
	public String showRiskReports(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		rrs.queryReportsByProjectId(model, projectId);
		return "riskReports";
	}

	// 其他人风险报告列表
	@GetMapping(value = "/getRiskReports")
	public String getRiskReports(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		rrs.queryPassReports(model, projectId);
		;
		return "riskReports";
	}

	// 风险报告详细信息
	@GetMapping(value = "/riskReportDetail")
	public String riskReportDetail(Model model, String projectId, String id) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		rrs.queryReportById(model, id);
		return "riskReport";
	}

	// 项目经理分配任务
	@GetMapping(value = "/addTask")
	public String addTask(Model model, String projectId, String userId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		model.addAttribute("projectStaff", us.getUserById(userId));
		return "addTask";
	}

	// 项目经理提交任务
	@ResponseBody
	@PostMapping(value = "/addTask")
	public int addTask(Task task) {
		return ts.addTask(task);
	}

	// 任务列表
	@GetMapping(value = "/queryTasks")
	public String queryTasks(@RequestParam Map<String, Object> map, Model model) {
		// 项目信息

		model.addAttribute("project", ps.getProjectById((String) map.get("projectId")));
		ts.queryTasksByUser(model, map);
		return "taskList";
	}

	// 任务详细信息
	@GetMapping(value = "/taskDetail")
	public String taskDetail(Model model, String projectId, String id) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		us.getProjectManager(model, project.getProjectManagerId());
		ts.queryTaskById(model, id);
		return "taskDetail";
	}

	// 部门经理发布重大事项页面
	@GetMapping(value = "/addMatter")
	public String addMatter(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addMatter";
	}

	// 部门经理提交重大事项
	@ResponseBody
	@PostMapping(value = "/addMatter")
	public int addMatter(BigMatter matter) {
		return matterService.addMatter(matter);
	}

	// 企业领导审核重大事项
	@ResponseBody
	@PostMapping(value = "/updateMatter")
	public int updateMatter(BigMatter matter) {
		int result = matterService.updateMatter(matter);
		if (result > 0) {
			pms.updateMatter(matter.getId());
		}
		return result;
	}

	// 部门经理重大事项列表
	@GetMapping(value = "/showMatters")
	public String showMatters(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		matterService.queryMattersByProjectId(model, projectId);
		return "showMatters";
	}

	// 其他人重大事项列表
	@GetMapping(value = "/getMatters")
	public String getMatters(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		matterService.queryPassMatters(model, projectId);

		return "showMatters";
	}

	// 重大事项详细信息
	@GetMapping(value = "/matterDetail")
	public String matterDetail(Model model, String projectId, String id) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		matterService.queryMatterById(model, id);
		return "matterDetail";
	}

	// 日报页面
	@GetMapping(value = "/addDailyReport")
	public String addDailyReport(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addDailyReport";
	}

	// 日报提交
	@ResponseBody
	@PostMapping(value = "/addDailyReport")
	public int addDailyReport(DailyReport report) {
		return drs.addReport(report);
	}

	// 项目经理审核日报
	@ResponseBody
	@PostMapping(value = "/updateDailyReport")
	public int updateDailyReport(DailyReport report) {
		int result = drs.updateReport(report);
		if (result > 0) {
			pms.updateMatter(report.getId());
		}
		return result;
	}

	// 项目成员日报列表
	@GetMapping(value = "/showDailyReports")
	public String showDailyReports(@RequestParam Map<String, Object> map, Model model) {
		model.addAttribute("project", ps.getProjectById((String) map.get("projectId")));
		drs.queryReportsByProjectId(model, map);
		return "showDailyReports";
	}

	// 其他人日报列表
	@GetMapping(value = "/getDailyReports")
	public String getDailyReports(Model model, String projectId) {
		// 项目信息
		model.addAttribute("project", ps.getProjectById(projectId));
		drs.queryPassReports(model, projectId);

		return "showDailyReports";
	}

	// 日报详细信息
	@GetMapping(value = "/dailyReportDetail")
	public String dailyReportDetail(Model model, String projectId, String id) {
		// 项目信息
		model.addAttribute("project", ps.getProjectById(projectId));
		drs.queryReportById(model, id);
		return "dailyReport";
	}

	// 周报页面
	@GetMapping(value = "/addWeekReport")
	public String addWeekReport(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addWeekReport";
	}

	// 周报提交
	@ResponseBody
	@PostMapping(value = "/addWeekReport")
	public int addWeekReport(WeekReport report) {
		Project project = new Project();
		project.setId(report.getProjectId());
		project.setProcess(report.getProcess());
		ps.updateProcess(project);
		return wrs.addReport(report);
	}

	// 部门经理审核周报
	@ResponseBody
	@PostMapping(value = "/updateWeekReport")
	public int updateWeekReport(WeekReport report) {
		int result = wrs.updateReport(report);
		if (result > 0) {
			pms.updateMatter(report.getId());
		}
		return result;
	}

	// 项目经理周报列表
	@GetMapping(value = "/showWeekReports")
	public String showWeekReports(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		wrs.queryReportsByProjectId(model, projectId);
		return "showWeekReports";
	}

	// 其他人周报列表
	@GetMapping(value = "/getWeekReports")
	public String getWeekReports(Model model, String projectId) {
		// 项目信息
		model.addAttribute("project", ps.getProjectById(projectId));
		wrs.queryPassReports(model, projectId);

		return "showWeekReports";
	}

	// 周报详细信息
	@GetMapping(value = "/weekReportDetail")
	public String weekReportDetail(Model model, String projectId, String id) {
		// 项目信息
		model.addAttribute("project", ps.getProjectById(projectId));
		wrs.queryReportById(model, id);
		return "weekReport";
	}

	// 项目支出提交
	@ResponseBody
	@PostMapping(value = "/addCost")
	public int addCost(Cost cost) {
		return costService.addCost(cost);
	}

	// 支出列表
	@GetMapping(value = "/getCosts")
	public String getCosts(Model model, HttpSession httpSession, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		costService.queryCosts(model, httpSession, projectId);
		costService.querySum(model, projectId);
		return "showCosts";
	}

	// 按周统计项目花费
	@GetMapping(value = "/getSumCostByWeek")
	public String getSumCostByWeek(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));

		costService.querySumByWeek(model, projectId);
		;
		return "sumCosts";
	}

	// 按约统计项目花费
	@GetMapping(value = "/getSumCostByMonth")
	public String getSumCostByMonth(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));

		costService.querySumByMonth(model, projectId);
		;
		return "sumCosts";
	}

	// 奖惩绩效提交页面
	@GetMapping(value = "/addScheme")
	public String addScheme(Model model, String projectId) {
		model.addAttribute("project", ps.getProjectById(projectId));
		return "addScheme";
	}

	// 项目经理提交奖惩绩效方案
	@ResponseBody
	@PostMapping(value = "/addScheme")
	public int addScheme(Scheme scheme) {
		return ss.addScheme(scheme);
	}

	// 部门经理审核奖惩绩效方案
	@ResponseBody
	@PostMapping(value = "/updateScheme")
	public int updateScheme(Scheme scheme) {
		int result = ss.updateScheme(scheme);
		if (result > 0) {
			pms.updateMatter(scheme.getId());
		}
		return result;
	}

	// 项目经理奖惩绩效方案列表
	@GetMapping(value = "/showSchemes")
	public String showSchemes(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		ss.querySchemesByProjectId(model, projectId);
		return "schemes";
	}

	// 其他人惩绩效方案列表
	@GetMapping(value = "/getSchemes")
	public String getSchemes(Model model, String projectId) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		ss.queryPassSchemes(model, projectId);

		return "schemes";
	}

	// 惩绩效方案详细信息
	@GetMapping(value = "/schemeDetail")
	public String schemeDetail(Model model, String projectId, String id) {
		// 项目信息
		Project project = ps.getProjectById(projectId);
		model.addAttribute("project", project);
		ss.querySchemeById(model, id);
		return "scheme";
	}

	// 文件上传
	@ResponseBody
	@PostMapping(value = "/upload")
	public Map<String, Object> importPicFile(MultipartFile file) {
		return fs.uploadFile(file);
	}

	// 文件下载
	@GetMapping(value = "download")
	public void download(HttpServletRequest request, HttpServletResponse response, String path) {
		fs.downloadFile(request, response, path);

	}

	// 提交工时
	@ResponseBody
	@PostMapping(value = "/addHour")
	public int addHour(WorkHour workHour) {
		return ws.addHour(workHour);
	}

	// 导入工时excel
	@PostMapping(value = "/import")
	@ResponseBody
	public String importExcel(MultipartFile file) {
		String flag = "02";// 上传标志
		if (!file.isEmpty()) {
			flag = ws.ImportExcel(file);
		}
		return flag;
	}

	// 签到页面
	@GetMapping(value = "/showAttence")
	public String showAttence(HttpSession httpSession, Model model) {
		User user = (User) httpSession.getAttribute("user");
		as.queryAttence(model, user.getUserId());
		model.addAttribute("attences", as.queryAttences(user.getUserId()));

		return "attence";
	}

	// 签到
	@GetMapping(value = "/addAttence")
	public String addAttence(Attence attence) {
		as.addAttence(attence);
		return "attence";
	}

	// 已签查询
	@GetMapping(value = "/getAttences")
	@ResponseBody
	public List<Attence> getAttences(HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("user");
		return as.queryAttences(user.getUserId());
	}
	// 分页用户
	@GetMapping(value = "/getUsers")
	public List<User> getUsers() {
		PageHelper.startPage(2,2);
		List<User> users = us.getAllUsers();
		return users;
	}
}
