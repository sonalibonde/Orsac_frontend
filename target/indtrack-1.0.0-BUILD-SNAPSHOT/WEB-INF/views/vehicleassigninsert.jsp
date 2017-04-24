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
						<li ><a data-toggle="tab" href="#/DeviceAssignFormUpdate"><font>Device Assign</font>
						</a></li>

						<li class="active"><a data-toggle="tab" href="#/DeviceAssignFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>

<div id="member-tab" class="tab-pane ">
							<!-- 											for bar division -->
							<div class="col-sm-12">
								<div class="widget-box" id="vehiclesinsert">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Device Assign to Vehicle Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="vehicleassigninsert1">
    <div class="row">
    
    <div class="col-sm-6 col-lg-6" id="maindealer">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Dealer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist  id="vehDealer1">
     		 <option   ng-repeat=" x in dealerdetailslistvehass" ng-if="x.loginid=='10001'"   value="{{x.dealername}}"></option>
      	</datalist>
        <input class="form-control clearable"  ng-model="parentDealer" list="vehDealer1" id="vehdealerdetails1" placeholder=" Select Dealers" type="text" required>
         </div>
        </div>
      </div>
    
     <div class="col-sm-6 col-lg-6" id="dealersassDetails" >
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Sub Dealers:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist  id="vehassDealer">
     		 <option ng-if="x.parentdealer==parentDealer  && x.loginid!=='10001'" value="{{x.dealername}}"  ng-repeat=" x in dealerdetailslistvehass"></option>
      	</datalist>
        <input class="form-control clearable" ng-model="dealervehassdetails1"   list="vehassDealer" id="vehassdealerdetails" placeholder=" Select Dealers" type="text" required>
      		 
          </div>
        </div>
      </div>
    
   
      <div class="col-sm-6 col-lg-6" id="dealerasscustomerdetails" >
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Customer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="vehcustdealer" >
     		 <option  ng-if="y.dealername==dealervehassdetails1"  ng-repeat="y in customerdetailsvehass"   value="{{y.customername}}"></option>
     	 </datalist>
     		  <input class="form-control clearable"  ng-model="customerassign"  list="vehcustdealer" id="vehasscustdealerdetails" placeholder=" Select Customer" type="text" required>
     		 
          </div>
        </div>
      </div>
     <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Assign Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehicleassigndateinsert"  placeholder="Assign Date" type="text" required>
          
          </div>
        </div>
      </div>
    <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
        <datalist id="vehicleassignvehicledatalist">
				<option   ng-repeat="x in vehicledetails"  ng-if="x.status!='Assigned' && x.customername==customerassign" value="{{x.vehicleregno}}"></option>
		</datalist>
          <label  class="col-md-4 control-label"><font color="black">Vehicle Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="vehicleassignvehicleinsert"  list="vehicleassignvehicledatalist"  placeholder="Vehicle Number" type="text" required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback ">
        <datalist id="vehicleassigndevicedatalist">
<!-- 				<option ng-repeat="x in customerwisedevice"  ng-if="x.statusvehicle!='Assigned to Vehicle'" value="{{x.uniqueid}}"></option> -->
	<option ng-repeat="x in customerwisedevice"  ng-if="x.statusvehicle!='Assigned to Vehicle'" value="{{x.uniqueid}}"></option>
		
		
		</datalist>
          <label  class="col-md-4 control-label"><font color="black">Device IMEI Number:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehicleassigndeviceinsert" list="vehicleassigndevicedatalist"  placeholder="Device Number" type="text" required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         <button id="addtolist">Add</button>
          </div>
        </div>
      </div>
     
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Remarks:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="vehicleassignremarksinsert"  placeholder="Remarks" type="text">
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">&nbsp;</div>
     <div class="col-sm-4" style="width:100%">
     <div class="widget-box" id="devicemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white"> Add Vehicle Number and Device IMEI Number</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
     <table id="myTable" class=" table-bordered" border="2"  width="100%" cellspacing="0" >
<colgroup>
	<col width="10%">
	<col width="10%">
	</colgroup>
<thead>
<tr id="gridheader">
<td><font color="white">Device Number</font></td>
<td><font color="white">Vehicle Number</font></td>

</tr>
</thead>
</table>
</div>
</div>
     </div>
     <div class="col-sm-4 col-lg-6 col-md-offset-4">&nbsp;</div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
  
          <button   class="action-button shadow animate green"  ng-click="vehicleassigninsert();"><font color="black">Save</font></button>
      
         
          <button  type="reset"  class="action-button shadow animate blue"  type="reset"><font color="black">Reset</font></button>		
         
          
        <a  href="#/DeviceAssignFormUpdate"><button type="button"  class="action-button shadow animate red"><font color="black">Back</font></button></a>				
           
        </div>
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
 </div>
  </form>

<!-- </fieldset> -->







	
						
											<div class="hr hr8 hr-double"></div>

										
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
	
	
	
	
	</div>
	<!-- /.col -->



</div>








