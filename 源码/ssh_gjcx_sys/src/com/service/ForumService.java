package com.service;

import java.util.List;

import com.model.TbDetailDto;
import com.model.TbForumDto;
import com.model.TbMessageDto;
import com.util.PageUtil;


public interface ForumService {
	public List search(PageUtil pageUtil);
	/**
	 * 查找每一个标题的详细信息
	 * @param id
	 * @param pageUtil
	 * @return
	 */
	public List searchDetail(String id,PageUtil pageUtil);
	public void insert(TbForumDto forumdto);
	public List detail(String id,PageUtil pageUtil);
	/**
	 * 前台详细
	 * @param id
	 * @param pageUtil
	 * @return
	 */
	public List forumdetail(String id,PageUtil pageUtil);
	public void insertDetail(TbDetailDto detaildto);
	public void delete(TbForumDto forumdto);
	public void deleteDetail(TbDetailDto detaildto);
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	
	public long countRecord(String hql) ;
	
	
}
