package com.service.impl;


import java.util.List;

import com.dao.PicDao;
import com.model.TbPic;
import com.model.TbPicDto;
import com.service.PicService;
import com.util.PageUtil;

public class PicServiceImpl implements PicService{
	
	private PicDao picDao;

	public List search(PageUtil pageUtil) {
		return picDao.search(pageUtil);
	}
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) {
		return this.picDao.countRecord(hql);
	}

	public void delete(TbPicDto picdto) {
		// TODO Auto-generated method stub
		picDao.delete(picdto);
	}

	public List<TbPic> updateInit(String id) {
		// TODO Auto-generated method stub
		List<TbPic> list =picDao.updateInit(id);
		return list;
	}
	
	public void insert(TbPicDto picdto) {
		// TODO Auto-generated method stub
		picDao.insert(picdto);
	}

	public void update(TbPicDto picdto) {
		// TODO Auto-generated method stub
		picDao.update(picdto);
	}

	public List detail(String id) {
		// TODO Auto-generated method stub
		return picDao.detail(id);
	}


	public PicDao getPicDao() {
		return picDao;
	}

	public void setPicDao(PicDao picDao) {
		this.picDao = picDao;
	}

	
	
	
	
	
}
