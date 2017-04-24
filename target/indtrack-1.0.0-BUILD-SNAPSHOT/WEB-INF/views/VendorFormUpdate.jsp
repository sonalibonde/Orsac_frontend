<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li class="active"><a  href="#/VendorFormUpdate"><font>Vendor</font></a></li>

						<li ng-if="loginid!=10001"><a  href="#/VendorFormInsert"><font>New Entry</font>
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
							
								<div class="widget-box" id="mainvendor">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Vendors Detail</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
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
											            <td><div style="width:150px;"><font>Search By Vendor Name</font></div></td>
											            <td><input class="form-control" id="searchbyVendorname" ng-model="ByVendorname"></td>
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]" data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTablevendor">
													<colgroup>
														<col width="5%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
<%-- 														<col width="15%"> --%>
<%-- 														<col width="15%"> --%>

													</colgroup>
													<thead>
														<tr  id="gridheader">
														
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
														<td ng-click="sort('makename')"><font color="white">Make Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='makename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('vendorfirmname')"><font color="white">Vendor Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='vendorfirmname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('contactperson')"><font color="white">Contact Person</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactperson'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td ng-click="sort('vendoraddress')"><font color="white">Address</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='vendoraddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															
															<td ng-click="sort('mobilenumber')"><font color="white">Mobile No</font>
															<span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															
															<td ng-click="sort('emailid')"><font color="white">Email ID</font>
															<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="vendordetailslistnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="vendor in vendordetailslistnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
														<td><font>{{vendor.rowno}}</font></td>
														    <td><font>{{vendor.makename}}</font></td>
															<td><font>{{vendor.vendorfirmname}}</font></td>
															<td><font>{{vendor.contactperson}}</font></td>
															<td><font>{{vendor.vendoraddress}}</font></td>
															
															<td><font>{{vendor.mobilenumber}}</font></td>
															
															<td><font>{{vendor.emailid}}</font></td>
														<td>
														<a href="" type="submit"  ng-if="vendor.flag=='true'" ng-click="showvendordiv1();vendoreditdata(vendor);">
														<i	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
														</a>
														</td>
															<td>
															<a href="" ng-click="deletevendor(vendor)"  ng-if="vendor.flag=='true'">
															<img  src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
															</a>
															</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="8"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData18(newPageNumber)" >
													</dir-pagination-controls>
										<div style="text-align: right;"><font>Total Records:{{vendordetailslist.length}}</font></div>	

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
								
								
<div class="widget-box" id="showeditvendor" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"> 
<font color="white">Edit Vendor</font>
</h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="vendorformupdate">
    <div class="row">
    
    
    <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Make Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          	 <datalist id="insertvendorassetnamebind">
				<option ng-repeat="x in  vendorassetdetails" ng-if="x.assetname!='Sim'" value="{{x.assetname}}"></option>
			</datalist>
            <input class="form-control" id="updatevendorassetname" ng-model="vendorupdate.assetname" list="insertvendorassetnamebind" placeholder="Vendor Type" type="text" required>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          	 <datalist id="insertvendormakenamebind">
				<option ng-repeat="x in  vendormakenamelist" ng-if="x.assetname==vendorupdate.assetname"  value="{{x.makename}}"></option>
			</datalist>
            <input class="form-control" id="updatevendormakename" value="{{vendorupdate.makename}}" list="insertvendormakenamebind" placeholder="Vendor Type" type="text" required>
          </div>
        </div>
      </div>
    
     <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vendor Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
      <input class="form-control" id="updatevendorname"  value="{{vendorupdate.vendorfirmname}}" placeholder="Vendor Name" type="text" required>
    
    	</div>
        </div>
      </div>
     <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     	 <input class="form-control" id="updatevendorcontactperson"  value="{{vendorupdate.contactperson}}"   placeholder="Contact Person" type="text" required>
         </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Designation:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
			<input class="form-control" id="updatevendordesignation"  value="{{vendorupdate.designation}}" placeholder="Designation" type="text" required>
        </div>
        </div>
      </div>

	 <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendormobileno" value="{{vendorupdate.mobilenumber}}" placeholder="Mobile No"  onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  maxlength='10' type="text" required>
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
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Landline No:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorlandlineno" value="{{vendorupdate.landlinenumber}}" placeholder="Landline No" maxlength='11' onkeyup="landlineValidation(this)" type="text">
           <div class="alert alert-warning"  id="idmsg1" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Email ID:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" onblur="return validateForm(this);" id="updatevendoremailid" value="{{vendorupdate.emailid}}" placeholder="Email ID" type="text" required>
		          <div class="alert alert-warning"  id="emailmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Not a valid Email Id!
		  		</div>
		
		 </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Contact No:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorserstationcontactno" onkeyup="contactnoValidation(this)" onchange="lengthValidationcontact(this);"  value="{{vendorupdate.servstationcontactno}}" placeholder="Contact No" type="text" required>
            <div class="alert alert-warning"  id="idcontact" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		<div class="alert alert-warning"  id="lengthContact" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          
          
          
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vendor Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control" id="updatevendoraddress" value="" placeholder="Vendor Address" type="text" required>{{vendorupdate.vendoraddress}}</textarea>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" hidden>
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">ServiceStation Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control" id="updatevendorserstationadd" value="" placeholder="ServiceStation Address" type="text">{{vendorupdate.servicestationaddr}}</textarea>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">City:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorcity" value="{{vendorupdate.city}}" placeholder="City" type="text">
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">State:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorstate" value="{{vendorupdate.statename}}" placeholder="State" type="text">
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Credit Days:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorcreditdays" value="{{vendorupdate.creditdays}}" placeholder="State" type="text" required>
          </div>
        </div>
      </div>
      
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Credit Date:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control datepick" id="updatevendorpaymentdate" value="{{vendorupdate.paymentdate}}" placeholder="Payment Date" type="text" required> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="updatevendorremark" value="{{vendorupdate.remarks}}" placeholder="Remark" type="text">
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4">
          <button  type="submit" class="action-button shadow animate green" ng-click="vendorUpdate();"><font color="black">Update</font></button>				
          </div>
           <div class="col-md-4">
          <a   ng-click="back();" ><button type="button" class="action-button shadow animate red"><font color="black">Back</font></button></a>
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
						

						</div>

						
											<div class="hr hr8 hr-double"></div>

																			</div> 
										</div>
										<!-- /.widget-main -->
										
										

										
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							<!-- 											end of bar				 -->


	
	
	
	
	
	
	
	
	<!-- /.col -->













