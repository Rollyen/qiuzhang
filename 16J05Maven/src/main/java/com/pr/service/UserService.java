package com.pr.service;

import java.util.List;
import java.util.Map;

import com.pr.pojo.User;

public interface UserService {
	public int insert(User user);//ע��

	public List<User> findUserByName(String name);//���ֲ���

	public List<User> login(User user);//��¼

	public List<User> findByAll();//��ѯȫ��

	public int deleteUserById(Integer id);//ɾ��

	public User findUserById(Integer id);//������������ǰ̨ģ̬������޸�

	public int updateUserById(User user);//�޸�

	public List<User> findUserByProperty(User user);// ��������ѯ

	public List<User> pageFindAll(User user, Integer start, Integer end);//��ҳ��ѯȫ��

	public int totalNum(User user);//��ѯ������

	public int totalRecord(User user);
}
