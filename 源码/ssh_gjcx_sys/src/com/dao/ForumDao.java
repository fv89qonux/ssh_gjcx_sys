package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbDetail;
import com.model.TbDetailDto;
import com.model.TbForum;
import com.model.TbForumDto;
import com.util.PageUtil;

public class ForumDao extends HibernateDaoSupport {
	
	/**
	 * 查询按钮
	 * @param userzudao
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		List<TbForum> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	    		String hql="from TbForum order by id desc";
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
	
	public void insert(TbForumDto forumdto) {
		TbForum forum =forumdto.getTbForum();
		super.getHibernateTemplate().save(forum);				
	
	}
	
	public void insertDetail(TbDetailDto detaildto) {
		TbDetail detail =detaildto.getTbDetail();
		super.getHibernateTemplate().save(detail);			
	
	}
	
	public List detail(String id,PageUtil pageUtil) {
		// TODO Auto-generated method stub
		String hql="from TbForum where id='"+id+"'";
		List<TbForum> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	//查找详细
	@SuppressWarnings("unchecked")
	public List searchDetail(final String id ,final PageUtil pageUtil) {
		//List<TbDetail> list = super.getHibernateTemplate().find(hql);
		List<TbDetail> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	    	    String hql="from TbDetail where forumid='"+id+"'" + "order by id";
	            Query query =session.createQuery(hql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	            return query.list();
	        }
	    });
		return list;
	
	}
	/**
	 * 显示前台某一主题详细
	 * @param id
	 * @param pageUtil
	 * @return
	 */
	
	@SuppressWarnings("unchecked")
	public List forumdetail(String id,final PageUtil pageUtil) {
		
		final String hql="from TbDetail where forumid='"+id+"'" +"order by id " ;
		List<TbDetail> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	            Query query =session.createQuery(hql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	             List list = query.list();
	            return list;
	        }
	    });//内部类，返回一个List

		//this.getSession().close();
		return list;
	}
	
	public void delete(TbForumDto forumdto) {
		TbForum message = (TbForum)super.getHibernateTemplate().get(TbForum.class, forumdto.getTbForum().getId());
		super.getHibernateTemplate().delete(message);
		
	}
	
	public void deleteDetail(TbDetailDto detaildto) {
		TbDetail message = (TbDetail)super.getHibernateTemplate().get(TbDetail.class, detaildto.getTbDetail().getId());
		super.getHibernateTemplate().delete(message);
		
	}
}
