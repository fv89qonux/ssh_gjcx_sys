package com.action;

import java.util.List;

import com.model.TbLoadDto;
import com.service.LoadService;
import com.util.PageUtil;




public class LoadAction extends BaseActionSupport {
	
	private LoadService loadService;
	private TbLoadDto loaddto;
	private List list;
	
	public String search() {	
		String hql = "select count(*) from TbLoad ";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		pageUtil.setPageSize(8);
		this.setPageSize(8);
		list = loadService.search(pageUtil);
		this.setTotalCount(this.loadService.countRecord(hql));
		setAttribute("loadList",list);
		return "searchSuccess";
	}
	
	public String searchQ() {	
		String hql = "select count(*) from TbLoad ";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		pageUtil.setPageSize(10);
		this.setPageSize(10);
		list = loadService.search(pageUtil);
		this.setTotalCount(this.loadService.countRecord(hql));
		setAttribute("loadList",list);
		return "searchQSuccess";
	}

	public String insertInit() {	
		return "insertInitSuccess";
	}
	public String insert() {
		loadService.insert(loaddto);
		return "insertSuccess";
	}
	
	public String insertInitQ() {	
		return "insertInitQSuccess";
	}
	public String insertQ() {	
		loadService.insert(loaddto);
		return "insertQSuccess";
	}
	
	public String delete()throws Exception{
		loadService.delete(loaddto);
		return "deleteSuccess";
		
	}
	
	
	public LoadService getLoadService() {
		return loadService;
	}
	public void setLoadService(LoadService loadService) {
		this.loadService = loadService;
	}
	public TbLoadDto getLoaddto() {
		return loaddto;
	}
	public void setLoaddto(TbLoadDto loaddto) {
		this.loaddto = loaddto;
	}


	public List getList() {
		return list;
	}


	public void setList(List list) {
		this.list = list;
	}
	
	
	
	

}
