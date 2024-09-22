package com.service.impl;


import java.util.List;

import com.dao.ForumDao;
import com.model.TbDetailDto;
import com.model.TbForumDto;
import com.service.ForumService;
import com.util.PageUtil;

public class ForumServiceImpl implements ForumService{
	
	private ForumDao forumDao;

	public List search(PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return forumDao.search(pageUtil);
	}
	
	public List searchDetail(String id,PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return forumDao.searchDetail(id,pageUtil);
	}
	

	public void insert(TbForumDto forumdto) {
		// TODO Auto-generated method stub
		forumDao.insert(forumdto);
	}
	
	public void insertDetail(TbDetailDto detaildto) {
		// TODO Auto-generated method stub
		forumDao.insertDetail(detaildto);
	}
	public List detail(String id,PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return forumDao.detail(id,pageUtil);
	}

	public List forumdetail(String id,PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return forumDao.forumdetail(id,pageUtil);
	}
	
	public void delete(TbForumDto forumdto) {
		// TODO Auto-generated method stub
		forumDao.delete(forumdto);
	}
	
	public void deleteDetail(TbDetailDto detaildto) {
		// TODO Auto-generated method stub
		forumDao.deleteDetail(detaildto);
	}
		
	public long countRecord(String hql) {
		return this.forumDao.countRecord(hql);
	}
	
	public ForumDao getForumDao() {
		return forumDao;
	}

	public void setForumDao(ForumDao forumDao) {
		this.forumDao = forumDao;
	}

	
	
	
	
	
}
