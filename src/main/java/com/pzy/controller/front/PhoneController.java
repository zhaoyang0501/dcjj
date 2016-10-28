package com.pzy.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pzy.entity.Category;
import com.pzy.entity.Chat;
import com.pzy.entity.Discuss;
import com.pzy.entity.Project;
import com.pzy.entity.User;
import com.pzy.service.CategoryService;
import com.pzy.service.ChatService;
import com.pzy.service.DiscussService;
import com.pzy.service.PatientService;
import com.pzy.service.ProjectService;
import com.pzy.service.UserService;
/***
 * 前台，首页各种连接登陆等
 * @author qq:263608237
 *
 */
@Controller
@RequestMapping("/phone")
public class PhoneController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private DiscussService discussService;
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private PatientService patientService;
	
	@Autowired
	private ChatService chatService;
	@InitBinder  
	protected void initBinder(HttpServletRequest request,   ServletRequestDataBinder binder) throws Exception {   
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true)); 
	}  
	/***
	 * 跳转到首页
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/index";
	}
	
	@RequestMapping("remember")
	public String remember(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/remember";
	}
	@RequestMapping("review")
	public String review(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/review";
	}
	
	@RequestMapping("translate")
	public String translate(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/translate";
	}
	
	@RequestMapping("about")
	public String about(Model model) {
		return "phone/about";
	}
	@RequestMapping("discuss")
	public String discuss(Model model,HttpSession httpSession) {
		User user=(User)httpSession.getAttribute("user");
		model.addAttribute("lists1",discussService.findByUserAndType(user,"1"));
		model.addAttribute("lists2",discussService.findByUserAndType(user,"2"));
		return "phone/discuss";
	}
	
	@RequestMapping("chat")
	public String chat(Model model,HttpSession httpSession) {
		User user=(User)httpSession.getAttribute("user");
		List lists1=chatService.findByUserAndState(user,"未回复");
		List lists2=chatService.findByUserAndState(user,"未回复");
		model.addAttribute("lists1",lists1);
		model.addAttribute("count1",lists1.size());
		model.addAttribute("count2",lists2.size());
		model.addAttribute("lists2",lists2);
		return "phone/chat";
	}
	@RequestMapping("viewchat")
	public String viewchat(Model model,Long id) {
		model.addAttribute("bean", chatService.find(id));
		return "phone/viewchat";
	}
	
	@RequestMapping("patient")
	public String patient(Model model) {
		model.addAttribute("lists", patientService.findAll());
		return "phone/patient";
	}
	
	@RequestMapping("viewpatient")
	public String viewpatient(Model model,Long id) {
		model.addAttribute("bean", patientService.find(id));
		return "phone/viewpatient";
	}
	
	
	@RequestMapping("rate")
	public String rate(Model model) {
		return "phone/discuss";
	}
	@RequestMapping("customer")
	public String customer(Model model) {
		return "phone/customer";
	}
	@RequestMapping("category")
	public String category(Model model,Long id) {
		return "phone/category";
	}
	@RequestMapping("movie")
	public String movie(Model model,Long id) {
		model.addAttribute("projects",projectService.findTop3());
		return "phone/movie";
	}
	@RequestMapping("searchMovie")
	public String searchMovie(Model model,String key) {
		model.addAttribute("search",true);
		model.addAttribute("projects",projectService.findByName(key));
		return "phone/movie"; 
	}
	
	@RequestMapping("viewmovie")
	public String viewmovie(Model model,Long id) {
		model.addAttribute("project",projectService.find(id));
		model.addAttribute("usernum",categoryService.findByProject(projectService.find(id)).size());
		model.addAttribute("msgs",categoryService.findByProject(projectService.find(id)));
		return "phone/viewmovie";
	}
	@RequestMapping("msgadd")
	public String msgadd(Model model,Category category ,HttpSession httpSession,RedirectAttributes redirectAttributes) {
		User user=(User)httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		category.setUser(user);
		category.setCreateDate(new Date());
		
		
		Project project = projectService.find(category.getProject().getId());
		project.setScore(categoryService.getAvg(project.getId()));
		projectService.save(project);
		categoryService.save(category);
		model.addAttribute("tip","评论成功");
		redirectAttributes.addFlashAttribute("tip", "Successfully added..");
		return "redirect:/phone/viewmovie?id="+category.getProject().getId();
	}
	
	@RequestMapping("discussadd")
	public String discussadd(Model model,Discuss discuss ,HttpSession httpSession,RedirectAttributes redirectAttributes) {
		User user=(User)httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		discuss.setUser(user);
		discuss.setCreateDate(new Date());
		discussService.save(discuss);
		model.addAttribute("tip","评论成功");
		redirectAttributes.addFlashAttribute("tip", "Successfully added..");
		return "redirect:/phone/discuss";
	}
	
	@RequestMapping("chatadd")
	public String chatadd(Model model,Chat chat ,HttpSession httpSession,RedirectAttributes redirectAttributes) {
		User user=(User)httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		chat.setReplyer(user);
		chat.setCreateDate(new Date());
		chatService.save(chat);
		model.addAttribute("tip","回复成功");
		redirectAttributes.addFlashAttribute("tip", "Successfully added..");
		return "redirect:/phone/discuss";
	}
	/***
	 * 我的订单
	 * @param model
	 * @param id
	 * @return
	 */
	
	@RequestMapping("order/{pid}")
	public String order(Model model,@PathVariable Long pid) {
		model.addAttribute("project",projectService.find(pid));
		return "phone/order";
	}
	
	
	
	@RequestMapping("center")
	public String center(Model model,HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		model.addAttribute("user",user);
		return "phone/center";
		
	}
	
	@RequestMapping("store")
	public String store(Model model,HttpSession httpSession,Long id) {
		return "phone/store";
	}
	@RequestMapping("loginout")
	public String loginout(HttpSession httpSession,Model model) {
		httpSession.removeAttribute("user");
		model.addAttribute("tip","已注销！");
		return "phone/login";
	}
	
	/***
	 * 点击注册
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("doregister")
	public String register(User user,Model model) {
		user.setCreateDate(new Date());
		model.addAttribute("tip","注册成功请登录！");
		userService.save(user);
		return "phone/login";
	}
	@RequestMapping("login")
	public String login(Model model) {
		return "phone/login";
	}
	@RequestMapping("register")
	public String register(Model model) {
		return "phone/register";
	}
	@RequestMapping("dologin")
	public String dologin(User user,HttpSession httpSession,Model model) {
		User loginuser=userService.login(user.getUsername(), user.getPassword());
    	if(loginuser!=null){
    		httpSession.setAttribute("user", loginuser);
    		model.addAttribute("user",loginuser);
            return "phone/center"; 
    	}
    	else{
    		httpSession.removeAttribute("user");
    		model.addAttribute("tip","登陆失败 不存在此用户名或密码!");
    		return "phone/login";
    	}
	}
	
	/*@RequestMapping("myorder")
	public String myorder(HttpSession httpSession,Model model) {
		User user=(User)httpSession.getAttribute("user");
		model.addAttribute("orders",orderService.findByUser(user));
		return "phone/myorder";
	}*/
}

