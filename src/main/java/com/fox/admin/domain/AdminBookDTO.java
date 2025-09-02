package com.fox.admin.domain;

public class AdminBookDTO {
	private int ybi_idx;
	private String ybi_subject;
	private String ybi_publi;
	private String ybi_name;
	private String ybi_rental;
	private String ybi_indate;
	private String ybi_del;
	private int    rownum;
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getYbi_idx() {
		return ybi_idx;
	}
	public void setYbi_idx(int ybi_idx) {
		this.ybi_idx = ybi_idx;
	}
	public String getYbi_subject() {
		return ybi_subject;
	}
	public void setYbi_subject(String ybi_subject) {
		this.ybi_subject = ybi_subject;
	}
	public String getYbi_publi() {
		return ybi_publi;
	}
	public void setYbi_publi(String ybi_publi) {
		this.ybi_publi = ybi_publi;
	}
	public String getYbi_name() {
		return ybi_name;
	}
	public void setYbi_name(String ybi_name) {
		this.ybi_name = ybi_name;
	}
	public String getYbi_rental() {
		return ybi_rental;
	}
	public void setYbi_rental(String ybi_rental) {
		this.ybi_rental = ybi_rental;
	}
	public String getYbi_indate() {
		return ybi_indate;
	}
	public void setYbi_indate(String ybi_indate) {
		this.ybi_indate = ybi_indate;
	}
	public String getYbi_del() {
		return ybi_del;
	}
	public void setYbi_del(String ybi_del) {
		this.ybi_del = ybi_del;
	}
	
	public AdminBookDTO() {}
	
	public AdminBookDTO(int ybi_idx, String ybi_subject, String ybi_publi, String ybi_name, String ybi_rental,
			String ybi_indate, String ybi_del, int rownum) {
		this.ybi_idx = ybi_idx;
		this.ybi_subject = ybi_subject;
		this.ybi_publi = ybi_publi;
		this.ybi_name = ybi_name;
		this.ybi_rental = ybi_rental;
		this.ybi_indate = ybi_indate;
		this.ybi_del = ybi_del;
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "AdminBookDTO [ybi_idx=" + ybi_idx + ", ybi_subject=" + ybi_subject + ", ybi_publi=" + ybi_publi
				+ ", ybi_name=" + ybi_name + ", ybi_rental=" + ybi_rental + ", ybi_indate=" + ybi_indate + ", ybi_del="
				+ ybi_del + ", rownum=" + rownum + "]";
	}
	
	
	
}
