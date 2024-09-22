package com.service;

import java.util.List;

import com.model.TbLoad;
import com.model.TbLoadDto;
import com.util.PageUtil;

public interface LoadService {
	public void insert(TbLoadDto loaddto);
	public List search(PageUtil pageUtil);
	public void delete(TbLoadDto loaddto);
	public TbLoad searchLoadByLoadId(String id);
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) ;
}
