package com.pr.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pr.pojo.User;
import com.pr.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("insert.html")
	public String Toinsert() {
		return "insert";
	}

	@RequestMapping("insert.action")
	@ResponseBody
	public String insert(User user) {
		if (userService.insert(user) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("index.html")
	public String Toindex() {
		return "index";
	}
	@RequestMapping("index.action")
	@ResponseBody
	public List<User> findByAll() {
		return userService.findByAll();
	}

	@RequestMapping("error.html")
	public String Toerror() {
		return "error";
	}

	@RequestMapping("findUserByName.action")
	@ResponseBody
	public String findUserByName(String name) throws Exception {
		List<User> list = userService.findUserByName(name);
		if (list.size() > 0) {
			// return "<font color='red'>已经存在</font>";
			return "success";
		} else {
			// return "<font color='green'>no exits</font>";
			return "fail";
		}
	}

	@RequestMapping("login.html")
	public String toLogin() {
		return "login";
	}

	@RequestMapping("login.action")
	@ResponseBody
	public String login(User user, HttpSession session) {
		if (userService.login(user).size() > 0) {
			session.setAttribute("user", user);
			return "success";
		} else {
			return "error";
		}
	}

	@RequestMapping("delete.action")
	@ResponseBody
	public String deleteUserById(Integer id) {
		if (userService.deleteUserById(id) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	@RequestMapping("findUserById.action")
	@ResponseBody
	public User findUserById(Integer id) {
		return userService.findUserById(id);
	}

	@RequestMapping("updateUserById.action")
	@ResponseBody
	public String updateUserById(User user) {
		if (userService.updateUserById(user) > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 模糊查询
	@RequestMapping("findUserByProperty.action")
	@ResponseBody
	public List<User> findUserByProperty(User user) {
		return userService.findUserByProperty(user);
	}

	@RequestMapping("pageFindAll.do")
	@ResponseBody
	public List<User> pageFindAll(User user, Integer pageNum, Integer pageSize) {
		Integer start = (pageNum - 1) * pageSize;//开始查的id数pageNum是页码 pageSize页面查询几条 
		Integer end = pageSize;
		List<User> list = userService.pageFindAll(user, start, end);
		return list;
	}

	@RequestMapping("totalNum.do")
	@ResponseBody
	public int totalNum(User user) {
		return userService.totalNum(user);
	}
	@RequestMapping("totalRecord.do")
	@ResponseBody
	public int totalRecord(User user){
		return userService.totalRecord(user);
	}
}
