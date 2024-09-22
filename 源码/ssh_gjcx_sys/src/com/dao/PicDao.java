package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbPic;
import com.model.TbPicDto;
import com.util.PageUtil;

public class PicDao extends HibernateDaoSupport {
	
	/**
	 * 查询按钮
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		//String hql="from TbPic order by id";
		//List<TbPic> list = super.getHibernateTemplate().find(hql);
		List<TbPic> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	    		String hql="from TbPic order by id";
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
	
	public void delete(TbPicDto picdto) {
		// TODO Auto-generated method stub
		TbPic pic = (TbPic)super.getHibernateTemplate().get(TbPic.class, picdto.getTbPic().getId());
		super.getHibernateTemplate().delete(pic);
		
	}
	
	public List<TbPic> updateInit(String id) {
		String hql="from TbPic where id='"+id+"'";
		List<TbPic> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	
	public void update(TbPicDto picdto) {
		TbPic pic =picdto.getTbPic();
		super.getHibernateTemplate().update(pic);
	}
	
	public void insert(TbPicDto picdto) {
		TbPic pic =picdto.getTbPic();
		super.getHibernateTemplate().save(pic);				
	}
	
	public List detail(String id) {
		// TODO Auto-generated method stub
		String hql="from TbPic where id='"+id+"'";
		List<TbPic> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	
	
}
