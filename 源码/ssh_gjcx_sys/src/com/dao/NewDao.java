package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbGg;
import com.model.TbGgDto;
import com.util.PageUtil;

public class NewDao extends HibernateDaoSupport {
	
	/**
	 * 查询按钮
	 * @param 
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		//List<TbGg> list = super.getHibernateTemplate().find(hql);
		//分页
		List<TbGg> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	    		String hql="from TbGg order by id desc";
	            Query query =session.createQuery(hql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	            return query.list();
	        }
	    });
		return list;
	}
	
	/**
	 * 详细按钮,编辑按钮共用一个方法
	 * @param 
	 * @return
	 */
	public List detail(String id) {
		// TODO Auto-generated method stub
		String hql="from TbGg where id='"+id+"'";
		System.out.println(hql);
		List<TbGg> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	
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
	 *编辑按钮
	 * @param 
	 * @return
	 
	 */
	public List<TbGg> updateInit(String zuid) {
		String hql="from TbGg where id='"+zuid+"'";
		List<TbGg> list = super.getHibernateTemplate().find(hql);
		return list;
		
	}
	
	
	public void update(TbGgDto newdto) {
		// TODO Auto-generated method stub
		TbGg tbgl =newdto.getTbGg();
		super.getHibernateTemplate().update(tbgl);
	}
	
	/**
	 *添加按钮中的保存操作
	 * @param userzudao
	 * @return
	 
	 */
	public void insert(TbGgDto newdto) {
		TbGg tbgl =newdto.getTbGg();
			
		super.getHibernateTemplate().save(tbgl);				
	
	}
	
	/**
	 * 删除按钮
	 * @param userzudao
	 * @return
	 */
	public void delete(TbGgDto newdto) {
		// TODO Auto-generated method stub
		TbGg tbgl = (TbGg)super.getHibernateTemplate().get(TbGg.class, newdto.getTbGg().getId());
		super.getHibernateTemplate().delete(tbgl);
		
	}
}
