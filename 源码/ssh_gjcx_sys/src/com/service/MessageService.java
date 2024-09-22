package com.service;

import java.util.List;

import com.model.TbMessage;
import com.model.TbMessageDto;
import com.util.PageUtil;


public interface MessageService {
	
	public List search(PageUtil pageUtil);
	public List<TbMessage> updateInit(String id);
	public void update(TbMessageDto messagedto);
	public void delete(TbMessageDto messagedto);
	public List detail(String id);
	public void insert(TbMessageDto messagedto);
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) ;
	
}
