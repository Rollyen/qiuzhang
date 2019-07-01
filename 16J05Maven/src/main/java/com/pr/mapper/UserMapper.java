package com.pr.mapper;

import java.util.List;
import java.util.Map;

import com.pr.pojo.User;

public interface UserMapper {
	public int insert(User user);//注册

	public List<User> findUserByName(String name);//查重名字

	public List<User> login(User user);//登录

	public List<User> findByAll();//主页显示

	public int deleteUserById(Integer id);//删除

	public User findUserById(Integer id);//搜索数据填入前端模态框内进行修改
	
	public int updateUserById(User user);//修改
	
	public List<User> findUserByProperty(User user);//多条件查询
	
	public List<User> pageFindAll(Map<String,Object> m);//查询全部并分页
	
	public int totalNum(User user);//查询总条数
}
