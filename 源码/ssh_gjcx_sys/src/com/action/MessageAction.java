package com.action;

import java.text.SimpleDateFormat;
import java.util.List;

import com.model.TbGg;
import com.model.TbManager;
import com.model.TbMember;
import com.model.TbMessage;
import com.model.TbMessageDto;
import com.service.MessageService;
import com.util.PageUtil;




public class MessageAction extends BaseActionSupport {
	
	private MessageService messageService;
	private TbMessageDto messagedto;
	
	/**
	 * 查询按钮
	 * @return 字符
	 */
	public String search() throws Exception{
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setPageSize(10);
		pageUtil.setPageSize(10);
		List list = messageService.search(pageUtil);
		String hql = "select count(*) from TbMessage";
		this.setTotalCount(this.messageService.countRecord(hql));
		setAttribute("messageList",list);
		return "searchSuccess";
	}
	
	public String searchQ() throws Exception{
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setPageSize(8);
		pageUtil.setPageSize(8);
		List list = messageService.search(pageUtil);
		String hql = "select count(*) from TbMessage";
		this.setTotalCount(this.messageService.countRecord(hql));
		setAttribute("messageList",list);
		return "searchQSuccess";
	}

	public String delete()throws Exception{
		messageService.delete(messagedto);
		setAttribute("mess", "信息删除成功!");
		return "deleteSuccess";
		
	}
	
	/**
	 * 编辑按钮
	 * @return
	 * @throws Exception
	 */
	public String updateInit()throws Exception{
		List<TbMessage> list = messageService.updateInit(messagedto.getTbMessage().getId());
		TbMessage message = (TbMessage) list.get(0);
		messagedto.setTbMessage(message);
		return "updateInitSuccess";
		
	}
	
	/**
	 * 编辑保存按钮
	 */
	public String update()throws Exception{
		TbManager user=((TbManager)getRequest().getSession().getAttribute("user"));
		messagedto.getTbMessage().setRenamea(user.getManager());
		messageService.update(messagedto);
		setAttribute("mess", "信息回复成功!");
		return "updateSuccess";
		
	}
	
	
	public String detail() throws Exception{
		List list = messageService.detail(messagedto.getTbMessage().getId());
		setAttribute("list", list);
		return "detailSuccess";
	}
	public String insertInit()throws Exception{
		setAttribute("title", "添加");
		return "insertInitSuccess";
		
	}
	
	public String insert()throws Exception{
		
		SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate=date.format(new java.util.Date());
		messagedto.getTbMessage().setIntime(currentDate);
		messagedto.getTbMessage().setWho(((TbMember)getRequest().getSession().getAttribute("username")).getUserName());
		messageService.insert(messagedto);
		return "insertSuccess";
	}
	
	public MessageService getMessageService() {
		return messageService;
	}

	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	public TbMessageDto getMessagedto() {
		return messagedto;
	}

	public void setMessagedto(TbMessageDto messagedto) {
		this.messagedto = messagedto;
	}
	

	
}
