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
						<li class="active"><a data-toggle="tab" href="#/ApprovalForm"><font>Vehicle Approval </font></a></li>

<!-- 						<li><a data-toggle="tab" href="#/CompanyFormInsert"><font>New Entry</font> -->
<!-- 							</a></li> -->

					</ul>
				</div>
			</div>

	<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 		comapnay creation											 -->

						<div id="task-tab" class="tab-pane active">

							<div class="col-sm-12">
							
								<div class="widget-box" id="maincom">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
									<div style="text-align:left;padding-top: 0px">	<h5 class="widget-title"><font color="white">Approval Details</font></h5></div>
											<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

												<div>&nbsp;</div>
												<table>
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" id="apprsearch" ng-model="apprsearch" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														</select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<div>&nbsp;</div>
												
									<div id="uprintlTable">			
									<table class="table-bordered" border="2" width="100%" cellspacing="0" id="printTable">
<%-- 													<colgroup> --%>
<%-- 														<col width="5%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="12%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="12%"> --%>
<%-- 														<col width="20%"> --%>
<%-- <%-- 														<col width="20%"> --%> 
<%-- <%-- 														<col width="10%"> --%> 
<%-- <%-- 														<col width="10%"> --%> 
<%-- 													</colgroup> --%>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('companyname')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('companyname')"><font color="white">Company Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('shortname')"><font color="white">Dealer Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='shortname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
<!-- 															<td ng-click="sort('contactpersonname')"><font color="white">SubDealer Name</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='contactpersonname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
															<td ng-click="sort('companyaddress')"><font color="white">Customer Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('emailid')"><font color="white">Vehicleno</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('registeredaddress')"><font color="white">Reg.Date</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='registeredaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('status')"><font color="white">Polling Time</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('lanldlinenumber1')"><font color="white">Status</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber1'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('lanldlinenumber1')"><font color="white">Unauthorize</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber1'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															
															
<!-- 															<td><font color="white">Edit</font></td> -->
<!-- 															<th><font color="white">Delete</font></th> -->

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="companynew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="comp in companynew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
														<td><font>{{comp.rowno}}</font></td>
															<td><font>{{comp.companyname}}</font></td>
															<td><font>{{comp.dealername}}</font></td>
<!-- 															<td><font>{{comp.subdealername}}</font></td> -->
															<td ><font>{{comp.customername}}</font></td>
															<td ><font>{{comp.vehicleno}}</font></td>
															<td ><font>{{comp.rdate}}</font></td>
															<td ><font>{{comp.pollingtime}}</font></td>
															<td ><font><button ng-if='comp.status=="Approved"' style="background-color: green;color: white; width:90px">{{comp.status}}</button></font>
															<font><button ng-if='comp.status=="Pending"' ng-click="getdet(comp);" data-toggle="modal" data-target="#myModal" style="background-color: #e07b53;color: white; width:90px">{{comp.status}}</button></font></td>
															<td ><font><button ng-if='comp.status=="Approved"' ng-click="disapprove(comp);" style="background-color: red;color: white; width:90px">Unauthorize</button></font></td>
<!-- 															<input type="button" value="Print" ng-click="print_this();"/> -->
<!-- 															<td ><font>{{comp.emailid}}</font></td> -->
<!-- 															<td ><font>{{comp.registeredaddress}}</font></td> -->
<!-- 														<td ><font>{{comp.status}}</font></td> -->
<!-- 															<td><a ng-if="comp.flag=='true'" type="submit" ng-click="showcomdiv1();companyData(comp);" href=""> -->
<!-- 															<i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i> -->
<!-- 															</a></td> -->
<!-- 															<td> -->
<!-- 															<a ng-if="comp.flag=='true'" href=""> -->
<%-- 															<img ng-click="deletecom(comp)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"> --%>
<!-- 															</a> -->
<!-- 															</td> -->
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
													max-size="8"
													direction-links="true"
													boundary-links="true" 
													on-page-change="getData13(newPageNumber)" >
												</dir-pagination-controls>
												</div>
												
													<div style="text-align: right;"><font>Total Records:{{company.length}}</font></div>
<!-- 											</fieldset> -->
<div id="editor"></div>
											<div class="hr hr8 hr-double"></div>
		<div style="text-align:center;">	
		<a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
										
									
		<a  ng-click="expor1();"  title="Export To PDF"   id="exportpdf"  download><img  src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a>
										
										
										<a href="" title="Export To Excel" id="exportexcel"  ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a>
<!-- 									 <button  id="" ng-click="demoFromHTML();">PDF</button> -->
										</div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
								
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">	
    
      <!-- Modal content-->
      <div class="modal-content" style="width:500px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Vehicle Authorization</h4>
        </div>
       
        
        <div class="modal-body"  style="color:black;padding-top:-4px;">
      <div class="">
		<div class="">	
  
	
	<div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	  Receipt No: {{receiptno}}</div>
	  
	  <div  class="col-sm-6"> Approve Date : {{ndate}}</div></div></div>
      
      
      <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	  Company :{{companyname}}</div>
	  
	  <div  class="col-sm-6">Vehicle NO. :{{vehicleno}}</div></div></div>
      
      
        
      <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	 Customer :{{customername}}</div>
	  
	  <div  class="col-sm-6">Dealer :{{dealername}}</div></div></div>
     
      <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	  Chasis No :{{chasisno}}</div>
	  
	  <div  class="col-sm-6">IMEI No :{{imeino}}</div></div></div>
   
   
    
      <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	  Sim No :{{simno}}</div>
	  
	  <div  class="col-sm-6">Device ID :{{deviceid}}</div></div></div>
	  
	   <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"style="height:100px"> 
	  Image1 :<img src="{{urlimage1}}"/></div>
	  
	  <div  class="col-sm-6"style="height:100px">Image2 :<img src="{{urlimage2}}"/></div></div></div>
	
       <div class="col-sm-12">
     <div class="row">
	  <div  class="col-sm-6"> 
	  Engine No :{{engineno}}</div>
	  
	  <div  class="col-sm-6"></div></div></div>
 
  </div>
  </div>
         
        </div>
        <div class="modal-footer">
         <button type="button" style="background-color: green;color: white; width:90px";class="btn btn-default" data-dismiss="modal"ng-click="approve();">Approve</button>
          <button type="button" style="background-color: red;color: white; width:90px";class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
 
  </div>    
    </div>
  </div>	
	
	
	
	</div>
	<!-- /.col -->



</div>


<style>
.modal-body {
    padding: 0 4px;	
}

modal-footer {
    padding: 15px;
    text-align: center;
    border-top: 1px solid #e5e5e5;
}
.btn {			
    display: inline-block;
    padding: 2px 8px !important;}
    
	</style>




