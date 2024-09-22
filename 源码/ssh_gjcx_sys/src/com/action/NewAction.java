package com.action;

import java.text.SimpleDateFormat;
import java.util.List;

import com.model.TbGg;
import com.model.TbGgDto;
import com.service.NewService;
import com.util.PageUtil;
import com.util.Util;




public class NewAction extends BaseActionSupport {
	
	private NewService newService;
	private TbGgDto newdto;
	
	/**
	 * 查询按钮
	 * @return 字符
	 */
	public String search() throws Exception{
		String hql = "select count(*) from TbGg";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		pageUtil.setPageSize(10);
		this.setPageSize(10);
		List list = newService.search(pageUtil);
		this.setTotalCount(this.newService.countRecord(hql));
		setAttribute("newList",list);
		return "searchSuccess";
	}
	
	public String searchQ() throws Exception{
		String hql = "select  count(*) from TbGg";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		List list = newService.search(pageUtil);
		this.setTotalCount(this.newService.countRecord(hql));
		setAttribute("newList",list);
		return "searchQSuccess";
	}
	
	/**
	 * 详细按钮
	 * @return 字符
	 */
	
	public String detail() throws Exception{
		List list = newService.detail(newdto.getTbGg().getId());
		setAttribute("list", list);
		return "detailSuccess";
	}
	
	
	/**
	 * 编辑按钮
	 * @return
	 * @throws Exception
	 */
	public String updateInit()throws Exception{
		setAttribute("title", "更新");
		List<TbGg> list = newService.updateInit(newdto.getTbGg().getId());
	 // 将结果取出，赋给tbgg
		TbGg tbgg = (TbGg) list.get(0);
		newdto.setTbGg(tbgg);
		return "updateInitSuccess";
		
	}
	
	/**
	 * 编辑保存按钮
	 */
	public String update()throws Exception{
		newService.update(newdto);
		return "updateSuccess";
		
	}
	
	/**
	 * 添加按钮初始化
	 * @return
	 * @throws Exception
	 */
	public String insertInit()throws Exception{
		setAttribute("title", "添加");
		return "insertInitSuccess";
		
	}
	
	/**
	 * 添加按钮保存操作
	 * @return
	 * @throws Exception
	 */
	public String insert()throws Exception{
		
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
	//	String c = Util.toHTMLString(newdto.getTbGg().getContent());
	//	newdto.getTbGg().setContent(c);
		newdto.getTbGg().setIntime(currentDate);
		newService.insert(newdto);
		return "insertSuccess";
	}
		
	/**
	 * 删除操作
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		newService.delete(newdto);
		return "deleteSuccess";
		
	}
	
	
	public NewService getNewService() {
		return newService;
	}
	public void setNewService(NewService newService) {
		this.newService = newService;
	}
	public TbGgDto getNewdto() {
		return newdto;
	}
	public void setNewdto(TbGgDto newdto) {
		this.newdto = newdto;
	}
	
}
