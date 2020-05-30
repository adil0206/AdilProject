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
	private int cid;
	private int userId;
	
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Post(int pid, String pName, String pTitle, String pContent, String code, String pic, Timestamp pDate,
			int cid,int userId) {
		super();
		this.pid = pid;
		this.pName = pName;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		this.pic = pic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId=userId;
		
	}

	public Post(String pName, String pTitle, String pContent, String code, String pic, Timestamp pDate, int cid,int userId) {
		super();
		this.pName = pName;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.code = code;
		this.pic = pic;
		this.pDate = pDate;
		this.cid = cid;
		this.userId=userId;
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

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
}
