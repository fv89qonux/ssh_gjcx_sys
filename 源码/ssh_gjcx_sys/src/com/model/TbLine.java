package com.model;

import java.util.List;

/**
 * TbLine generated by MyEclipse Persistence Tools
 */

public class TbLine implements java.io.Serializable {

	// Fields

	private String id;
	private String nameboard;
	private String routef;
	private String routeend;
	private String runtime;
	private String price;
	private String globalprice;
	private String site;
	private String frequency;
	private String prompt;
	private String mold;
	private String memo;
	private String[] votes;
	private List<String> stationList;
	/**
	 * 记录输入站点位置
	 */
	private int p = -1;

	// Constructors

	/** default constructor */
	public TbLine() {
	}

	/** minimal constructor */
	public TbLine(String nameboard, String routef, String routeend,
			String runtime, String price, String globalprice, String site) {
		this.nameboard = nameboard;
		this.routef = routef;
		this.routeend = routeend;
		this.runtime = runtime;
		this.price = price;
		this.globalprice = globalprice;
		this.site = site;
	}

	/** full constructor */
	public TbLine(String nameboard, String routef, String routeend,
			String runtime, String price, String globalprice, String site,
			String frequency, String prompt, String mold, String memo) {
		this.nameboard = nameboard;
		this.routef = routef;
		this.routeend = routeend;
		this.runtime = runtime;
		this.price = price;
		this.globalprice = globalprice;
		this.site = site;
		this.frequency = frequency;
		this.prompt = prompt;
		this.mold = mold;
		
		this.memo = memo;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameboard() {
		return this.nameboard;
	}

	public void setNameboard(String nameboard) {
		this.nameboard = nameboard;
	}

	public String getRoutef() {
		return this.routef;
	}

	public void setRoutef(String routef) {
		this.routef = routef;
	}

	public String getRouteend() {
		return this.routeend;
	}

	public void setRouteend(String routeend) {
		this.routeend = routeend;
	}

	public String getRuntime() {
		return this.runtime;
	}

	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getGlobalprice() {
		return this.globalprice;
	}

	public void setGlobalprice(String globalprice) {
		this.globalprice = globalprice;
	}

	public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getFrequency() {
		return this.frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getPrompt() {
		return this.prompt;
	}

	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}

	public String getMold() {
		return this.mold;
	}

	public void setMold(String mold) {
		this.mold = mold;
	}


	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String[] getVotes() {
		return votes;
	}

	public void setVotes(String[] votes) {
		this.votes = votes;
	}

	public List<String> getStationList() {
		return stationList;
	}

	public void setStationList(List<String> stationList) {
		this.stationList = stationList;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	
}