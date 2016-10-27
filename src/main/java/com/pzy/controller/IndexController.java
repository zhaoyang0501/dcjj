package com.pzy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pzy.entity.User;
import com.pzy.service.UserService;
/***
 * 后台首页，处理后台登录验证权限等操作
 * @author qq:263608237
 *
 */
@Controller
@RequestMapping("/admin")
public class IndexController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("center/index")
	public String center() {
		return "admin/center/index";
	}
	@RequestMapping("center/docenter")
	public String docenter(User user,Model model,HttpSession httpSession) {
		User newUser=userService.find(user.getId());
		newUser.setTel(user.getTel());
		newUser.setName(user.getName());
		userService.save(newUser);
		httpSession.setAttribute("adminuser", userService.find(user.getId()));
		model.addAttribute("tip","修改成功");
		return "admin/center/index";
	}
	
	
	@RequestMapping("center/docenterpassword")
	public String docenterpassword(String oldpassword,String newpassword,String newpasswordtwo,
			Model model,HttpSession httpSession) {
		User user=(User)httpSession.getAttribute("adminuser");
		if(!user.getPassword().equals(oldpassword)){
			model.addAttribute("tip","旧密码不正确");
			return "admin/center/index";
		}
		if(newpassword==null||newpasswordtwo==null){
			model.addAttribute("tip","新密码不能为空");
			return "admin/center/index";
		}
		if(!newpassword.equals(newpasswordtwo)){
			model.addAttribute("tip","两次输入密码不正确");
			return "admin/center/index";
		}
		user.setPassword(newpassword);
		userService.save(user);
		httpSession.setAttribute("adminuser", userService.find(user.getId()));
		model.addAttribute("tip","修改成功");
		return "admin/center/index";
	}
	
	
	@RequestMapping("index")
	public String index() {
		return "admin/login";
	}
	@RequestMapping("login")
	public String login() {
		return "admin/login";
	}
	@RequestMapping("loginout")
	public String loginout(HttpSession httpSession) {
		httpSession.setAttribute("adminuser", null);
		return "admin/login";
	}
	
}

