package com.service.impl;


import java.util.List;

import com.dao.UserDao;
import com.model.TbMember;
import com.model.TbMemberDto;
import com.service.UserService;
import com.util.PageUtil;

public class UserServiceImpl implements UserService{
	
	private UserDao userDao;
	
	
	public List login(String usercode,String pwd) {
		// TODO Auto-generated method stub
		return (List) userDao.login(usercode,pwd);
		
	}

	public List memLogin(String usercode,String pwd) {
		// TODO Auto-generated method stub
		return (List) userDao.memLogin(usercode,pwd);
		
	}
	public List findUserByUserName(String userName) {
		return this.userDao.findUserByUserName(userName);
	}

	public List search(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return userDao.search(pageUtil);
	}
	
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) {
		return this.userDao.countRecord(hql);
	}

	public List detail(String id) {
		// TODO Auto-generated method stub
		return userDao.detail(id);
	}

	public void delete(TbMemberDto memberdto) {
		// TODO Auto-generated method stub
		userDao.delete(memberdto);
	}

	public void insert(TbMemberDto memberdto) {
		// TODO Auto-generated method stub
		userDao.insert(memberdto);
	}

	public List<TbMember> updateInit(String id) {
		// TODO Auto-generated method stub
		List<TbMember> list =userDao.updateInit(id);
		return list;
	
	}

	
	public void update(TbMemberDto memberdto) {
		// TODO Auto-generated method stub
		userDao.update(memberdto);
	}

	
	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	

	


	

	
}
