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
						<li ><a data-toggle="tab" href="#/VehicleFormUpdate"><font>Vehicle Creation</font>
						</a></li>

						<li class="active"><a data-toggle="tab" href="#/VehicleFormInsert"><font>New Entry</font></a></li>
						

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
											<font color="white">Vehicle Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>

<form class="form-horizontal" role="form" name="vehicleinsertform">
  <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Vehicle Creation</font>
</legend>

  
  
    <div class="row">
    
     <div class="col-sm-6 col-lg-6" id="maindealer">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Dealer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist  id="vehDealer1">
     		 <option   ng-if="x.loginid=='10001'" ng-repeat=" x in dealerdetailslistveh"  value="{{x.dealername}}"></option>
      	</datalist>
        <input class="form-control clearable"   list="vehDealer1"  ng-model="parentDealer"  id="vehdealerdetails1" placeholder=" Select Dealers" type="text" required>
         </div>
        </div>
      </div>
    
     <div class="col-sm-6 col-lg-6" id="dealersDetails">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Sub Dealers:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist  id="vehDealer">
     		 <option  value="{{x.dealername}}" ng-if="x.parentdealer==parentDealer  && x.loginid!=='10001'"  ng-repeat=" x in dealerdetailslistveh"></option>
      	</datalist>
        <input class="form-control clearable" ng-model="dealervehdetails1"  list="vehDealer" id="vehdealerdetails" placeholder=" Select Dealers" type="text" required>
      		 
          </div>
        </div>
      </div>
    

   
      <div class="col-sm-6 col-lg-6" id="dealercustomerdetails" >
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Customer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
              <datalist id="vehcustdealer" >
     		 <option  ng-repeat="y in customerdetailsveh"  ng-if="y.dealername==dealervehdetails1"  value="{{y.customername}}"></option>
     	 </datalist>
     		  <input class="form-control clearable"  list="vehcustdealer" id="vehcustdealerdetails" placeholder=" Select customer" type="text" required>
     		 
          </div>
        </div>
      </div>
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Fitness Validity:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="vehiinsertfitnesscomp" placeholder=" Fitness Validity" type="text" required>
          </div>
        </div>
      </div>
    
    <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Validity:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="vehiinsertinsvalcomp" placeholder=" Insurance Validity" type="text" required>
          </div>
        </div>
      </div>
    
    
<!--     <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--          <datalist id="vehiclemakenamebind"> -->
<!-- 				<option ng-repeat="x in vehcilemakenamelist" ng-if="x.assetname=='Vehicle'" value="{{x.makename}}"></option> -->
<!-- 		</datalist> -->
<!--             <input class="form-control clearable" ng-model="vehiclemakeinsert"  list="vehiclemakenamebind" id="vehiinsertmake1" placeholder="Make" type="text" required> -->
<!--      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Model Name:</font> <b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--            <datalist id="vehicleinsertmodelbind"> -->
<!-- 				<option ng-repeat="x in vehiclemodeldetails" ng-if="x.makename==vehiclemakeinsert" value="{{x.modelname}}"></option> -->
<!-- 		</datalist> -->
<!--             <input class="form-control clearable" id="vehicleinsertmodel" list="vehicleinsertmodelbind"  placeholder="Model" type="text" required> -->
<!--    <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="vehicleinsertvehno" placeholder="Vehicle No" type="text" required>
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Chasis No:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinsertchassis" placeholder="Chasis No" type="text" required>
                      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Circle</font> </label>
          <div class="col-md-8">
         <input type="text" class="form-control" placeholder="--Select Mine---"  id="vehinsertmine"  list="vehicledetaillistHistory"  />
                      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      		
    <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">District</font> </label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinsertdistrict" placeholder="District" type="text">
                      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      
        <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vehicle Type:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="vehicletypebind">
				<option ng-repeat="x in vehicletype" value="{{x.vehicletypename}}"></option>
		</datalist>
            <input class="form-control clearable" id="insertvehicletype" list="vehicletypebind"  placeholder="Vehicle Type" type="text" required>
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Tank Capacity:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinserttank" placeholder="Tank capacity" type="text">
                       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  for="background-color"  class="col-md-4 control-label"><font color="black">Body Color:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinsertbody" placeholder="Body Color"  type="text">
      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
<!--           <label for="background-color">Choose a calor for background :</label> -->
<!-- 			<input id="background-color" type="color" /> -->
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input7" class="col-md-4 control-label"><font color="black">Engine Number:</font> <b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinsertengineno" placeholder="Engine Number" type="text" required>
             <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Registration Date:</font><b style="color:Red;font-weight:normal;"></b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehinsertregdate" placeholder="Registration Date" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Registration Valid Date:</font><b style="color:Red;font-weight:normal;"></b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehinsertregvaliddate" placeholder="Registration Valid  Date" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Company Name:</font><b style="color:Red;font-weight:normal;"></b></label>
          <div class="col-md-8">
            <input class="form-control" id="vehiinsertinsurancecomp" placeholder=" Company Name" type="text" required>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Insurance Valid Date:</font><b style="color:Red;font-weight:normal;"></b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehinsertinsurancevaliddate" placeholder="Insurance Valid  Date" type="text" required>
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Purchase date:</font><b style="color:Red;font-weight:normal;"></b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="vehinsertpurchasedate" placeholder="Purchase Date" type="text" required>
          </div>
        </div>
      </div>
        <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="vehinsertremark" placeholder="Remark" type="text">
    <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
       <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Image1:</font></label>
          <div class="col-md-8">
            <img class="profile-pic" id="bannerImg"/>
			<input class="file-upload" type="file" file-model = "myFile" />
<!-- 			 <input accept="image/*" class="file-upload" name="file" ng-value="fileToUpload" value="{{fileToUpload}}" file-model="myFile" set-file-data="fileToUpload = value;" type="file" id="my_file" /> -->
<!--           <input type = "file" file-model = "myFile"/>  -->
<!--          <input type="button" ng-click = "uploadFile()" value="upload"/>  -->
          </div>
        </div>
      </div>
      
       <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Image2:</font></label>
          <div class="col-md-8">
            <img class="profile-pic2" id="bannerImg2"/>
			<input class="file-upload2" type="file" file-model = "myFile2" />
<!-- 			 <input accept="image/*" class="file-upload" name="file" ng-value="fileToUpload" value="{{fileToUpload}}" file-model="myFile" set-file-data="fileToUpload = value;" type="file" id="my_file" /> -->
<!--           <input type = "file" file-model = "myFile"/>  -->
<!--          <input type="button" ng-click = "uploadFile()" value="upload"/>  -->
          </div>
        </div>
      </div>
      
 
      
       
 </div>
 
<div class="col-sm-4 col-lg-6"> 
        <div class="form-group has-feedback ">
        <datalist id="Vehicleassigndevicedatalist">
<!-- 				<option ng-repeat="x in customerwisedevice"  ng-if="x.statusvehicle!='Assigned to Vehicle'" value="{{x.uniqueid}}"></option> -->
	<option ng-repeat="x in customerwisedeviceforVehicle"  ng-if="x.statusvehicle!='Assigned'" value="{{x.uniqueid}}"></option>
		</datalist>
          <label  class="col-md-4 control-label"><font color="black">Device IMEI Number:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="Vehicleassigndevice" list="Vehicleassigndevicedatalist"  placeholder="Device Number" type="text">
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>



<div class="row">
<div class="col-sm-6 col-lg-6 col-md-offset-4">
    <button type="submit"  class="action-button shadow animate green" ng-click="VehicleInsert()"><font color="black">Save</font></button>

<button type="reset"  class="action-button shadow animate blue"  ><font color="black">Reset</font></button>
          
          
        <a href="#/VehicleFormUpdate"><button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>
</div>
<!-- </div> -->
<!-- <div class="col-sm-6 col-lg-6 col-md-offset-4" style="text-align: right;"> -->
<!--         <div class="form-group"> -->
<!--           <a href="" id="deviceAssignvehicle" ><font color="black"><u>Device Assign To Vehicle Entry</u></font></a> -->
<!-- 	   </div> -->
<!--       </div> -->
<!--       </div> -->
<!-- </fieldset> -->
<!-- <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" id="deviceassignFieldset" hidden=true;>  -->
<!-- <legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Device Assign To Vehicle Entry</font> -->
<!-- </legend> -->
<!-- <div class="row"> -->
<!-- <div class="col-sm-4 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--          <label  class="col-md-4 control-label"><font color="black">Vehicle Number:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control clearable " id="vehicleassignvehicle"    placeholder="Vehicle Number" type="text"> -->
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="col-sm-4 col-lg-6"> -->
<!--         <div class="form-group has-feedback "> -->
<!--         <datalist id="Vehicleassigndevicedatalist"> -->
<!-- <!-- 				<option ng-repeat="x in customerwisedevice"  ng-if="x.statusvehicle!='Assigned to Vehicle'" value="{{x.uniqueid}}"></option> --> 
<!-- 	<option ng-repeat="x in customerwisedeviceforVehicle"  ng-if="x.statusvehicle!='Assigned to Vehicle'" value="{{x.uniqueid}}"></option> -->
<!-- 		</datalist> -->
<!--           <label  class="col-md-4 control-label"><font color="black">Device IMEI Number:</font></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control clearable" id="Vehicleassigndevice" list="Vehicleassigndevicedatalist"  placeholder="Device Number" type="text"> -->
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="col-sm-4 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="inputPassword" class="col-md-4 control-label"><font color="black">Assign Date:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control datepick" id="Vehicleassigndate"  placeholder="Assign Date" type="text"> -->
          
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
     
     
     
<!-- </div> -->
<!-- <!-- </fieldset> --> 
<!-- <div class="row"> -->
<!--  <div class="col-sm-6 col-lg-6 col-md-offset-4"> -->
<!--         <div class="form-group"> -->
          
         
<!--        <button type="submit"  class="action-button shadow animate green" ng-click="deviceassignVeh();"><font color="black">Assign</font></button> -->
	
	      
<!--         </div> -->
<!--       </div> -->
<!-- </div> -->
</fieldset> 
 <datalist id="vehicledetaillistHistory">
				<option  value="BALANGIR">BALANGIR</option>
				<option  value="BARGARH">BARGARH</option>
				<option  value="BARIPADA">BARIPADA</option>
				<option  value="BERHAMPUR">BERHAMPUR</option>
				<option  value="BHAWANIPATNA(KALAHANDI)">BHAWANIPATNA(KALAHANDI)</option>
				<option  value="CUTTACK">CUTTACK</option>
				<option  value="JAJPUR">JAJPUR</option>
				<option  value="JHARSUGUDA">JHARSUGUDA</option>
				<option  value="JODA">JODA</option>
				<option  value="KEONJHAR">KEONJHAR</option>
				<option  value="KOIDA">KOIDA</option>
				<option  value="KORAPUT& RAYAGADA">KORAPUT& RAYAGADA</option>
				<option  value="ROURKELA">ROURKELA</option>
				<option  value="SAMBALPUR">SAMBALPUR</option>
				<option  value="TALCHER">TALCHER</option>
			</datalist>

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
		
	
		<!-- /.widget-box -->
	
	
	
	
	
	<!-- /.col -->












