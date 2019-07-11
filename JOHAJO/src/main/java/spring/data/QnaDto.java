package spring.data;

import java.sql.Timestamp;

public class QnaDto {
	private int idx;
	private int anw; //질문 0, 답변0
	private String selection; //질문카테고리
	private String title;
	private String contents;
	private String imagename;
	private int res_idx; //예약테이블 idx
	private int mem_f; //글쓴idx
	private Timestamp writeday;
	private int grp;
	private int stp;
	private int lv;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAnw() {
		return anw;
	}
	public void setAnw(int anw) {
		this.anw = anw;
	}
	
	public String getSelection() {
		return selection;
	}
	public void setSelection(String selection) {
		this.selection = selection;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	
	public int getRes_idx() {
		return res_idx;
	}
	public void setRes_idx(int res_idx) {
		this.res_idx = res_idx;
	}
	public int getMem_f() {
		return mem_f;
	}
	public void setMem_f(int mem_f) {
		this.mem_f = mem_f;
	}
	public Timestamp getWriteday() {
		return writeday;
	}
	public void setWriteday(Timestamp writeday) {
		this.writeday = writeday;
	}
	public int getGrp() {
		return grp;
	}
	public void setGrp(int grp) {
		this.grp = grp;
	}
	public int getStp() {
		return stp;
	}
	public void setStp(int stp) {
		this.stp = stp;
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}
	
	
	
}
