package org.hyucs.domain;

import java.sql.Date;

public class UserVO {
	private String uid;
	private String upw;
	private String uname;
	private String uphonenum;
	private int upoint;
	private String sessionkey;
	private Date sessionlimit;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public Date getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(Date sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	
	public String getUphonenum() {
		return uphonenum;
	}
	public void setUphonenum(String uphonenum) {
		this.uphonenum = uphonenum;
	}
	
	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", uphonenum=" + uphonenum + ", upoint="
				+ upoint + ", sessionkey=" + sessionkey + ", sessionlimit=" + sessionlimit + "]";
	}
}
