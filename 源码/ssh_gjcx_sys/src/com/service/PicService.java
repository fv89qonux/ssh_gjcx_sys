package com.service;

import java.util.List;

import com.model.TbPic;
import com.model.TbPicDto;
import com.util.PageUtil;


public interface PicService {
	
	public List search(PageUtil pageUtil);
	public void delete(TbPicDto picdto);
	public List<TbPic> updateInit(String id);
	public void update(TbPicDto picdto);
	public void insert(TbPicDto picdto);
	public List detail(String id);
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) ;
	
}
