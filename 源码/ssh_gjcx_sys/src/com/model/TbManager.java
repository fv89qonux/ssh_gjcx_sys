package com.model;

/**
 * TbManager generated by MyEclipse Persistence Tools
 */

public class TbManager implements java.io.Serializable {

	// Fields

	private String id;
	private String manager;
	private String pwd;

	// Constructors

	/** default constructor */
	public TbManager() {
	}

	/** full constructor */
	public TbManager(String id, String manager, String pwd) {
		this.id = id;
		this.manager = manager;
		this.pwd = pwd;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getManager() {
		return this.manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

}