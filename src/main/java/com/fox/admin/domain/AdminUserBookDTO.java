package com.fox.admin.domain;

public class AdminUserBookDTO {
	private int yri_idx;
	private String yri_rtdate;
	private String yri_redate;
	private int ybi_idx;
	private String yu_userid;
	
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
	public int getYri_idx() {
		return yri_idx;
	}
	public void setYri_idx(int yri_idx) {
		this.yri_idx = yri_idx;
	}
	public String getYri_rtdate() {
		return yri_rtdate;
	}
	public void setYri_rtdate(String yri_rtdate) {
		this.yri_rtdate = yri_rtdate;
	}
	public String getYri_redate() {
		return yri_redate;
	}
	public void setYri_redate(String yri_redate) {
		this.yri_redate = yri_redate;
	}
	public int getYbi_idx() {
		return ybi_idx;
	}
	public void setYbi_idx(int ybi_idx) {
		this.ybi_idx = ybi_idx;
	}
	public String getYu_userid() {
		return yu_userid;
	}
	public void setYu_userid(String yu_userid) {
		this.yu_userid = yu_userid;
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
	
	public AdminUserBookDTO() {}
	
	public AdminUserBookDTO(int yri_idx, String yri_rtdate, String yri_redate, int ybi_idx, String yu_userid,
			String ybi_subject, String ybi_publi, String ybi_name, String ybi_rental, String ybi_indate, String ybi_del,
			int rownum) {
		this.yri_idx = yri_idx;
		this.yri_rtdate = yri_rtdate;
		this.yri_redate = yri_redate;
		this.ybi_idx = ybi_idx;
		this.yu_userid = yu_userid;
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
		return "AdminUserBookDTO [yri_idx=" + yri_idx + ", yri_rtdate=" + yri_rtdate + ", yri_redate=" + yri_redate
				+ ", ybi_idx=" + ybi_idx + ", yu_userid=" + yu_userid + ", ybi_subject=" + ybi_subject + ", ybi_publi="
				+ ybi_publi + ", ybi_name=" + ybi_name + ", ybi_rental=" + ybi_rental + ", ybi_indate=" + ybi_indate
				+ ", ybi_del=" + ybi_del + ", rownum=" + rownum + "]";
	}
}
