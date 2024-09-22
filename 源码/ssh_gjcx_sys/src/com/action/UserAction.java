package com.action;

import java.util.List;

import com.model.TbManager;
import com.model.TbManagerDto;
import com.model.TbMember;
import com.model.TbMemberDto;
import com.service.UserService;
import com.util.PageUtil;



public class UserAction extends BaseActionSupport {
	
	private UserService userService;
	private TbManagerDto userdto;
	private String manager;
	private String pwd;
	private TbManager user;
	
	private TbMemberDto memberdto;
	private String userName;
	private String passWord;
	/**
	 * 管理员登陆方法
	 * @return
	 */
	public String login(){
		List list =(List) userService.login(manager,pwd);
		if (list.size()!=0){
			//获取用户信息存入session
			TbManager user=(TbManager)list.get(0);
			getRequest().getSession().removeAttribute("user");
			getRequest().getSession().setAttribute("user", user);
			return "success";
		}else{
			this.msg = "用户名或密码错误，请重新输入！";
			return "failure";
		}
			
			
	}
	/**
	 * 会员登录
	 * @return
	 */
	public String memLogin(){
		List list =(List) userService.memLogin(userName,passWord);
		if (list !=null && list.size()!=0){
			//获取用户信息存入session
			TbMember user=(TbMember)list.get(0);
			getRequest().getSession().removeAttribute("username");
			getRequest().getSession().setAttribute("username", user);
			return "memLoginSuccess";
		}else{
			this.msg = "用户名或密码错误,请重新登录";
			return "fail";
		}
			
			
	}
	
	
	
	
	/**
	 * 退出按钮
	 * @return
	 */
	public String enterAgain(){
		getRequest().getSession().removeAttribute("username");
		return "enterAgain";
		
	}
	
	/**
	 * 退出按钮
	 * @return
	 */
	public String enterHAgain(){
		getRequest().getSession().removeAttribute("user");
		return "enterHAgain";
		
	}
	
	/**
	*
	*查询功能
	*/
	public String search() throws Exception{
		String hql = "select count(*) from TbMember";
		PageUtil pageUtil = new PageUtil();
		pageUtil.setPaged(this.getOffset());
		this.setPageSize(10);
		pageUtil.setPageSize(10);
		List list = userService.search(pageUtil);
		this.setTotalCount(this.userService.countRecord(hql));
		setAttribute("userList",list);
		return "searchSuccess";
	}
	
	
	public String updateInit()throws Exception{
		this.msg = null;
		if(getRequest().getSession().getAttribute("username")!=null) {
			List<TbMember> list = userService.updateInit(((TbMember)getRequest().getSession().getAttribute("username")).getId());
			TbMember member = (TbMember) list.get(0);
			if(this.memberdto ==null) {
				memberdto = new TbMemberDto();
			}
			memberdto.setTbMember(member);
			return "updateInitSuccess";
		}
		this.msg = "登录超时，请重新登录";
		return "updateInitFail";
		
	}
	//更新
	public String update()throws Exception{
		
		userService.update(memberdto);
		this.msg = "修改成功";
		return "updateSuccess";
		
	}
	
	public String manage() throws Exception{
		return "managerSuccess";
	}
	
	public String detail() throws Exception{
		List list = userService.detail(memberdto.getTbMember().getId());
		setAttribute("list", list);
		return "detailSuccess";
	}
	
	public String delete()throws Exception{
		userService.delete(memberdto);
		return "deleteSuccess";
		
	}
	//初始化注册
	public String insertInit()throws Exception{
		return "insertInitSuccess";
		
	}
	/**
	 * 用户注册
	 * @return
	 * @throws Exception
	 */
	public String insert()throws Exception{
		
		List<TbMember> list =  this.userService.findUserByUserName(this.memberdto.getTbMember().getUserName());
		if(list != null && list.size() !=0) {
			this.msg = "用户名 " +this.memberdto.getTbMember().getUserName() + " 已经存在，请重新注册！";
			return "insertInitSuccess";
		}
		userService.insert(memberdto);
		this.msg = this.memberdto.getTbMember().getUserName()+"  恭喜你注册成功，你现在可以登录了！";
		return "insertSuccess";
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public TbManagerDto getUserdto() {
		return userdto;
	}

	public void setUserdto(TbManagerDto userdto) {
		this.userdto = userdto;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public TbManager getUser() {
		return user;
	}

	public void setUser(TbManager user) {
		this.user = user;
	}



	public TbMemberDto getMemberdto() {
		return memberdto;
	}

	public void setMemberdto(TbMemberDto memberdto) {
		this.memberdto = memberdto;
	}

	

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
}
