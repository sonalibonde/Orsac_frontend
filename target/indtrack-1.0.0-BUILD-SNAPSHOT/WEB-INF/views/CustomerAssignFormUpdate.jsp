<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li class="active" ng-if="loginid!=10001"><a data-toggle="tab" href="#/CustomerAssignFormUpdate">Device Sale
						</a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/CustomerAssignFormInsert">New Entry</a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->
	<div id="task-tab" class="tab-pane active">
		<div class="col-sm-12">
								<div class="widget-box" id="maincustomerassign">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="black">Device Sale Details</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
								<table class="table table-striped"
													width="100%" cellspacing="0">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
														
													</colgroup>
													<tr>
											            <td><div style="width:158px;"><font>Search By Customer Name</font></div></td>
											            <td><input class="form-control" id="searchbycustomername" ng-model="searchByCustomername" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1=pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
											<table class="table-bordered" border="2"
													width="100%" cellspacing="0"  id="printTablecustomer">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="15%">
														<col width="10%">
														<col width="15%">
														<col width="12%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="2%">
														<col width="2%">
													</colgroup>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font><span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
															<td ng-click="sort('customername')"><font color="white">Customer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('dealername')"><font color="white">Dealer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='solddealer'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('no_devices')"><font color="white">No Of Devices</font><span class="glyphicon sort-icon" ng-show="sortKey=='no_devices'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('payedby')"><font color="white">Paid By</font><span class="glyphicon sort-icon" ng-show="sortKey=='payedby'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('paymentmode')"><font color="white">Payment Mode</font><span class="glyphicon sort-icon" ng-show="sortKey=='paymentmode'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('order_placedby')"><font color="white">Order By</font><span class="glyphicon sort-icon" ng-show="sortKey=='order_placedby'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('dispatchphoneby')"><font color="white">Dispatched By</font><span class="glyphicon sort-icon" ng-show="sortKey=='dispatchphoneby'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="customerassigndetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="customerassign in customerassigndetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{customerassign.rowno}}</font></td>
															<td><font>{{customerassign.customername}}</font></td>
															<td><font>{{customerassign.dealername}}</font></td>
															<td><font>{{customerassign.no_devices}}</font></td>
															<td><font>{{customerassign.payedby}}</font></td>
															<td><font>{{customerassign.paymentmode}}</font></td>
															<td><font>{{customerassign.order_placedby}}</font></td>
															<td><font>{{customerassign.dispatchby}}</font></td>
															
															<td><a ng-if="customerassign.flag=='true'" type="submit" 
																ng-click="showcustomerassigndiv1();editcustomerassigndata(customerassign);" href=""><i
																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td>
															<td>
															<a  ng-if="customerassign.flag=='true'" href=""><img ng-click="deletecustomerassign(customerassign)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
															</a>
															</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData38(newPageNumber)" >
												</dir-pagination-controls>
											<div style="text-align: right;"><font>Total Records:{{customerassigndetails.length}}</font></div>	
											<div class="hr hr8 hr-double"></div>
											
											
<div style="text-align:center;">	
		<a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
		<a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a>
										
										
										<a href="" title="Export To Excel" id="exportexcel" ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a>
										</div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
<div class="widget-box" id="showeditcustomerassign" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"> <font color="white">Edit Device Sale</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
	<div>&nbsp;</div>

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="editcustomerassign">
    
    <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Basic Details</font>
</legend>
    <div class="row">
    
     <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">Customer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="insertcustomername">
				<option ng-repeat="x in customerasscustomerdetailslist " value="{{x.customername}}"></option>
		</datalist>
            <input class="form-control clearable"  id="editcustomerassname"  value="{{customerassdata.customername}}" list="insertcustomername"  placeholder="customer Name" type="text" required readonly>
          </div>
        </div>
      </div>
      
      
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="customerasseditmakename">
				<option ng-repeat="x in customermakenamelist" ng-if="x.assetname=='GPS Device'" value="{{x.makename}}"></option>
		</datalist>
         <input class="form-control clearable" list="customerasseditmakename"  value="{{customerassdata.makename}}"  id="editcustomerassmakenameo"   placeholder="Make Name" type="text" required readonly>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">Model Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="editcustomerassmodelnamebind">
			<option ng-repeat="x in customermodeldetails" ng-if="x.makename==customerAssignmakeedit" value="{{x.modelname}}"></option>
		</datalist>
         <input class="form-control clearable" list="editcustomerassmodelnamebind" value="{{customerassdata.modelname}}" id="editcustomerassmodelname"   placeholder="Model Name" type="text" required readonly> 
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
       
     <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">PO Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <input class="form-control datepick"  id="editcustomersalepodate" value="{{customerassdata.purchaseorder_date}}"   list="insertcustomername"  placeholder="PO Date" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">PO Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <input class="form-control clearable" value="{{customerassdata.purchaseorder_number}}"  list="insertcustomerdeviceno" id="editcustomersaleponumber"  placeholder="PO Number" type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Order Placed  By:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
   	<input type="radio"  id="editcustomerassemail"   name="editorder" value="Email">  <label for="editcustomerassemail">Email</label>
  			<input type="radio" id="editcustomerassphone"  name="editorder" value="Phone" >  <label for="editcustomerassphone">Phone</label>
         	<input type="radio"  id="editcustomerassverbal" name="editorder" value="Verbal" >  <label for="editcustomerassverbal">Verbal</label>
         	
<!--          <input class="form-control"   id="insertcustomerpaymentmode"  placeholder="Order Placed By" type="text"   required> -->
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editemail" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.emailidby}}"  id="editcustomeremailid"  placeholder="Email Id" type="text"   required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editphone" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Phone No.:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.phonenoby}}"  id="editcustomersalephone"  placeholder="Phone No." type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editverbal" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Name Of Person.:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.nameby}}"   id="editcustomersaleperson"  placeholder="Name Of Person." type="text"   required>
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Reference Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           	<input class="form-control clearable" value="{{customerassdata.invoice_number}}"  id="editcustomersaleinvoiceno"  placeholder="Invoice Number" type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Reference Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           	<input class="form-control datepick" value="{{customerassdata.invoice_date}}"   id="editcustomersaleinvoicedate"  placeholder="Invoice Date" type="text"   required>
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
     

      
    </div>
    </fieldset>
    <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Payment Details</font>
</legend>
<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Payment Mode:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         	<input type="radio"  id="editcustomerasscheque" name="editpayment" value="Cheque"> <label for="editcustomerasscheque"> Cheque</label>
  			<input type="radio" id="editcustomerasscash"  name="editpayment" value="Cash"> <label for="editcustomerasscash"> Cash</label>
         	<input type="radio"  id="editcustomerassneft" name="editpayment" value="By Bank" > <label for="editcustomerassneft">By Bank</label>
<!--          	<input type="radio"  id="editcustomerasscredit" name="editpayment" value="Credit"> <label for="editcustomerasscredit">Credit</label> -->
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editchequ" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Cheque No.:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable" value="{{customerassdata.chequeno}}"  id="editcustomersalechqno"  placeholder="Cheque No" type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editchqdate" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Cheque Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control datepick"  value="{{customerassdata.chequedate}}"  id="editdalersalechqdate"  placeholder="Cheque Date" type="text"   required>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editcreditam" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Amount:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          	<input class="form-control clearable"   value="{{customerassdata.creditamount}}" id="editcustomersalecreditamount"  placeholder="Credit Amount" type="text"   required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editcreditdays" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Days:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable" value="{{customerassdata.creditdays}}"  id="editdalersaledays"  placeholder="Credit Days" type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Paid By:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.payedby}}"  id="editdalersalepayed"  placeholder="Payed By" type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editcustBankname" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Name:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerassdata.bank_name}}" id="editcustomersalebankname" placeholder="Bank Name" type="text"  >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
<div class="col-sm-6 col-lg-6" id="editcustbranch" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Branch:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerassdata.branch}}"  id="editcustomersalebranch" placeholder="Branch" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editcustaccount" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Account No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerassdata.account_no}}" id="editcustsaleaccno"  onkeypress="return isNumberKey(event)" placeholder="Account no" type="text"  >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editcustbankadd" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Address:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  value="{{customerassdata.bank_address}}" id="editustomersalebankadd" placeholder="Bank Address" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editcustifscno" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">IFSC No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerassdata.ifscno}}"  id="editcustomersaleifscno" placeholder="IFSC" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Dispatch By:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
    <input type="radio" id="editcustomerasscourier"  name="editdisptach" value="Courier" > <label for="editcustomerasscourier"> Courier</label>
    <input type="radio"  id="editcustomerassself" name="editdispatch" value="Self" >  <label for="editcustomerassself">Self</label>
<!--            	<input class="form-control"   id="insertcustomerpaymentmode"  placeholder="Dispatch By" type="text"   required> -->
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editdisPers" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Person Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
        
           	<input class="form-control clearable"   value="{{customerassdata.dispatchnameby}}"  id="ieditcustomerassdispatchname"  placeholder="Dispatch Person " type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editdisphon" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Phone No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.dispatchphoneby}}"  id="editcustomerdispatchphone"  placeholder="Phone No " type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6"  id="editdiscourComp" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Courier Company:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable" value="{{customerassdata.dispatchcourier}}"   id="editcustomerasscouriercom"  placeholder="Courier Company " type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editdispacno" hidden>
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Packet No.:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable" value="{{customerassdata.dispatchpaketno}}"    id="editcustomerasspacketno"  placeholder="Packet No " type="text"   required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
</fieldset>
    <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Device Details</font>
</legend>
 <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">No. Of Devices:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <input class="form-control clearable"  id="editcustomerassnoofdevices"   value="{{customerassdata.no_devices}}"  list="insertcustomername"  placeholder="No. Of Devices" type="text" required readonly>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6" id="editcustomerTaxdiv" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Tax:</font></label>
          <div class="col-md-8">
          	<input class="form-control clearable"  value="{{customerassdata.tax}}"   id="editcustomersaletax"  placeholder="Tax" type="text">
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" hidden="true">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Service Tax:</font></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable" value="{{customerassdata.servicetax}}"    id="editcustomersaleservicetax"  placeholder="Service Tax" type="text" >
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Final Total:</font></label>
          <div class="col-md-8">
         
           	<input class="form-control clearable"  value="{{customerassdata.finaltotal}}"   id="editcustomersalefinaltotal"  placeholder="Final Total" type="text">
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>
      
       <div class="col-sm-4 col-lg-7" id="devicescustomer" >
<!--         <div class="form-group"> -->
<!--           <div class="col-md-8"> -->
         	<table class="table table-hover table-bordered" width="100%" cellspacing="0">
        <caption id="gridheader" style="text-align:center"><font color="white">Sold Devices</font></caption>
		         	<thead><tr >
		         		<td>
		         		<font clolor="white">Search:</font>
		         		<input  ng-model="query[queryBy]" /></td></tr>
		         	</thead>
				    <tr   dir-paginate="x in customerassdata.imeino|orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesno" style="float: left;">
			       			<td>
			       				<input type="checkbox" id="{{x}}" /><label for="{{x}}" >&nbsp{{x}}</label>
			       			</td>
			       	</tr>
			</table>
				 <dir-pagination-controls
					max-size="200"
					direction-links="true"
					boundary-links="true" >
				</dir-pagination-controls>
          <span class="form-control-feedback"></span>
<!--           </div> -->
<!--         </div> -->
      </div>
</fieldset>
<div class="row">
 <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          <div class="col-md-4">
    <button  class="action-button shadow animate green" ng-click="CustomerassignUpdate();"><font color="black">Update</font></button>
   </div>
     <div class="col-md-4 ">
   <a ng-click="back();"><button class="action-button shadow animate red" type="button"><font color="black">Back</font></button></a>		
          </div>
        
        </div>
      </div>
</div>
  </form>

	
	</div>
	</div>
</div>

</div>
								
								
								
								
								
							</div>
							<!-- 											end of bar				 -->


						</div>


				




					</div>
				</div>
				<!-- /.widget-main -->
			</div>
			<!-- /.widget-body -->
		</div>
	
		<!-- /.widget-box -->
	
	
	
	
	</div>
	<!-- /.col -->













