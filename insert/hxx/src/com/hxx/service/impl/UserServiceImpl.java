package com.hxx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hxx.mapper.UserMapper;
import com.hxx.pojo.User;
import com.hxx.service.UserService;
@Service
@Transactional//ÊÂÎñ×¢½â
public class UserServiceImpl implements UserService{
@Autowired
    private UserMapper userMapper;
	@Override
	public int insert(User user) {
		return this.userMapper.insert(user);
	}

	
}
