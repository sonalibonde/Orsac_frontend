package com.pakt.pojos;

import java.sql.Timestamp;

public class device_details {
//	 d.deviceid, d.makeid,d.modelid,d.vendorid, d.uniqueid, d.loginid, d.datetimestamp,
//	d.remark, d.flag,c.companyname ,a.assetname,
//  m.makename,mk.modelname,v.vendorfirmname,d.assetid,d.available
	  Long deviceid ;
	  Long makeid ;
	  Long modelid ;
	  String uniqueid;
	  Long loginid ;
	  String datetimestamp ;
	  String remark ;
	  String flag ;
	  Long companyid ;
	  Long assetid ;
	  Long available ;
	  Long vendorid;
	  String companyname;
	  String assetname;
	  String makename;
	  String modelname;
	  String vendorfirmname;
	  String statussim;
	  String statusvehicle;
	  String status;
	  String status_customer;
	  public String getPolling_status() {
		return polling_status;
	}
	public void setPolling_status(String polling_status) {
		this.polling_status = polling_status;
	}

	String polling_status;
	  
	  
	  
	  
	  public String getDevice_status() {
		return device_status;
	}
	public void setDevice_status(String device_status) {
		this.device_status = device_status;
	}

	String device_status;
	  
	  
	  
	  
	  
	public String getStatus_customer() {
		return status_customer;
	}
	public void setStatus_customer(String status_customer) {
		this.status_customer = status_customer;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatussim() {
		return statussim;
	}
	public void setStatussim(String statussim) {
		this.statussim = statussim;
	}
	public String getStatusvehicle() {
		return statusvehicle;
	}
	public void setStatusvehicle(String statusvehicle) {
		this.statusvehicle = statusvehicle;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getAssetname() {
		return assetname;
	}
	public void setAssetname(String assetname) {
		this.assetname = assetname;
	}
	public String getMakename() {
		return makename;
	}
	public void setMakename(String makename) {
		this.makename = makename;
	}
	public String getModelname() {
		return modelname;
	}
	public void setModelname(String modelname) {
		this.modelname = modelname;
	}
	public String getVendorfirmname() {
		return vendorfirmname;
	}
	public void setVendorfirmname(String vendorfirmname) {
		this.vendorfirmname = vendorfirmname;
	}
	public Long getDeviceid() {
		return deviceid;
	}
	public void setDeviceid(Long deviceid) {
		this.deviceid = deviceid;
	}
	public Long getMakeid() {
		return makeid;
	}
	public void setMakeid(Long makeid) {
		this.makeid = makeid;
	}
	public Long getModelid() {
		return modelid;
	}
	public void setModelid(Long modelid) {
		this.modelid = modelid;
	}
	public String getUniqueid() {
		return uniqueid;
	}
	public void setUniqueid(String uniqueid) {
		this.uniqueid = uniqueid;
	}
	public Long getLoginid() {
		return loginid;
	}
	public void setLoginid(Long loginid) {
		this.loginid = loginid;
	}
	public String getDatetimestamp() {
		return datetimestamp;
	}
	public void setDatetimestamp(String datetimestamp) {
		this.datetimestamp = datetimestamp;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Long getCompanyid() {
		return companyid;
	}
	public void setCompanyid(Long companyid) {
		this.companyid = companyid;
	}
	public Long getAssetid() {
		return assetid;
	}
	public void setAssetid(Long assetid) {
		this.assetid = assetid;
	}
	public Long getAvailable() {
		return available;
	}
	public void setAvailable(Long available) {
		this.available = available;
	}
	public Long getVendorid() {
		return vendorid;
	}
	public void setVendorid(Long vendorid) {
		this.vendorid = vendorid;
	}
	  
	private int rowno;


	public int getRowno() {
		return rowno;
	}
	public void setRowno(int rowno) {
		this.rowno = rowno;
	}
	
	public int getCountno() {
		return countno;
	}
	public void setCountno(int countno) {
		this.countno = countno;
	}

	private int countno;
}
