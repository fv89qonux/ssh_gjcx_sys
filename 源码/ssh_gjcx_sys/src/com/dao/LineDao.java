package com.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


import com.model.TbLine;
import com.model.TbLineDto;
import com.model.TbMessage;
import com.util.PageUtil;

public class LineDao extends HibernateDaoSupport {
	
	/**
	 * 查询按钮
	 * @param 
	 * @return
	 */
	public List searchInit() {
		String hql="from TbLine";
		List<TbMessage> list = super.getHibernateTemplate().find(hql);
		return list;
	}
	
	//公交搜索，简单搜索和直达线路搜索

	@SuppressWarnings("unchecked")
	public List search(TbLineDto linedto,final PageUtil pageUtil){
		//前台查询
		String hql="from TbLine where 1=1 ";
		if(linedto.getTbLine()!=null) {
			//公共部分
			if ( linedto.getTbLine().getNameboard()!=null&&!"".equals(linedto.getTbLine().getNameboard())){
				linedto.getTbLine().setNameboard(linedto.getTbLine().getNameboard().trim());
				hql =hql+" and nameboard like '%"+linedto.getTbLine().getNameboard()+"%'";
			}
			if (linedto.getTbLine().getSite()!=null&&!"".equals(linedto.getTbLine().getSite())){
				linedto.getTbLine().setSite(linedto.getTbLine().getSite().trim());
				hql =hql+" and site like '%"+linedto.getTbLine().getSite().trim()+"%'";
			}
			
			if(linedto.getFlag()!=null && linedto.getFlag().equals("1")) {
				//输入起点和终点时找到类似满足不要换乘的线路
				if (!"".equals(linedto.getTbLine().getRouteend()) && !"".equals(linedto.getTbLine().getRoutef())){
					linedto.getTbLine().setRouteend(linedto.getTbLine().getRouteend().trim());
					linedto.getTbLine().setRoutef(linedto.getTbLine().getRoutef().trim());
					hql =hql+" and site like '%"+linedto.getTbLine().getRoutef().trim()+"%"+linedto.getTbLine().getRouteend().trim()+"%'";
				}
				
			}else {
				//后台查询
				if (linedto.getTbLine().getRouteend()!=""&&!"".equals(linedto.getTbLine().getRouteend())){
					linedto.getTbLine().setRouteend(linedto.getTbLine().getRouteend().trim());
					hql =hql+" and routeend like '%"+linedto.getTbLine().getRouteend().trim()+"%'";
				}
				if (linedto.getTbLine().getRoutef()!=""&&!"".equals(linedto.getTbLine().getRoutef())){
					linedto.getTbLine().setRoutef(linedto.getTbLine().getRoutef().trim());
					hql =hql+" and routef like '%"+linedto.getTbLine().getRoutef().trim()+"%'";
				}
			}
		}
		
		hql=hql+" order by id";
		//list =super.getHibernateTemplate().find(hql);
		final String sql = hql;
		List<TbLine> list = (List) getHibernateTemplate().execute(
	            new HibernateCallback() {
	        public Object doInHibernate(Session session)
	                throws HibernateException {
	            Query query =session.createQuery(sql);
	            query.setFirstResult(pageUtil.getPaged());
	    		query.setMaxResults(pageUtil.getPageSize());
	            return query.list();
	        }
	    });
		
		return list;
		
	}
	
	/**
	 * 一次换乘搜索
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public TbLineDto changeSearch(TbLineDto linedto) {
		String hql="from TbLine where 1=1 ";
		//存放起点相关线路
		List<TbLine> firsts = null;
		
		//存放终点相关线路
		List<TbLine> seconds = null;
		if(linedto.getTbLine()!=null) {
			if (!"".equals(linedto.getTbLine().getRoutef())){
				String hql1 =hql+" and site like '%"+linedto.getTbLine().getRoutef().trim()+"%'";
				hql1=hql1+" order by id";
	
				firsts = getHibernateTemplate().find(hql1);
			}
			
			if (!"".equals(linedto.getTbLine().getRouteend())){
				String hql2 =hql+" and site like '%"+linedto.getTbLine().getRouteend().trim()+"%'";
				hql2=hql2+" order by id";
				seconds =super.getHibernateTemplate().find(hql2);
			}
			
			//找不到起点或者终点相关线路,返回空
			if(firsts==null || seconds==null || firsts.size()==0 || seconds.size()==0) {
				return linedto;
			}else {
				//解析站点
				firsts = parseLine(firsts,linedto.getTbLine().getRoutef());
				seconds = parseLine(seconds,linedto.getTbLine().getRouteend());
				linedto.setStarts(firsts);
				linedto.setEnds(seconds);
				
			}
		}
		return linedto;
	}
	
	//解析站点,将站点字符串存放到TbLine里面的list中
	private List<TbLine> parseLine(List<TbLine> list,String station){
		List<TbLine> newList = new ArrayList<TbLine>();
		for(int j=0;j<list.size();j++) {
			TbLine line = list.get(j);
			//站点字符串
			line.setVotes(line.getSite().split("-"));
			//将数字转换成list
			line.setStationList(Arrays.asList(line.getVotes())) ;
			//记录输入站点的位置
			List<String> sList = line.getStationList();
			
			for(int i=0;i<sList.size();i++) {
				//如果相等记录位置,并将该线路加入新的list
				if(sList.get(i).equals(station)) {
					line.setP(i);
					newList.add(line);
					break;
				}
			}
		}
		
		return newList;
	}
	

	
	/**
	 * 公交预览dao
	 */
	@SuppressWarnings("unchecked")
	public List lineScan(final PageUtil pageUtil) {
		List<String> list = null;
		try {
			 list = (List) getHibernateTemplate().execute(
		            new HibernateCallback() {
		        public Object doInHibernate(Session session)
		                throws HibernateException {
		    		String sql = "select  distinct(nameboard) from TbLine";
		            Query query =session.createQuery(sql);
		            query.setFirstResult(pageUtil.getPaged());
		    		query.setMaxResults(pageUtil.getPageSize());
		            return query.list();
		        }
		    });
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//统计公交预览
	public long countLinebyName(){
		long count = 0;
		try{
			String hql =  "select count(*)from TbLine";
			List list = super.getHibernateTemplate().find(hql);
			count = (Long)(list.get(0))/2;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
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
	
	public void delete(TbLineDto linedto) {
		TbLine line = (TbLine)super.getHibernateTemplate().get(TbLine.class, linedto.getTbLine().getId());
		super.getHibernateTemplate().delete(line);
		
	}
	
	public List<TbLine> updateInit(String zuid) {
		String hql="from TbLine where id='"+zuid+"'";
		List<TbLine> list = super.getHibernateTemplate().find(hql);
		return list;
		
	}
	
	public void update(TbLineDto linedto) {
		TbLine line =linedto.getTbLine();
		super.getHibernateTemplate().update(line);
	}
	
	public void insert(TbLineDto linedto) {
		TbLine line =linedto.getTbLine();
		super.getHibernateTemplate().save(line);				
	
	}
		
	public List lineDetail(String value,int flag) {
		String hql = null;
		if(flag == 1) {
			hql="from TbLine where id='"+value+"'";
		}else {
			hql="from TbLine where nameboard='"+value+"'";

		}
		List<TbLine> list = super.getHibernateTemplate().find(hql);

		return list;
	}
}
