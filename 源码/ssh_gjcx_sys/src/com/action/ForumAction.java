package com.action;

import java.text.SimpleDateFormat;
import java.util.List;

import com.model.TbDetailDto;
import com.model.TbForumDto;
import com.model.TbMember;
import com.service.ForumService;
import com.util.PageUtil;




public class ForumAction extends BaseActionSupport {
	
	private ForumService forumService;
	private TbForumDto forumdto;
	private TbDetailDto detaildto;
	private String forumd;
	
	//后台
	public String search() throws Exception{
		String hql = "select count(*) from TbForum";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setPageSize(10);
		pageUtil.setPageSize(10);
		List list = forumService.search(pageUtil);
		this.setTotalCount(this.forumService.countRecord(hql));
		setAttribute("forumList",list);
		return "searchSuccess";
	}
	/**
	 * 显示后台论坛标题详细
	 * @return
	 * @throws Exception
	 */
	public String searchDetail() throws Exception{
		String hql="select count(*) from TbDetail where forumid='"+forumdto.getTbForum().getId()+"'";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setTotalCount(this.forumService.countRecord(hql));
		List list = forumService.searchDetail(forumdto.getTbForum().getId(), pageUtil);
		setAttribute("detailList",list);
		return "searchDetaiSuccess";
	}
	
	//前台
	public String searchQ() throws Exception{
		String hql = "select count(*) from TbForum";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setTotalCount(this.forumService.countRecord(hql));
		List list = forumService.search(pageUtil);
		setAttribute("forumList",list);
		
		return "searchQSuccess";
	}
	
	public String insertInit()throws Exception{
		return "insertInitSuccess";
	}
	
	public String insert()throws Exception{
		
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
		forumdto.getTbForum().setIntime(currentDate);
		TbMember user  = (TbMember)getRequest().getSession().getAttribute("username");
		forumdto.getTbForum().setFather(user.getUserName());
		forumService.insert(forumdto);
		return "insertSuccess";
	}
	
	
	public String detailInit()throws Exception{
		return "detailInitSuccess";
	}
	
	public String insertDetail()throws Exception{
		
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
		detaildto.getTbDetail().setForumid(forumd);
		detaildto.getTbDetail().setIntime(currentDate);
		TbMember user  = (TbMember)getRequest().getSession().getAttribute("username");
		detaildto.getTbDetail().setWho(user.getUserName());
		forumService.insertDetail(detaildto);
		return "insertDetailSuccess";
	}
	/**
	 * 前台显示详细
	 * @return
	 * @throws Exception
	 */
	public String detail() throws Exception{
		String hql="select count(*) from TbDetail where forumid='"+forumdto.getTbForum().getId()+"'";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setTotalCount(this.forumService.countRecord(hql));
		List list = forumService.detail(forumdto.getTbForum().getId(),pageUtil);
		setAttribute("list", list);//取论坛主表
		List detail = forumService.forumdetail(forumdto.getTbForum().getId(),pageUtil);
		setAttribute("detail", detail);//取论坛明细
		return "detailSuccess";
	}
	
	
	public String delete()throws Exception{
		forumService.delete(forumdto);
		setAttribute("mess", "信息删除成功!");
		return "deleteSuccess";
		
	}
	public String deleteDetail()throws Exception{
		forumService.deleteDetail(detaildto);
		setAttribute("mess", "信息删除成功!");
		return "deleteDetailSuccess";
		
	}
	
	
	public ForumService getForumService() {
		return forumService;
	}
	public void setForumService(ForumService forumService) {
		this.forumService = forumService;
	}
	public TbForumDto getForumdto() {
		return forumdto;
	}
	public void setForumdto(TbForumDto forumdto) {
		this.forumdto = forumdto;
	}

	public TbDetailDto getDetaildto() {
		return detaildto;
	}

	public void setDetaildto(TbDetailDto detaildto) {
		this.detaildto = detaildto;
	}

	public String getForumd() {
		return forumd;
	}

	public void setForumd(String forumd) {
		this.forumd = forumd;
	}

	

	
}

