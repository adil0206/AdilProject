package com.adiTech.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private String pName;
	private String pTitle;
	private String pContent;
	private String code;
	private String pic;
	private Timestamp pDate;
	private String cid;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int pid, String pName, String pTitle, String pContent, String code, String pic, Timestamp pDate,
			String cid) {
		super();
		this.pid = pid;
		this.pName = pName;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		this.pic = pic;
		this.pDate = pDate;
		this.cid = cid;
	}

	public Post(String pName, String pTitle, String pContent, String code, String pic, Timestamp pDate, String cid) {
		super();
		this.pName = pName;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		this.pic = pic;
		this.pDate = pDate;
		this.cid = cid;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	
}
