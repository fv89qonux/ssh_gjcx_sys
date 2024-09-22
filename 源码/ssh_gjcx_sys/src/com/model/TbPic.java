package com.model;

/**
 * TbPic generated by MyEclipse Persistence Tools
 */

public class TbPic implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String content;
	private String pic;
	private String intime;
	private String memo;

	// Constructors

	/** default constructor */
	public TbPic() {
	}

	/** minimal constructor */
	public TbPic(String name) {
		this.name = name;
	}

	/** full constructor */
	public TbPic(String name, String content, String pic, String intime,
			String memo) {
		this.name = name;
		this.content = content;
		this.pic = pic;
		this.intime = intime;
		this.memo = memo;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getIntime() {
		return this.intime;
	}

	public void setIntime(String intime) {
		this.intime = intime;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}