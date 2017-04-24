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

						<li><a data-toggle="tab" href="#/CustomerMasterFormInsert">New Entry
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
									<div class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64);">
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
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<table class="table table-striped table-bordered"
													width="100%" cellspacing="0" id="printTablecust">
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">

													</colgroup>
													<thead>
														<tr id="gridheader">
														<th ><font color="white">Row No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
												<th ng-click="sort('customername')"><font color="white">Customer Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('customertype')"><font color="white">Customer Type</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='customertype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('contactperson')"><font color="white">Contact Person</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactperson'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('mobilenumber')"><font color="white">Mobile No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															
															<th ng-click="sort('emailid')"><font color="white">Email Id</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('remarks')"><font color="white">Remark</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
														
															<th><font color="white">Edit</font></th>
															<th><font color="white">Delete</font></th>

														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="cust in customerdetails |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
															<td><font>{{cust.rowno}}</font></td>
															<td ng-if="cust.flag=='true'"><font>{{cust.customername}}</font></td>
															<td ng-if="cust.flag=='true'"><font>{{cust.customertype}}</font></td>
															<td ng-if="cust.flag=='true'"><font>{{cust.contactperson}}</font></td>
														
															<td ng-if="cust.flag=='true'"><font>{{cust.mobilenumber}}</font></td>
															<td ng-if="cust.flag=='true'"><font>{{cust.emailid}}</font></td>
															<td ng-if="cust.flag=='true'"><font>{{cust.remarks}}</font></td>
															<td><a ng-if="cust.flag=='true'" type="submit" ng-click="showcustomerdiv1();editcustdata(cust);" href="">
															<i class="fa fa-pencil-square-o"></i>
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
														boundary-links="true" >
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
<div class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64) ; ">
<h5 class="widget-title">	<font color="white"> Edit Customer</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="editcustomer">
    <div class="row">
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Customer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomername"  value="{{customerdata.customername}}"  placeholder="Customer Name" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Customer Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomertype" value="{{customerdata.customertype}}"placeholder="Customer Type" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
    
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomermobile" value="{{customerdata.mobilenumber}}" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  value="{{editcompanyy.lanldlinenumber1}}" placeholder="Mobile No" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Alternate No:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomeraltno" maxlength='11'  value="{{customerdata.alternatecontnumber}}" onkeyup="PhoneValidation(this)"  placeholder="Alternate No" type="text" >
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label class="col-md-4 control-label"><font color="black">Local Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control " id="editcustomerlocaladd"  placeholder="Local Address" type="text" >{{customerdata.localaddress}}</textarea>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Permanent Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control" id="editcustomerPadd"  placeholder="Permanent address" type="text" required> {{customerdata.permanentaddress}}</textarea>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Local City</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcutomerLcity" value="{{customerdata.localcity}}" placeholder="Email Id" type="text" >
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Permanent City</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomerPcity" value="{{customerdata.permanentcity}}" placeholder="Permanent City" type="text" required>
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Local Pincode</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomerLpincode"  value="{{customerdata.localpincode}}" placeholder="Local Pincode" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Permanent Pincode</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomerPpincode"  value="{{customerdata.permcitypincode}}" placeholder="Permanent Pincode" type="text" required>
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcustomerremark"  value="{{customerdata.remarks}}" placeholder="remark" type="text" >
          
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
<!--       <div class="col-sm-4 col-lg-6"> -->
<!--         <div class="form-group"> -->
          
<!--           <div class="col-md-8"> -->
<!--           <button  type="submit" class="btn btn-primary" ng-click="companyedit();"><font color="black">Update</font></button> -->
<!--            <button type="submit" class="btn btn-primary"ng-click="back()" ><font color="black">Back</font></button> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->


<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="submit"  class="action-button shadow animate green" ng-click="customerUpdate();"><font color="black">Update</font></button>				
    	</div> 
 <div class="col-md-4">  
        <button type="reset"    class="action-button shadow animate red" ng-click="back()" ><font color="black">Back</font></button>				
          
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











