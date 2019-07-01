package com.pr.service;

import java.util.List;
import java.util.Map;

import com.pr.pojo.User;

public interface UserService {
	public int insert(User user);//注册

	public List<User> findUserByName(String name);//名字查重

	public List<User> login(User user);//登录

	public List<User> findByAll();//查询全部

	public int deleteUserById(Integer id);//删除

	public User findUserById(Integer id);//搜索数据填入前台模态框进行修改

	public int updateUserById(User user);//修改

	public List<User> findUserByProperty(User user);// 多条件查询

	public List<User> pageFindAll(User user, Integer start, Integer end);//分页查询全部

	public int totalNum(User user);//查询总条数

	public int totalRecord(User user);
}
