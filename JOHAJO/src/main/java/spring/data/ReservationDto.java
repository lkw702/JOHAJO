package spring.data;

import java.sql.Date;

public class ReservationDto {
	private int idx;
	private int rem;
	private Date resdate;
	private String store;
	private String restime;
	private String restable;
	private String f1;
	private String f2;
	private String fsingle;//단품
	private String coupone;
	private String usepoint;
	private int totalprice;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getRem() {
		return rem;
	}
	public void setRem(int rem) {
		this.rem = rem;
	}
	public Date getResdate() {
		return resdate;
	}
	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getRestime() {
		return restime;
	}
	public void setRestime(String restime) {
		this.restime = restime;
	}
	public String getRestable() {
		return restable;
	}
	public void setRestable(String restable) {
		this.restable = restable;
	}
	public String getF1() {
		return f1;
	}
	public void setF1(String f1) {
		this.f1 = f1;
	}
	public String getF2() {
		return f2;
	}
	public void setF2(String f2) {
		this.f2 = f2;
	}
	public String getFsingle() {
		return fsingle;
	}
	public void setFsingle(String fsingle) {
		this.fsingle = fsingle;
	}
	public String getCoupone() {
		return coupone;
	}
	public void setCoupone(String coupone) {
		this.coupone = coupone;
	}
	public String getUsepoint() {
		return usepoint;
	}
	public void setUsepoint(String usepoint) {
		this.usepoint = usepoint;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	
	
}
