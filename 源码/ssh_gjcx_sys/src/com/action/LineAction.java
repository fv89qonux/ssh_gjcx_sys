package com.action;

import java.util.List;

import com.model.TbLine;
import com.model.TbLineDto;
import com.service.LineService;
import com.util.PageUtil;

/**
 * 线路管理类
 * @author Administrator
 *
 */
public class LineAction extends BaseActionSupport {
	private LineService lineService;
	private TbLineDto linedto;
	
	/**
	 * 查询按钮
	 * @return 字符
	 */
	public String searchInit() throws Exception{
		if(linedto != null) {
			linedto=new TbLineDto();
		}
		
		List list = lineService.searchInit();
		setAttribute("lineList",list);
		return "searchInitSuccess";
	}

	public String searchQInit() throws Exception{
		if(linedto != null) {
			linedto=new TbLineDto();
		}
		
		List list = lineService.searchInit();
		setAttribute("lineList",list);
		return "searchQInitSuccess";
	}

	/**
	 * 前台查询方法
	 * @return
	 * 
	 */
	public String searchQ(){
		try {
			String hql = "select count(*)from TbLine where 1=1";
			if(linedto==null) {
				linedto = new TbLineDto();
			}else if(linedto.getTbLine()!=null){
				//公共部分
				if ( linedto.getTbLine().getNameboard()!=null&&!"".equals(linedto.getTbLine().getNameboard())){
					linedto.getTbLine().setNameboard(this.getValue(linedto.getTbLine().getNameboard()).trim());
					hql =hql+" and nameboard like '%"+linedto.getTbLine().getNameboard()+"%'";
				}
				if (linedto.getTbLine().getSite()!=null&&!"".equals(linedto.getTbLine().getSite())){
					String site = this.getValue(linedto.getTbLine().getSite());
					linedto.getTbLine().setSite(site.trim());
					hql =hql+" and site like '%"+linedto.getTbLine().getSite().trim()+"%'";
				}
				//输入起点和终点时找到类似满足不要换乘的线路
				if (!"".equals(linedto.getTbLine().getRouteend()) && !"".equals(linedto.getTbLine().getRoutef())){
					linedto.getTbLine().setRouteend(getValue(linedto.getTbLine().getRouteend()).trim());
					linedto.getTbLine().setRoutef(getValue(linedto.getTbLine().getRoutef()).trim());
					hql =hql+" and site like '%"+linedto.getTbLine().getRoutef().trim()+"%"+linedto.getTbLine().getRouteend().trim()+"%'";
				}
			}
			//分页查询条件设置
			this.setTotalCount(this.lineService.countRecord(hql));
			PageUtil pageUtil = new PageUtil();
			pageUtil.setPaged(this.getOffset());
			
			List list =lineService.search(linedto,pageUtil);
			
			int count = 0;
			if(linedto.getTbLine()!=null && !linedto.getTbLine().getRoutef().equals("") && !linedto.getTbLine().getRouteend().equals("")
					&& list!=null && list.size()==0 ){
				//如果直达线路找不到，则换乘搜索
				List<TbLineDto> dtoList  = this.lineService.changeSearch(linedto);
				count = dtoList.size();
				if(dtoList != null && dtoList.size()!=0) {
					this.setTotalCount(dtoList.size());
					//换乘分页
					this.setPageSize(10);
					if(this.getOffset()+this.getPageSize()>dtoList.size()){
						dtoList = dtoList.subList(this.getOffset(),dtoList.size());
					}else {
						dtoList = dtoList.subList(this.getOffset(),this.getOffset()+this.getPageSize());
					}
					
					super.getRequest().setAttribute("list", dtoList);
				}
				super.getRequest().setAttribute("count", count);
				return "changeSuccess";
			}
			if(list==null || list.size()==0) {
				super.getRequest().setAttribute("count", count);
				return "changeSuccess";
			}
			setAttribute("lineList", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "searchQSuccess";
		
	}
	/**
	 * 查询方法
	 * @return
	 * 
	 */
	public String search(){
		String hql = "select count(*)from TbLine where 1=1";
		if(linedto==null) {
			this.linedto = new TbLineDto();
		}
		if(this.linedto.getTbLine()!=null) {
			//公共部分
			if ( linedto.getTbLine().getNameboard()!=null&&!"".equals(linedto.getTbLine().getNameboard())){
				linedto.getTbLine().setNameboard(this.getValue(linedto.getTbLine().getNameboard()).trim());
				hql =hql+" and nameboard like '%"+linedto.getTbLine().getNameboard()+"%'";
			}
			if (linedto.getTbLine().getSite()!=null&&!"".equals(linedto.getTbLine().getSite())){
				String site = this.getValue(linedto.getTbLine().getSite());
				linedto.getTbLine().setSite(site.trim());
				hql =hql+" and site like '%"+linedto.getTbLine().getSite().trim()+"%'";
			}
		
			//后台查询
			if (linedto.getTbLine().getRouteend()!=""&&!"".equals(linedto.getTbLine().getRouteend())){
				linedto.getTbLine().setRouteend(getValue(linedto.getTbLine().getRouteend()).trim());
				hql =hql+" and routeend like '%"+linedto.getTbLine().getRouteend().trim()+"%'";
			}
			if (linedto.getTbLine().getRoutef()!=""&&!"".equals(linedto.getTbLine().getRoutef())){
				linedto.getTbLine().setRoutef(getValue(linedto.getTbLine().getRoutef()).trim());
				hql =hql+" and routef like '%"+linedto.getTbLine().getRoutef().trim()+"%'";
			}
		}
		this.setTotalCount(this.lineService.countRecord(hql));
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPageSize(10);
		this.setPageSize(10);
		pageUtil.setPaged(this.getOffset());
		List list =lineService.search(linedto,pageUtil);
		setAttribute("lineList", list);
		return "searchSuccess";
		
	}
	/**
	 * 删除操作
	 * @return
	 * @throws Exception
	 */
	public String delete()throws Exception{
		lineService.delete(linedto);
		setAttribute("mess", "信息删除成功!");
		return "deleteSuccess";
		
	}
	
	
	/**
	 * 编辑按钮
	 * @return
	 * @throws Exception
	 */
	public String updateInit()throws Exception{
		setAttribute("title", "更新");
		List<TbLine> list = lineService.updateInit(linedto.getTbLine().getId());
	 // 将结果取出，赋给line
		TbLine line = (TbLine) list.get(0);
		linedto.setTbLine(line);
		return "updateInitSuccess";
		
	}
	
	/**
	 * 编辑保存按钮
	 */
	public String update()throws Exception{
		lineService.update(linedto);
		setAttribute("mess", "信息保存成功!");
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
		
    	lineService.insert(linedto);
    	setAttribute("mess", "信息保存成功!");
    	return "insertSuccess";
	}

	//显示详细
	public String lineDetail() throws Exception{
		String flag = this.getRequest().getParameter("flag");
		//搜索
		if(flag!=null && !flag.equals("")) {
			List list = lineService.lineDetail(linedto.getTbLine().getId(),Integer.parseInt(flag));
			TbLine line=(TbLine) list.get(0);
			line.setVotes(line.getSite().split("-"));
			String str[]=line.getVotes();
			list.add(line);
			setAttribute("list", list);
			setAttribute("str", str);
			return "detail";
		}else {
			String name = this.getParameter("name");
//			name = new String(name.getBytes("ISO-8859-1"),"UTF-8");
			List list = lineService.lineDetail(name.trim(),0);
			if(list!=null && list.size()>0) {
				TbLine line=(TbLine) list.get(0);
				line.setVotes(line.getSite().split("-"));
				String str[]=line.getVotes();
				if(list.size()>=1) {
					TbLine line1=(TbLine) list.get(0);
					line1.setVotes(line1.getSite().split("-"));
					String str1[]=line1.getVotes();
					int size1 = str.length;
					int size2 = str1.length;
					setAttribute("list", list);
					setAttribute("str", str);
					setAttribute("str1", str1);
					setAttribute("size2", size2);
					setAttribute("size1", size1);
				}
			}
			return "lineDetailSuccess";
		}
	}
	
	//公交预览
	public String lineScan(){
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		List list = this.lineService.lineScan(pageUtil);
		this.setTotalCount(this.lineService.countLinebyName());
		setAttribute("list", list);
		return "lineScan";
	}
	
	
	public LineService getLineService() {
		return lineService;
	}

	public void setLineService(LineService lineService) {
		this.lineService = lineService;
	}

	public TbLineDto getLinedto() {
		return linedto;
	}

	public void setLinedto(TbLineDto linedto) {
		this.linedto = linedto;
	}



}
