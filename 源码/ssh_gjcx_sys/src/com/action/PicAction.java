package com.action;

import java.text.SimpleDateFormat;
import java.util.List;

import com.model.TbPic;
import com.model.TbPicDto;
import com.service.PicService;
import com.util.PageUtil;




public class PicAction extends BaseActionSupport {
	
	private PicService picService;
	private TbPicDto picdto;
	
	/**
	 * 查询按钮
	 * @return 字符
	 */
	public String search() throws Exception{
		String hql = "select count(*) from TbPic";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		pageUtil.setPageSize(10);
		this.setPageSize(10);
		List list = picService.search(pageUtil);
		this.setTotalCount(this.picService.countRecord(hql));
		setAttribute("picList",list);
		return "searchSuccess";
	}
	
	/**
	 * 后 台查询按钮
	 * @return 字符
	 */
	public String searchQ() throws Exception{
		String hql = "select count(*) from TbPic";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setPageSize(2);
		pageUtil.setPageSize(2);
		List list = picService.search(pageUtil);
		this.setTotalCount(this.picService.countRecord(hql));
		setAttribute("picList",list);
		return "searchQSuccess";
	}
	
	public String delete()throws Exception{
		picService.delete(picdto);
		return "deleteSuccess";
		
	}
	
	public String updateInit()throws Exception{
		setAttribute("title", "更新");
		List<TbPic> list = picService.updateInit(picdto.getTbPic().getId());
		TbPic pic = (TbPic) list.get(0);
		picdto.setTbPic(pic);
		return "updateInitSuccess";
		
	}
	

	public String update()throws Exception{
		picService.update(picdto);
		return "updateSuccess";
		
	}
	
	public String insertInit()throws Exception{
		setAttribute("title", "添加");
		return "insertInitSuccess";
		
	}
	
	public String insert()throws Exception{
		
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
		
		picdto.getTbPic().setIntime(currentDate);
		picService.insert(picdto);
		return "insertSuccess";
	}
	
	public String detail() throws Exception{
		List list = picService.detail(picdto.getTbPic().getId());
		setAttribute("list", list);
		return "detailSuccess";
	}
	
	public PicService getPicService() {
		return picService;
	}

	public void setPicService(PicService picService) {
		this.picService = picService;
	}

	public TbPicDto getPicdto() {
		return picdto;
	}

	public void setPicdto(TbPicDto picdto) {
		this.picdto = picdto;
	}
	
	
}
