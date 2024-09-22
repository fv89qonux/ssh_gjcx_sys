package com.service;

import java.util.List;

import com.model.TbGg;
import com.model.TbGgDto;
import com.util.PageUtil;


public interface NewService {
	
	public List search(PageUtil pageUtil);
	public List detail(String id);
	public List<TbGg> updateInit(String zuid);
	public void update(TbGgDto newdto);
	public void insert(TbGgDto  newdto);
	public void delete(TbGgDto newdto);
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) ;
}
