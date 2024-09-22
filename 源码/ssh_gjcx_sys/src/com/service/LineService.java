package com.service;

import java.util.List;

import com.model.TbGgDto;
import com.model.TbLine;
import com.model.TbLineDto;
import com.util.PageUtil;


public interface LineService {
	
	public List searchInit();
	public List search(TbLineDto linedto,PageUtil pageUtil);
	public void delete(TbLineDto linedto);
	public List<TbLine> updateInit(String id);
	public void update(TbLineDto linedto);
	public void insert(TbLineDto  linedto);
	public List lineDetail(String id,int flag);
	public List lineScan(PageUtil pageUtil) ;
	public List<TbLineDto> changeSearch(TbLineDto  linedto);	
	/**
	 * 统计公交预览
	 * @return
	 */
	public long countLinebyName();
	
	/**
	 *公共统计方法
	 * @return
	 */
	public long countRecord(String hql);
	
}
