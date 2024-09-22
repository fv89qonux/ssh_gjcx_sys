package com.service.impl;


import java.util.ArrayList;
import java.util.List;

import com.dao.LineDao;
import com.model.TbLine;
import com.model.TbLineDto;
import com.service.LineService;
import com.util.PageUtil;

public class LineServiceImpl implements LineService{
	
	private LineDao lineDao;

	public List searchInit() {
		return lineDao.searchInit();
	}
	
	/**
	 * 换乘搜索
	 */
	public List<TbLineDto> changeSearch(TbLineDto linedto) {
		 List<TbLineDto> dtoList = new ArrayList<TbLineDto>();
		//换乘算法
		linedto = this.lineDao.changeSearch(linedto);
		if(linedto.getStarts()==null || linedto.getStarts().size()==0
				||linedto.getEnds()==null || linedto.getEnds().size()==0) {
			return null;
		} else {
			List<TbLine> starts = linedto.getStarts();
			List<TbLine> ends = linedto.getEnds();
			//双重循环，以起点作为外围循环
			//先取出起点第一条线路所有站点从输入的起点位置开始与终点所有线路的从输入的终点位置开始的所有站点匹配
			//是否匹配，是则记录中转站，返回该2条线路结果，break，继续匹配
			//否则继续匹配
			
			//起点线路所有站点
			List<String> startSites = null;
			//终点线路所有站点
			List<String> endSites = null;
			//记录输入起点在线路中的位置
			int sp = 0;
			//记录输入终点在线路中的位置
			int ep = 0;
			
			for(TbLine start: starts) {
				startSites = start.getStationList();
				sp = start.getP();
				for(TbLine end : ends) {
					endSites = end.getStationList();
					ep = end.getP();
					//双重循环匹配
					//将起点线路的所有站点与终点线路的所有站点比较
					for(int i=sp;i<startSites.size();i++) {
						
						for(int j=0;j<=ep;j++) {
							//如果s和e相等则记录该中转站,并将该2条线路存入dto
							if(endSites.get(j).equals(startSites.get(i))){
								TbLineDto dto = new TbLineDto();
								dto.setChange(endSites.get(j));
								dto.setFirstLine(start);
								dto.setSecondLine(end);
								dtoList.add(dto);
							}
						}
					}
				}
			}
			
		}
		
		return dtoList;
	}
		
	//公交搜索，简单搜索和直达线路搜索
	public List search(TbLineDto linedto,PageUtil pageUtil) {
		// TODO Auto-generated method stub
		return lineDao.search(linedto,pageUtil);
	}
	//公交预览
	public List lineScan(PageUtil pageUtil) {
		return this.lineDao.lineScan(pageUtil);
		
	}
	/**
	 * 统计公交预览
	 * @return
	 */
	public long countLinebyName(){
		return this.lineDao.countLinebyName();
	}
	
	/**
	 *公共统计方法
	 * @return
	 */
	public long countRecord(String hql){
		return this.lineDao.countRecord(hql);
	}
	
	public void delete(TbLineDto linedto) {
		// TODO Auto-generated method stub
		lineDao.delete(linedto);
	}

	public void insert(TbLineDto linedto) {
		// TODO Auto-generated method stub
		lineDao.insert(linedto);
	}

	public void update(TbLineDto linedto) {
		// TODO Auto-generated method stub
		lineDao.update(linedto);
	}

	public List<TbLine> updateInit(String id) {
		// TODO Auto-generated method stub
		List<TbLine> list =lineDao.updateInit(id);
		return list;
	}


	public List lineDetail(String value,int flag) {
		return lineDao.lineDetail(value,flag);
	}


	
	public LineDao getLineDao() {
		return lineDao;
	}

	public void setLineDao(LineDao lineDao) {
		this.lineDao = lineDao;
	}

	
	
}
