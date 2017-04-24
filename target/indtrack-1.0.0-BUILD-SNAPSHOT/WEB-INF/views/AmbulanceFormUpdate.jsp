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
						<li class="active"><a data-toggle="tab" href="#/AmbulanceFormUpdate"><font>Districtwise Vehicles
							</font></a></li>

						<li><a data-toggle="tab" href="#/AmbulanceFormInsert"><font>New Entry</font>
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
							
								<div class="widget-box" id="mainamb">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
									<div style="text-align:left;padding-top: 0px">	<h5 class="widget-title"><font color="white">Districtwise Vehicle Details</font></h5></div>
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
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
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
												
												
									<table class="table-bordered" border="2" width="100%" cellspacing="0" id="printTable">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="10%">
													</colgroup>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('ambbyno')"><font color="white">Vehicle No<font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('district')"><font color="white">District</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='shortname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('amb_location')"><font color="white">Location</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactpersonname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('vehicle_mobno')"><font color="white">Mobile No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
														<td><font color="white">Edit</font></td>

														</tr>
													</thead>

													<tbody>
														<tr dir-paginate=" amb in ambulance_detailsnew |itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
														<td><font>{{amb.rowno}}</font></td>
															<td><font>{{amb.ambbyno}}</font></td>
															<td><font>{{amb.district}}</font></td>
															<td><font>{{amb.amb_location}}</font></td>
															<td><font>{{amb.vehicle_mobno}}</font></td>
														
															<td><a type="submit"  ng-click="ambeditdetails(amb);showambdiv1();" href="">
															<i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
															</a></td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
													max-size="8"
													direction-links="true"
													boundary-links="true" 
													on-page-change="getDataAmb13(newPageNumber)" >
												</dir-pagination-controls>
												
												
													<div style="text-align: right;"><font>Total Records:{{ambulance_details.length}}</font></div>
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
								
								
<div class="widget-box" id="showamedit" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title">	<font color="white"> Edit </font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="form2">
    <div class="row">
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vehicle NO:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <datalist id="editambvehicledetails">
				<option ng-if="x.district==null" ng-repeat="x in ambvehicledetails" value="{{x.vehicleregno}}"></option>
		</datalist>
            <input list="editambvehicledetails"  value="{{ambulancedata.ambbyno}}" class="form-control clearable"  name="ambvehicleno" id="editamb_vehiclono" placeholder="Vehicle NO" type="text" required autofocus>
<!--     		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">District Name:</font></label>
          <div class="col-md-8">
            <datalist id="insertdistrictdetails">
				<option ng-repeat="x in district" value="{{x.district}}"></option>
		</datalist>
           <input  value="{{ambulancedata.district}}" list="insertdistrictdetails" class="form-control clearable" id="editambdistrict" placeholder="District Name" type="text" required>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Location:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input value="{{ambulancedata.amb_location}}" class="form-control clearable" id="editamblocation" placeholder="Location" type="text" required>
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  value="{{ambulancedata.vehicle_mobno}}" id="editamb_mobile" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
<!--         	<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
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
          <label for="input5" class="col-md-4 control-label"><font color="black">EME:</font></label>
          <div class="col-md-8">
            <input   value="{{ambulancedata.eme}}"  class="form-control clearable" id="editambEme" placeholder="EME"  type="text">

          </div>
        </div>
      </div>
      
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black"> EME Mobile No:</font></label>
          <div class="col-md-8">
            <input  value="{{ambulancedata.eme_mobileno}}" " class="form-control clearable" id="editeme_mobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text">
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
<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="submit"  class="action-button shadow animate green" ng-click="editAmbulaceDetails();"><font color="black">Update</font></button>				
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


<!-- for pdf -->

							













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







