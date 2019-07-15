package com.hxx.controller;

import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hxx.pojo.User;
import com.hxx.service.UserService;

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
		String md5Pwd = DigestUtils.md5DigestAsHex(user.getPwd().getBytes());//MD5����
		user.setTime(new Date());//����ʱ���ֶ�
		user.setPwd(md5Pwd);//���MD5���ܵ�����
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
}
