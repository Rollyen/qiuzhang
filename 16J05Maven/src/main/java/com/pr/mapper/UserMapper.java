package com.pr.mapper;

import java.util.List;
import java.util.Map;

import com.pr.pojo.User;

public interface UserMapper {
	public int insert(User user);//ע��

	public List<User> findUserByName(String name);//��������

	public List<User> login(User user);//��¼

	public List<User> findByAll();//��ҳ��ʾ

	public int deleteUserById(Integer id);//ɾ��

	public User findUserById(Integer id);//������������ǰ��ģ̬���ڽ����޸�
	
	public int updateUserById(User user);//�޸�
	
	public List<User> findUserByProperty(User user);//��������ѯ
	
	public List<User> pageFindAll(Map<String,Object> m);//��ѯȫ������ҳ
	
	public int totalNum(User user);//��ѯ������
}
