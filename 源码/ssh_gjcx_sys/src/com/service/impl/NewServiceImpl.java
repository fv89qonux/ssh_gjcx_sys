package com.service.impl;


import java.util.List;

import com.dao.NewDao;
import com.model.TbGg;
import com.model.TbGgDto;
import com.service.NewService;
import com.util.PageUtil;

public class NewServiceImpl implements NewService{
	
	private NewDao newDao;

	public List search(PageUtil pageUtil) {
		return newDao.search(pageUtil);
	}
	
	public List detail(String id) {
		// TODO Auto-generated method stub
		return newDao.detail(id);
	}

	
	public void insert(TbGgDto newdto) {
		// TODO Auto-generated method stub
		newDao.insert(newdto);
	}

	public void update(TbGgDto newdto) {
		// TODO Auto-generated method stub
		newDao.update(newdto);
	}

	public List<TbGg> updateInit(String id) {
		// TODO Auto-generated method stub
		List<TbGg> list =newDao.updateInit(id);
		return list;
	
	}

	
	public void delete(TbGgDto newdto) {
		// TODO Auto-generated method stub
		newDao.delete(newdto);
	}
	
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) {
		return this.newDao.countRecord(hql);
	}

	public NewDao getNewDao() {
		return newDao;
	}

	public void setNewDao(NewDao newDao) {
		this.newDao = newDao;
	}

	
	
	
}
