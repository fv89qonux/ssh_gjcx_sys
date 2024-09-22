package com.service.impl;


import java.util.List;

import com.dao.MessageDao;
import com.model.TbMessage;
import com.model.TbMessageDto;
import com.service.MessageService;
import com.util.PageUtil;

public class MessageServiceImpl implements MessageService{
	
	private MessageDao messageDao;

	public List search(PageUtil pageUtil) {
		return messageDao.search(pageUtil);
	}
	
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	public long countRecord(String hql) {
		return this.messageDao.countRecord(hql);
	}

	public void delete(TbMessageDto messagedto) {
		// TODO Auto-generated method stub
		messageDao.delete(messagedto);
	}
	
	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	public void update(TbMessageDto messagedto) {
		// TODO Auto-generated method stub
		messageDao.update(messagedto);
	}

	public List<TbMessage> updateInit(String id) {
		// TODO Auto-generated method stub
		List<TbMessage> list =messageDao.updateInit(id);
		return list;
	}

	public List detail(String id) {
		// TODO Auto-generated method stub
		return messageDao.detail(id);
	}

	public void insert(TbMessageDto messagedto) {
		// TODO Auto-generated method stub
		messageDao.insert(messagedto);
	}

	
	
}
