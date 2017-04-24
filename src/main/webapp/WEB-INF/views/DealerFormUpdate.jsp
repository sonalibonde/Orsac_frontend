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
						<li class="active"><a data-toggle="tab" href="#/DealerFormUpdate">Dealer
						</a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/DealerFormInsert">New Entry
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
							
								<div class="widget-box" id="maindealer">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Dealers Detail</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

												<div>&nbsp;</div>
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
											            <td><div style="width:150px;"><font>Search By Dealer Name</font></div></td>
											            <td> <input class="form-control" id="searchbydealername" ng-model="ByDealername"/>
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
												<div id="dealerDiv">
												<table class="table-bordered" border="2"
													width="100%" cellspacing="0" id="printTabledealer">
													<colgroup>
														<col width="5%">
														<col width="20%">
<%-- 														<col width="20%"> --%>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														

													</colgroup>
													<thead>
														<tr id="gridheader">
												<td ng-click="sort('rowno')"><font color="white">Sr.No.</font></td>
												<td ng-click="sort('rowno')"><font color="white">Dealer Name</font>
												<span class="glyphicon sort-icon" ng-show="sortKey=='dealername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
<!-- 															<td ng-click="sort('dealertype')"><font color="white">Dealer Type</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='dealertype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
															
															<td ng-click="sort('permanentaddress')"><font color="white">City</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='permanentaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('mobilenumber')"><font color="white">Mobile No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('alternatecontnumber')"><font color="white">Alternate No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='alternatecontnumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="dealerdetailslistnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="deal in dealerdetailslistnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
														<td><font>{{deal.rowno}}</font></td>
															<td  ><font>{{deal.dealername}}</font></td>
<!-- 															<td><font>{{deal.dealertype}}</font></td> -->
<!-- 															<td><font>{{deal.address}}{{deal.city}}{{deal.pincode}}</font></td> -->
														<td><font>{{deal.city}}</font></td>
															<td><font>{{deal.mobilenumber}}</font></td>
															<td><font>{{deal.alternatecontnumber}}</font></td>
															<td><a ng-if="deal.flag=='true'" type="submit" ng-click="showdelaerdiv1();delaereditdetails(deal);" href="">
															<i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
															</a></td>
															<td>
															<a ng-if="deal.flag=='true'" href="">
															<img ng-click="deletedealer(deal)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
															</a>
															</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData24(newPageNumber)">
													</dir-pagination-controls>
													</div>
<!-- 											</fieldset> -->
<div style="text-align: right;"><font>Total Records:{{dealerdetailslist.length}}</font></div>	
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
								
								
<div class="widget-box" id="showeditdealer"  hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title">	<font color="white"> Edit Dealer</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="editdealerform">
    <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Basic Details</font>
</legend>
    <div class="row">

    
    
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Dealer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editDealername" value="{{dealereditdata.dealername}}"  placeholder="Dealer Name" type="text" required>
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
     <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{dealereditdata.contactperson}}" id="editdealercontactperson" placeholder="Contact Person" type="text" required>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  value="{{dealereditdata.mobilenumber}}"  id="editdealermobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
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
            <input class="form-control clearable" id="editdealeraltno" value="{{dealereditdata.alternatecontnumber}}"  maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Alternate No" type="text">
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input7" class="col-md-4 control-label"><font color="black">Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
              <textarea class="form-control clearable" id="editdealerperadd"  value="" placeholder="Address" type="text" required>{{dealereditdata.address}}</textarea>
<!--              		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
</div>
        </div>
      </div>
       
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">City:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editdealerpercity" value="{{dealereditdata.city}}"  placeholder="City" type="text" required>
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">State:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editdealerperstate" value="{{dealereditdata.state}}"  placeholder="State" type="text" required>
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">Pincode:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editlocalpincode" value="{{dealereditdata.pincode}}"  placeholder="Pincode" type="text">
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" onblur="return validateForm(this);" id="editdealeremailid" value="{{dealereditdata.emailid}}" placeholder="Email Id" type="text" required>
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
          <input type="radio"  id="editdealercredit"  name="editdealermode" value="Yes" > <label for="editdealercredit">Yes</label>
  		<input type="radio" id="editdealernotcredit"  name="editdealermode" value="No" > <label for="editdealernotcredit">No</label>
         	
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" id="editdealercreditdaysdiv" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Days:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onkeyup="creditdaysValidation(this)" id="editDealercreditdays"  value="{{dealereditdata.creditdays}}" placeholder="Credit Days" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
            <div class="alert alert-warning"  id="creditdays" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
            
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="editdealercreditamtdiv" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Amount:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onkeyup="deviceValidation(this)"  id="editDealercreditamt"  value="{{dealereditdata.creditamount}}" placeholder="Credit Amount" type="text" >
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
          <input type="radio"  id="editdealerBycash"  name="paymentmode" value="By Cash" checked> <label for="editdealerBycash">By Cash</label>
  		<input type="radio" id="editdealernotBybank"  name="paymentmode" value="By Bank" > <label for="editdealernotBybank">By Bank</label>
         	
             </div>
        </div>
      </div>
      
</div>
</fieldset>
<fieldset  id="updateBankDetails"  hidden="true" style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Banking Details</font>
</legend>


<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Name:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" value="{{dealereditdata.bank_name}}"  id="editDealerbankname" placeholder="Bank Name" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Branch:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editDealerbranch"  value="{{dealereditdata.branch}}"  placeholder="Branch" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Account No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editDealeraccno"  value="{{dealereditdata.accountno}}" placeholder="Account no" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control clearable"  id="editDealeraddress" placeholder="Address" type="text" >{{dealereditdata.bankaddress}}</textarea>
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">IFSC No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="editDealerifsc"  value="{{dealereditdata.ifscno}}" placeholder="IFSC" type="text" >
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="editdealerremark"  value="{{dealereditdata.remarks}}" placeholder="Remark" type="text" >
<!-- 			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
      
          </div>
        </div>
      </div>
      
</fieldset>
<div class="row">
<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="submit"  class="action-button shadow animate green" ng-click="dealerUpdate();"><font color="black">Update</font></button>				
    	</div> 
 		<div class="col-md-4">  
        	<a  ng-click="back();"><button class="action-button shadow animate red" type="button" ><font color="black">Back</font></button></a>				
          
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


					




					</div>
				</div>
				<!-- /.widget-main -->
			</div>
			<!-- /.widget-body -->
		</div>
	
		<!-- /.widget-box -->
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	</div>
	<!-- /.col -->



</div>







