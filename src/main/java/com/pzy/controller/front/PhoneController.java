package com.pzy.controller.front;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzy.entity.User;
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
	 * 单词记忆模块
	 * @param model
	 * @param httpSession
	 * @return
	 */
	@RequestMapping("remember")
	public String remember(Model model,HttpSession httpSession) {
		httpSession.setAttribute("user", userService.find(1l));
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

