package com.pakt.pojos;

import java.util.List;

public class devicesalecustomer {
	String transid; 
	String customerid; 
	String no_devices; 
	String purchaseorder_number; 
	String purchaseorder_date; 
    String invoice_number; 
    String invoice_date; 
    String total; 
    String tax; 
    String octroi; 
    String vatt; 
    String servicetax; 
    String paymentmode; 
    String chequeno; 
    String chequedate; 
    String creditdays; 
    String creditamount; 
    String payedby; 
    String order_placedby; 
    String emailidby; 
    String phonenoby; 
    String nameby; 
    String dispatchnameby; 
    String dispatchphoneby; 
    String dispatchcourier;
    String dispatchpaketno; 
    String datetimestamp; 
    String loginid; 
    String flag; 
    String customername;
    String finaltotal;
    String dispatchby;
    private int rowno;
    List<String> imeino;
    String solddealer;
    
    
    
    
    
   	public String getSolddealer() {
		return solddealer;
	}
	public void setSolddealer(String solddealer) {
		this.solddealer = solddealer;
	}
	public List<String> getImeino() {
   		return imeino;
   	}
   	public void setImeino(List<String> imeino) {
   		this.imeino = imeino;
   	}
    
    
	public String getFinaltotal() {
		return finaltotal;
	}
	public void setFinaltotal(String finaltotal) {
		this.finaltotal = finaltotal;
	}
	public String getDispatchby() {
		return dispatchby;
	}
	public void setDispatchby(String dispatchby) {
		this.dispatchby = dispatchby;
	}
	public int getRowno() {
		return rowno;
	}
	public void setRowno(int rowno) {
		this.rowno = rowno;
	}
	public String getTransid() {
		return transid;
	}
	public void setTransid(String transid) {
		this.transid = transid;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}
	public String getNo_devices() {
		return no_devices;
	}
	public void setNo_devices(String no_devices) {
		this.no_devices = no_devices;
	}
	public String getPurchaseorder_number() {
		return purchaseorder_number;
	}
	public void setPurchaseorder_number(String purchaseorder_number) {
		this.purchaseorder_number = purchaseorder_number;
	}
	public String getPurchaseorder_date() {
		return purchaseorder_date;
	}
	public void setPurchaseorder_date(String purchaseorder_date) {
		this.purchaseorder_date = purchaseorder_date;
	}
	public String getInvoice_number() {
		return invoice_number;
	}
	public void setInvoice_number(String invoice_number) {
		this.invoice_number = invoice_number;
	}
	public String getInvoice_date() {
		return invoice_date;
	}
	public void setInvoice_date(String invoice_date) {
		this.invoice_date = invoice_date;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getOctroi() {
		return octroi;
	}
	public void setOctroi(String octroi) {
		this.octroi = octroi;
	}
	public String getVatt() {
		return vatt;
	}
	public void setVatt(String vatt) {
		this.vatt = vatt;
	}
	public String getServicetax() {
		return servicetax;
	}
	public void setServicetax(String servicetax) {
		this.servicetax = servicetax;
	}
	public String getPaymentmode() {
		return paymentmode;
	}
	public void setPaymentmode(String paymentmode) {
		this.paymentmode = paymentmode;
	}
	public String getChequeno() {
		return chequeno;
	}
	public void setChequeno(String chequeno) {
		this.chequeno = chequeno;
	}
	public String getChequedate() {
		return chequedate;
	}
	public void setChequedate(String chequedate) {
		this.chequedate = chequedate;
	}
	public String getCreditdays() {
		return creditdays;
	}
	public void setCreditdays(String creditdays) {
		this.creditdays = creditdays;
	}
	public String getCreditamount() {
		return creditamount;
	}
	public void setCreditamount(String creditamount) {
		this.creditamount = creditamount;
	}
	public String getPayedby() {
		return payedby;
	}
	public void setPayedby(String payedby) {
		this.payedby = payedby;
	}
	public String getOrder_placedby() {
		return order_placedby;
	}
	public void setOrder_placedby(String order_placedby) {
		this.order_placedby = order_placedby;
	}
	public String getEmailidby() {
		return emailidby;
	}
	public void setEmailidby(String emailidby) {
		this.emailidby = emailidby;
	}
	public String getPhonenoby() {
		return phonenoby;
	}
	public void setPhonenoby(String phonenoby) {
		this.phonenoby = phonenoby;
	}
	public String getNameby() {
		return nameby;
	}
	public void setNameby(String nameby) {
		this.nameby = nameby;
	}
	public String getDispatchnameby() {
		return dispatchnameby;
	}
	public void setDispatchnameby(String dispatchnameby) {
		this.dispatchnameby = dispatchnameby;
	}
	public String getDispatchphoneby() {
		return dispatchphoneby;
	}
	public void setDispatchphoneby(String dispatchphoneby) {
		this.dispatchphoneby = dispatchphoneby;
	}
	public String getDispatchcourier() {
		return dispatchcourier;
	}
	public void setDispatchcourier(String dispatchcourier) {
		this.dispatchcourier = dispatchcourier;
	}
	public String getDispatchpaketno() {
		return dispatchpaketno;
	}
	public void setDispatchpaketno(String dispatchpaketno) {
		this.dispatchpaketno = dispatchpaketno;
	}
	public String getDatetimestamp() {
		return datetimestamp;
	}
	public void setDatetimestamp(String datetimestamp) {
		this.datetimestamp = datetimestamp;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
    
    
    
}
