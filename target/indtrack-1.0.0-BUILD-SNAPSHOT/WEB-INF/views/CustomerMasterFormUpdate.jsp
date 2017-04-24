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
						<li class="active"><a data-toggle="tab" href="#/CustomerMasterFormUpdate">Customer Master
							</a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/CustomerMasterFormInsert">New Entry
							</a></li>

					</ul>
				</div>
			</div>


			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 		comapnay creation											 -->

						<div id="task-tab" class="tab-pane active">

							<div class="col-sm-12">
							
								<div class="widget-box" id="maincustomer">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Customers Details</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

												<div>&nbsp;</div>
												<table class="table table-striped"
													width="100%" cellspacing="0" >
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
											            <td><input class="form-control" id="searchbyname"  ng-model="ByCustomername"/>
<!-- 											            <input class="form-control" ng-model="query[queryBy]" /> -->
											            </td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<table class="table-bordered" border="2"
													width="100%" cellspacing="0" id="printTablecust">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="10%">	
													</colgroup>
													<thead>
														<tr id="gridheader">
														<td ><font color="white">Sr. No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
												<td ng-click="sort('customername')"><font color="white">Customer Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('dealername')"><font color="white">Dealer Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='dealername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('customertype')"><font color="white">Customer Type</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customertype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('contactperson')"><font color="white">Contact Person</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactperson'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('mobilenumber')"><font color="white">Mobile No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('emailid')"><font color="white">Email Id</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
														
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="customerdetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="cust in customerdetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{cust.rowno}}</font></td>
															<td><font>{{cust.customername}}</font></td>
															<td><font>{{cust.dealername}}</font></td>
															<td><font>{{cust.customertype}}</font></td>
															<td><font>{{cust.contactperson}}</font></td>
															<td><font>{{cust.mobilenumber}}</font></td>
															<td><font>{{cust.emailid}}</font></td>
															<td><a ng-if="cust.flag=='true'" type="submit" ng-click="showcustomerdiv1();editcustdata(cust);" href="">
															<i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
															</a></td>
															<td>
															<a ng-if="cust.flag=='true'" href="">
															<img ng-click="deletecustomer(cust)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
															</a>
															</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData41(newPageNumber)">
													</dir-pagination-controls>
													<div style="text-align: right;"><font>Total Records:{{customerdetails.length}}</font></div>	
<!-- 											</fieldset> -->

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
											<!-- 													<div class="clearfix"> -->
											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i></i> -->
											<!-- 																&nbsp;Running Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,255</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Stop Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">941</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Total Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,050</h4> -->
											<!-- 														</div> -->
											<!-- 													</div> -->
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
								
<div class="widget-box" id="showeditcustomer" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title">	<font color="white"> Edit Customer</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="editcustomerform">
    <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Basic Details</font>
</legend>
    <div class="row">
    
   <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Customer Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
   
           <datalist id="editcustomertypelist">
           		<option  value="Individual"></option>
				<option value="Organization"></option>
		  	</datalist>
            <input class="form-control clearable" value="{{customerdata.customertype}}" list="editcustomertypelist" id="editcustomertype" placeholder="Customer Type" type="text" required>
<!--             <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
    </div> 
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Customer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editCustomername" value="{{customerdata.customername}}"  placeholder="Customer Name" type="text" required>
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
     <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerdata.contactperson}}" id="editcustomercontactperson" placeholder="Contact Person" type="text" required>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  value="{{customerdata.mobilenumber}}"  id="editcustomermobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          <div class="alert alert-warning"  id="idmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="length" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Alternate No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editcustomeraltno" value="{{customerdata.alternatecontnumber}}"  maxlength='10' onkeyup="alternateValidation(this)" onchange="lengthAlternateNo(this)" placeholder="Alternate  No" type="text">
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         <div class="alert alert-warning"  id="idmsg2" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		 <div class="alert alert-warning"  id="length1" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input7" class="col-md-4 control-label"><font color="black">Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
              <textarea class="form-control clearable" id="editcustomeradd"  value="" placeholder="Address" type="text" required>{{customerdata.address}}</textarea>
<!--              		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
</div>
        </div>
      </div>
       
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">City:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editcustomercity" value="{{customerdata.city}}"  placeholder="City" type="text" required>
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">Pincode:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editcustomerpincode" value="{{customerdata.pincode}}"  placeholder="Pincode" type="text">
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
           <div class="col-md-8">
            <input class="form-control clearable" onblur="return validateForm(this);" value="{{customerdata.emailid}}"   id="editcustomeremailid" placeholder="Email Id" type="text" required>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          <div class="alert alert-warning"  id="emailmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong>Not a valid Email Id!
  		</div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Is Credit:</font></label>
          <div class="col-md-8">
          <input type="radio"  id="editcustomercredit"  name="editcustomermode" value="Yes"  > <label for="editcustomercredit">Yes</label>
  		<input type="radio"  id="editcustomernotcredit"  name="editcustomermode" value="No" > <label for="editcustomernotcredit">No</label>
         	
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editcustomercreditdaysdiv" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Days:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onkeyup="creditdaysValidation(this)"  id="editCustomercreditdays"  value="{{customerdata.creditdays}}" placeholder="Credit Days" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             
              <div class="alert alert-warning"  id="creditdays" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
             
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editcustomercreditamtdiv" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Amount:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  onkeyup="deviceValidation(this)" id="editCustomercreditamt"  value="{{customerdata.creditamount}}" placeholder="Credit Amount" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
            <div class="alert alert-warning"  id="iddeviceno" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
            
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Payment Mode:</font></label>
          <div class="col-md-8">
          <input type="radio"  id="editCustomerBycash"   name="customerpaymentmode" value="By Cash"> <label for="editCustomerBycash">By Cash</label>
  		<input type="radio"   id="editCustomernotBybank"  name="customerpaymentmode" value="By Bank" > <label for="editCustomernotBybank">By Bank</label>
         	
             </div>
        </div>
      </div>
      
</div>
</fieldset>
<fieldset  id="customerupdateBankDetails"  hidden="true" style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Banking Details</font>
</legend>


<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Name:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{customerdata.bank_name}}"  id="editCustomerbankname" placeholder="Bank Name" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Branch:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editcustomerbranch"  value="{{customerdata.branch}}"  placeholder="Branch" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Account No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editCustomeraccno"  value="{{customerdata.accountno}}" placeholder="Account no" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control clearable"  id="editCustomerbankaddress" placeholder="Bank Address" type="text" >{{customerdata.bankaddress}}</textarea>
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">IFSC No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editCustomerifsc"  value="{{customerdata.ifscno}}" placeholder="IFSC" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editCustomerremark"  value="{{customerdata.remarks}}" placeholder="remark" type="text" >
<!-- 			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
      
          </div>
        </div>
      </div>
      
     
      
</fieldset>
<div class="row">
<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="reset"  class="action-button shadow animate green" ng-click="customerUpdate();"><font color="black">Update</font></button>				
    	</div> 
 		<div class="col-md-4">  
        	<a   ng-click="back();"><button class="action-button shadow animate red" type="button"><font color="black">Back</font></button>	</a>			
          
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





						<!-- 	vehicle creation	 -->


							
						
											<div class="hr hr8 hr-double"></div>

											<!-- 													<div class="clearfix"> -->
											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i></i> -->
											<!-- 																&nbsp;Running Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,255</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Stop Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">941</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Total Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,050</h4> -->
											<!-- 														</div> -->
											<!-- 													</div> -->
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>
							<!-- 											end of bar				 -->


						</div>


				<!-- /.widget-main -->
			
			<!-- /.widget-body -->
	
	
		<!-- /.widget-box -->
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	
	<!-- /.col -->











