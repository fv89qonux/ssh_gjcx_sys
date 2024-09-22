package com.service;

import java.util.List;

import com.model.TbMember;
import com.model.TbMemberDto;
import com.util.PageUtil;

public interface UserService {
	
	public List login(String usercode,String pwd);
	public List memLogin(String usercode,String pwd);
	public List search(PageUtil pageUtil);
	public List detail(String id);
	public void delete(TbMemberDto memberdto);
	public void insert(TbMemberDto memberdto);
	public List<TbMember> updateInit(String id);
	public void update(TbMemberDto memberdto);
	public List findUserByUserName(String userName) ;
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) ;
}
