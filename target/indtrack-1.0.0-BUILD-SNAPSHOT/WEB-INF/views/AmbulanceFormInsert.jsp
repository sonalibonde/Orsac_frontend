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
					
						<li ><a data-toggle="tab" href="#/AmbulanceFormUpdate"><font>Districtwise Vehicles</font></a></li>

						<li class="active"><a data-toggle="tab" href="#/AmbulanceFormInsert"><font>New Entry</font>
							</a></li>

					</ul>
				</div>
			</div>







						<!-- 	vehicle creation	 -->


						<div id="member-tab" class="tab-pane ">
							<!-- 											for bar division -->
							<div class="col-sm-12">
								<div class="widget-box">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<font color="white">Ambulance Assign Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
										

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="form1">
    <div class="row">
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vehicle NO:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <datalist id="insertambvehicledetails">
				<option ng-if="x.district==null" ng-repeat="x in ambvehicledetails" value="{{x.vehicleregno}}"></option>
		</datalist>
            <input list="insertambvehicledetails" class="form-control clearable"  name="ambvehicleno" id="amb_vehiclono" placeholder="Vehicle NO" type="text" required autofocus>
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
           <input  list="insertdistrictdetails" class="form-control clearable" id="ambdistrict" placeholder="District Name" type="text" required>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Location:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="amblocation" placeholder="Location" type="text" required>
     	 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="amb_mobile" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
        	<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
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
            <input class="form-control clearable" id="ambEme" placeholder="EME"  type="text">
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>

          </div>
        </div>
      </div>
      
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black"> EME Mobile No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="eme_mobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text">
        	<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
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
   
    
 <div class="row">
<div class="col-sm-6 col-lg-6 col-md-offset-4">
 <button type="submit"  class="action-button shadow animate green" ng-click="insertAmbulaceDetails();"><font color="black">Save</font></button>				
  <button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
 <a href="#/AmbulanceFormUpdate">
 <button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>
</div>
  </div>   
      
      
      

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
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	</div>
	<!-- /.col -->



</div>







