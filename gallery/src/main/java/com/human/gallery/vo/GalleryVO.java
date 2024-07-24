package com.human.gallery.vo;

import java.text.SimpleDateFormat;
import java.util.*;

public class GalleryVO {
	private int gno, pno, cnt, gupno;
	private String title, body, id, sdate, oriname, savename, dir;
	private Date wdate;
	private List list;
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getGupno() {
		return gupno;
	}
	public void setGupno(int gupno) {
		this.gupno = gupno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		sdate = form.format(wdate);
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
		setSdate();
	}
	@Override
	public String toString() {
		return "GalleryVO [gno=" + gno + ", pno=" + pno + ", cnt=" + cnt + ", gupno=" + gupno + ", title=" + title
				+ ", body=" + body + ", id=" + id + ", sdate=" + sdate + ", oriname=" + oriname + ", savename="
				+ savename + ", wdate=" + wdate + "]";
	}
}
