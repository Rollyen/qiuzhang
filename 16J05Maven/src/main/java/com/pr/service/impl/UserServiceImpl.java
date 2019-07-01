package com.pr.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pr.mapper.UserMapper;
import com.pr.pojo.User;
import com.pr.service.UserService;

@Service
@Transactional // ÊÂÎñ×¢½â
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public int insert(User user) {
		return this.userMapper.insert(user);
	}

	@Override
	public List<User> findUserByName(String name) {
		return this.userMapper.findUserByName(name);
	}

	@Override
	public List<User> login(User user) {
		return this.userMapper.login(user);
	}

	@Override
	public List<User> findByAll() {

		return this.userMapper.findByAll();
	}

	@Override
	public int deleteUserById(Integer id) {
		return this.userMapper.deleteUserById(id);
	}

	@Override
	public User findUserById(Integer id) {
		return this.userMapper.findUserById(id);
	}

	@Override
	public int updateUserById(User user) {
		return this.userMapper.updateUserById(user);
	}

	@Override
	public List<User> findUserByProperty(User user) {

		return this.userMapper.findUserByProperty(user);
	}

	@Override
	public List<User> pageFindAll(User user, Integer start, Integer end) {
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("start", start);
		data.put("end", end);
		data.put("name", user.getName());
		data.put("sex", user.getSex());
		data.put("age", user.getAge());
		data.put("phone", user.getPhone());
		List<User> list = userMapper.pageFindAll(data);
		return list;

	}

	@Override
	public int totalNum(User user) {
		int num = userMapper.totalNum(user);
		if (num % 4 != 0)
			return num / 4 + 1;
		else
			return num / 4;
	}

	@Override
	public int totalRecord(User user) {
		return this.userMapper.totalNum(user);
	}
}
