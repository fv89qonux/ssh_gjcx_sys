package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbMessage;
import com.model.TbMessageDto;
import com.model.TbPic;
import com.util.PageUtil;

public class MessageDao extends HibernateDaoSupport {
	
	/**
	 * 查询按钮
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		//List<TbMessage> list = super.getHibernateTemplate().find(hql);
		List<TbMessage> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	    		String hql="from TbMessage order by id desc";
	            Query query =session.createQuery(hql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	            return query.list();
	        }
	    });
		return list;
	}
	
	/**
	 * 公共统计方法
	 * @param linedto
	 */
	
	public long countRecord(String hql) {
		long count = 0;
		try{
			List list = super.getHibernateTemplate().find(hql);
			count = (Long)(list.get(0));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	/**
	 * 删除按钮
	 * @param 
	 * @return
	 */
	public void delete(TbMessageDto messagedto) {
		// TODO Auto-generated method stub
		TbMessage message = (TbMessage)super.getHibernateTemplate().get(TbMessage.class, messagedto.getTbMessage().getId());
		super.getHibernateTemplate().delete(message);
		
	}

	/**
	 *编辑按钮
	 * @param 
	 * @return
	 
	 */
	public List<TbMessage> updateInit(String id) {
		// TODO Auto-generated method stub
		String hql="from TbMessage where id='"+id+"'";
		List<TbMessage> list = super.getHibernateTemplate().find(hql);
		return list;
		
	}
	
	/**
	 *编辑中保存按钮
	 * @param 
	 * @return
	 * 
	 */
	public void update(TbMessageDto messagedto) {
		// TODO Auto-generated method stub
		TbMessage message =messagedto.getTbMessage();
		super.getHibernateTemplate().update(message);
	}

	public List detail(String id) {
		// TODO Auto-generated method stub
		String hql="from TbMessage where id='"+id+"'";
		List<TbMessage> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	public void insert(TbMessageDto messagedto) {
		TbMessage message =messagedto.getTbMessage();
		super.getHibernateTemplate().save(message);				
	
	}
}
