package com.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.model.TbManager;
import com.model.TbMember;
import com.model.TbMemberDto;
import com.util.PageUtil;

public class UserDao extends HibernateDaoSupport {
	
	/**
	 * 用户登陆
	 * @param usercode
	 * @param pwd
	 * @return
	 */
	public List login(String usercode,String pwd) {
		// TODO Auto-generated method stub
		boolean result =false;
		String hql="from TbManager u where u.manager='"+usercode+"' and u.pwd='"+pwd+"'";
		
		List<TbManager> list = super.getHibernateTemplate().find(hql);
		
		return list;
	}
	
	public List memLogin(String usercode,String pwd) {
		// TODO Auto-generated method stub
		String hql="from TbMember u where u.userName='"+usercode+"' and u.passWord='"+pwd+"'";
		
		List<TbManager> list = super.getHibernateTemplate().find(hql);
		
		return list;
	}
	
	public List findUserByUserName(String userName) {
		String hql="from TbMember u where u.userName='"+userName+"'";
		
		List<TbManager> list = super.getHibernateTemplate().find(hql);
		
		return list;
	}
	/**
	 * 密码修改
	 */
	public void pwdupdate(TbMember user){
		
		super.getHibernateTemplate().update(user);
	}
	
	
	@SuppressWarnings("unchecked")
	public List search(final PageUtil pageUtil) {
		
		//List<TbMember> list = super.getHibernateTemplate().find(hql);
		List<TbMember> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	        	String hql="from TbMember order by id";
	        	Query query =session.createQuery(hql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	            return query.list();
	        }
	    });
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
	
	public List detail(String id) {
		// TODO Auto-generated method stub
		String hql="from TbMember where id='"+id+"'";
		List<TbMember> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	
	public void delete(TbMemberDto memberdto) {
		TbMember member = (TbMember)super.getHibernateTemplate().get(TbMember.class, memberdto.getTbMember().getId());
		super.getHibernateTemplate().delete(member);
		
	}
	
	public void insert(TbMemberDto memberdto) {
		TbMember member =memberdto.getTbMember();
		super.getHibernateTemplate().save(member);				
	
	}
	
	public List<TbMember> updateInit(String zuid) {
		String hql="from TbMember where id='"+zuid+"'";
		System.out.println(hql);
		List<TbMember> list = super.getHibernateTemplate().find(hql);
		return list;
		
	}
	
	public void update(TbMemberDto memberdto) {
		// TODO Auto-generated method stub
		TbMember tbgl =memberdto.getTbMember();
		super.getHibernateTemplate().update(tbgl);
	}
	
}
