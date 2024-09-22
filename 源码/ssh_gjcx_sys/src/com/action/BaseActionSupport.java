/**
 * 功能：各action类共用的基础类,各类的共用方法在这里调用。
 * 使用：各子类调用.
 * 修订说明: 
 *
 *   新增代码
 *
 */
package com.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.util.PageUtil;

public abstract class BaseActionSupport extends ActionSupport{
	public String msg;
	private int pageSize = 10;
	private long totalCount;
	
	/**
	 * 将所有URL参数合并成一个URL字符串(page参数除外), 提供分页时显示.
	 * @return 字符串, 如: para1=11&para2=bb
	 */
	public String mergeParamsAsURI() {
		Map<String, String[]> params = getRequest().getParameterMap();
		
		StringBuffer out = new StringBuffer();
		
		Set<String> keys = params.keySet();
		
		for (String key : keys) {
			if(!"page".equals(key)){
				// TODO 发现Map值有乱码
				String[] values = params.get(key);	
				if(values.length > 1) {
					values = getRequest().getParameterValues(key);
				} else {
					values = new String[] {getParameter(key)};
				}
				System.out.println("key=========" + key);		
				try {
					for(String value : values) {
						System.out.println("value=" + value);
						out.append(java.net.URLEncoder.encode(key, "UTF-8") + "=");
						out.append(java.net.URLEncoder.encode(value, "UTF-8") + "&");
					}

				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
		}
		// 删除末尾多余的 & 字符
		if(out.toString().endsWith("&")) {
			out.deleteCharAt(out.length() - 1);
		}
		
		return out.toString();
	}
	
	/**
	 * 从请求中取得offset的参数值
	 * @param request
	 * @return
	 */
	public Integer getOffset(){
		String os =getRequest().getParameter("pager.offset");
		int offset =0;
		try{
			offset =Integer.parseInt(os);
		}catch (Exception e) {
			offset =0;
		}
		return offset;
	}

	/**
	 * 读取表单参数
	 * @param name
	 * @return
	 */
	public String getParameter(String name) {
		String value = ServletActionContext.getRequest().getParameter(name);
		try {
			if(value!=null) {
//				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	/**
	 * 获取转码后的值
	 * @param value
	 * @return
	 */
	public String getValue(String value) {
		try {
			if(value!=null) {
//				value = new String(value.getBytes("ISO-8859-1"),"UTF-8");
				System.out.println(value);
		}}catch(Exception e) {
			e.printStackTrace();
		}
		return value;
	}
	
	/**
	 * 将表单参数作为整数返回.
	 * @param name 表单参数名
	 * @return
	 */
	public int getParameterInt(String name) {
		String s = getParameter(name);
		//判断String s是否为空
		if(s == null) {
			return 0;
		} else {
			try {
				return Integer.parseInt(s);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return 0;
	}
	/**
	 * 获取请求对象.
	 * @return
	 */
	public static HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	/**
	 * 获取请求对象.
	 * @return
	 */
	public static HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}
	/**
	 * 设置 request 的属性.
	 * @param name 属性名
	 * @param value 属性值
	 */
	public void setAttribute(String name, Object value) {
		ServletActionContext.getRequest().setAttribute(name, value);
	}
	
	/**
	 * 获取 request 的属性.
	 * @param name 属性名
	 */
	public Object getAttribute(String name) {
		return ServletActionContext.getRequest().getAttribute(name);
	}	
	/**
	 * 向 session 设置属性值
	 * @param name
	 * @param value
	 */
	public static void setSession(Object name, Object value) {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		session.put(name, value);
	}
	/**
	 * 向 session 设置属性值
	 * @param name
	 * @param value
	 */
	public  static Object getSession(String name) {
		ActionContext ctx = ActionContext.getContext();
		Map session = ctx.getSession();
		return session.get(name);
	}
	

	public String getMsg() {
		return msg;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	
	
	
}
