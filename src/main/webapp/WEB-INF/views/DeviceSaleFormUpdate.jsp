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
						<li class="active"><a data-toggle="tab" href="#/CompanyFormUpdate"><font>Device Sale
							</font></a></li>

						<li><a data-toggle="tab" href="#/CompanyFormInsert"><font>New Entry</font>
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
							
								<div class="widget-box" id="maincom">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Device Assigned to Dealer Details</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

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
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTable">
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
<th ng-click="sort('companyname')"><font color="#1E0833">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('companyname')"><font color="#1E0833">Company Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('shortname')"><font color="#1E0833">Short Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='shortname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('contactpersonname')"><font color="#1E0833">Contact Person</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactpersonname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('companyaddress')"><font color="#1E0833">Company Address</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('lanldlinenumber1')"><font color="#1E0833">Mobile No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber1'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('lanldlinenumber2')"><font color="#1E0833">LandLine No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber2'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															
															<th ng-click="sort('emailid')"><font color="#1E0833">Email-Id</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('registeredaddress')"><font color="#1E0833">Reg. Address</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='registeredaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('status')"><font color="#1E0833">Status</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															
															<th><font color="#1E0833">Edit</font></th>
															<th><font color="#1E0833">Delete</font></th>

														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="comp in company |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
														<td><font>{{comp.rowno}}</font></td>
															<td><font>{{comp.companyname}}</font></td>
															<td><font>{{comp.shortname}}</font></td>
															<td><font>{{comp.contactpersonname}}</font></td>
															<td ><font>{{comp.companyaddress}}</font></td>
															<td ><font>{{comp.lanldlinenumber1}}</font></td>
															<td ><font>{{comp.lanldlinenumber2}}</font></td>
															
															<td ><font>{{comp.emailid}}</font></td>
															<td ><font>{{comp.registeredaddress}}</font></td>
															<td ><font>{{comp.status}}</font></td>
															<td><a ng-if="comp.flag=='true'" type="submit" ng-click="showcomdiv1();companyData(comp);" href="">
															<i class="fa fa-pencil-square-o"></i>
															</a></td>
															<td>
															<a ng-if="comp.flag=='true'" href="">
															<img ng-click="deletecom(comp)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
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
													<div style="text-align: right;"><font>Total Records:{{company.length}}</font></div>
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
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
								
<div class="widget-box" id="showedit" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title">	<font color="white"> Edit Company</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="form2">
    <div class="row">
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Company Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="compname"  value="{{editcompanyy.companyname}}" placeholder="Company Name" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Short Name:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="shortname" value="{{editcompanyy.shortname}}" placeholder="short name" type="text" >
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="personname" value="{{editcompanyy.contactpersonname}}" placeholder="Contact Person" type="text" required>
          
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="mobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  value="{{editcompanyy.lanldlinenumber1}}" placeholder="Mobile No" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Landline No:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="landlineno" maxlength='11' onkeyup="PhoneValidation(this)" value="{{editcompanyy.lanldlinenumber2}}" placeholder="Landline No" type="text" >
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Fax No:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="faxno" value="{{editcompanyy.faxnumber}}" maxlength='10' placeholder="Fax No" type="text">
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label class="col-md-4 control-label"><font color="black">Company Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control " id="caddress" value="{{editcompanyy.companyaddress}}"  placeholder="Company Address" type="text" required>{{editcompanyy.companyaddress}}</textarea>
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
        
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Registered address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control" id="raddress" value="{{editcompanyy.registeredaddress}}" placeholder="Registered address" type="text" required>{{editcompanyy.registeredaddress}}</textarea>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="emailID" name="email" value="{{editcompanyy.emailid}}" placeholder="Email Id" type="text" required>
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
       <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">City:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcompCity"  value="{{editcompanyy.city}}" placeholder="City" type="text" >
          
          </div>
        </div>
      </div>
       <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">State:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcompstate"  value="{{editcompanyy.state}}" placeholder="State" type="text" >
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Zip:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="editcompzip"  value="{{editcompanyy.zip}}" placeholder="Zip" type="text" >
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="remark"  value="{{editcompanyy.remarks}}" placeholder="Remark" type="text" >
          
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>


<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="submit"  class="action-button shadow animate green" ng-click="companyedit();"><font color="black">Update</font></button>				
    	</div> 
 <div class="col-md-4">  
        <button   class="action-button shadow animate red" ng-click="back()" ><font color="black">Back</font></button>				
          
          </div>
        </div>
      </div>



	</div>
</form>

<!-- </fieldset> -->
	
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







