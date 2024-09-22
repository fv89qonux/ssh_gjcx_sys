package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbLoad;
import com.model.TbLoadDto;
import com.util.PageUtil;

public class LoadDao extends HibernateDaoSupport {
	
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		//List<TbLoad> list = super.getHibernateTemplate().find(hql);
		List<TbLoad> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	        	String hql="from TbLoad order by intime desc";
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
	
	public void insert(TbLoad load) {
		super.getHibernateTemplate().save(load);
	}
	
	public void delete(TbLoadDto loaddto) {
		// TODO Auto-generated method stub
		TbLoad message = (TbLoad)super.getHibernateTemplate().get(TbLoad.class, loaddto.getTbLoad().getId());
		super.getHibernateTemplate().delete(message);
		
	}
	public TbLoad searchLoadByLoadId (String id) {
		String hql="from TbLoad where id='"+id+"'";
		System.out.println(hql);
		List<TbLoad> list = super.getHibernateTemplate().find(hql);
		TbLoad load = list.get(0);
		return load;
	}

}
