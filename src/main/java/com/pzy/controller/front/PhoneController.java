package com.pzy.controller.front;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzy.entity.Question;
import com.pzy.entity.Review;
import com.pzy.entity.User;
import com.pzy.service.PlanService;
import com.pzy.service.ReviewWordService;
import com.pzy.service.UserService;
import com.pzy.service.WordService;
/***
 * 前台，首页各种连接登陆等
 * @author qq:263608237
 *
 */
@Controller
@RequestMapping("/phone")
public class PhoneController {
	
	@Autowired
	private PlanService planService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private WordService wordService;
	
	@Autowired
	private ReviewWordService reviewWordService;

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
	
	/***
	 * 跳转到首页
	 * @param model
	 * @return
	 */
	@RequestMapping("plan")
	public String plan(Model model,HttpSession httpSession) {
		//httpSession.setAttribute("user", null);
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		return "phone/plan";
	}
	@RequestMapping("saveplan")
	public String saveplan(Model model,HttpSession httpSession,Integer day,Integer num) {
		User user = (User)httpSession.getAttribute("user");
		user.setDay(day);
		user.setNum(num);
		this.userService.save(user);
		model.addAttribute("tip","设置成功!");
		return "phone/plan";
	}
	/***
	 * 单词记忆模块
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("remember")
	public String remember(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		httpSession.setAttribute("index",1);
		httpSession.setAttribute("rightcout",0);
		httpSession.setAttribute("errorcout",0);
		model.addAttribute("question", wordService.getQuestion());
		return "phone/remember";
	}
	
	@RequestMapping("test")
	public String test(Model model,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		
		List<Question > questions = wordService.findTest();
		httpSession.setAttribute("index",0);
		httpSession.setAttribute("rightcout",0);
		httpSession.setAttribute("errorcout",0);
		model.addAttribute("question", questions.get(0));
		httpSession.setAttribute("questions",questions);
		return "phone/test";
	}
	@RequestMapping("test/{index}")
	public String test(Model model,@PathVariable Integer index,String q,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		Integer rightcout = (Integer)httpSession.getAttribute("rightcout");
		Integer errorcout = (Integer)httpSession.getAttribute("errorcout");
		httpSession.setAttribute("index", index);
		List<Question > questions = (List<Question >)httpSession.getAttribute("questions");
		Question prequestion =questions.get(index-1);
		if(StringUtils.isEmpty(q)){
		    return "redirect:/phone/test"; 
		}
		if(q.equals(prequestion.getRightq())){
			httpSession.setAttribute("rightcout", rightcout+1);
		}else{
			httpSession.setAttribute("errorcout", errorcout+1);
		}
		
		if(index==questions.size()){
			return "phone/result";
		}
		Question question =questions.get(index);
		model.addAttribute("question", question);
		return "phone/test";
	}
	@RequestMapping("remember/{id}")
	public String remember(Model model,@PathVariable Long id,String q,HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		Integer rightcout = (Integer)httpSession.getAttribute("rightcout");
		Integer errorcout = (Integer)httpSession.getAttribute("errorcout");
		Integer index = (Integer)httpSession.getAttribute("index");
		httpSession.setAttribute("index", index+1);
		Question question = wordService.getQuestion(id);
		if(StringUtils.isEmpty(q)){
		    return "redirect:/phone/remember"; 
		}
		if(q.equals(question.getRightq())){
			httpSession.setAttribute("rightcout", rightcout+1);
		}else{
			httpSession.setAttribute("errorcout", errorcout+1);
		}
		model.addAttribute("question", wordService.getQuestion());
		return "phone/remember";
	}
	/***
	 * 复习模块
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("review")
	public String review(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/review";
	}
	@RequestMapping("review/{num}")
	public String review(Model model,HttpSession httpSession,@PathVariable Integer num) {
		User user = (User)httpSession.getAttribute("user");
		if(user== null){
			httpSession.removeAttribute("user");
    		model.addAttribute("tip","请登录!");
    		return "phone/login";
		}
		
		List<Review> reviews = this.reviewWordService.findByUser(user);
		if(!CollectionUtils.isEmpty(reviews)&&num<reviews.size()){
			model.addAttribute("reviews",reviews.get(num));
		}else if(!CollectionUtils.isEmpty(reviews)&&num>=reviews.size()){
			num =0;
			model.addAttribute("reviews",reviews.get(num));
		}
		else{
			model.addAttribute("reviews",null);
		}
		model.addAttribute("num",num);
		model.addAttribute("total",reviews.size());
		return "phone/review";
	}
	/***
	 * 翻译模块
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("translate")
	public String translate(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
		return "phone/translate";
	}
	
	@RequestMapping("dotranslate")
	public String dotranslate(String key,Model model) {
		model.addAttribute("results",wordService.translate(key));
		model.addAttribute("key",key);
		return "phone/translate";
	}
	/**
	 * 关于我们模块
	 * @param model
	 * @return
	 */
	@RequestMapping("about")
	public String about(Model model) {
		return "phone/about";
	}
	/***
	 * 个人中心
	 * @param model
	 * @param httpSession
	 * @return
	 */
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
	
	@RequestMapping("resetpw")
	public String resetpw(Model model,HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		model.addAttribute("user",user);
		return "phone/pw";
	}
	
	@RequestMapping("resetinfo")
	public String resetinfo(Model model,HttpSession httpSession) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/resetinfo";
		}
		model.addAttribute("user",user);
		return "phone/resetinfo";
	}
	
	@RequestMapping("doresetinfo")
	public String doresetinfo(Model model,HttpSession httpSession,User user) {
		User user1=(User) httpSession.getAttribute("user");
		if(user1==null){
			model.addAttribute("tip","请登陆！");
			return "phone/resetinfo";
		}
		user1.setAddress(user.getAddress());
		user1.setUsername(user.getUsername());
		user1.setEmail(user.getEmail());
		userService.save(user1);
		model.addAttribute("tip","个人资料修改成功！");
		model.addAttribute("user",user1);
		return "phone/resetinfo";
		
	}
	
	@RequestMapping("doresetpw")
	public String doresetpw(Model model,HttpSession httpSession,String password) {
		User user=(User) httpSession.getAttribute("user");
		if(user==null){
			model.addAttribute("tip","请登陆！");
			return "phone/login";
		}
		user.setPassword(password);
		userService.save(user);
		model.addAttribute("tip","密码修改成功！");
		model.addAttribute("user",user);
		return "phone/pw";
		
	}
	
	/***
	 * 退出
	 * @param httpSession
	 * @param model
	 * @return
	 */
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
	/***
	 * 执行登录
	 * @param model
	 * @return
	 */
	@RequestMapping("login")
	public String login(Model model) {
		return "phone/login";
	}
	
	/***
	 * 执行注册
	 * @param model
	 * @return
	 */
	@RequestMapping("register")
	public String register(Model model) {
		return "phone/register";
	}
	
	/***
	 * 执行登录 
	 * @param model
	 * @return
	 */
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
	
}

