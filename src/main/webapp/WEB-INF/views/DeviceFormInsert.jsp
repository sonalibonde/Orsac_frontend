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
						<li ><a data-toggle="tab" href="#/DeviceFormUpdate"><font>Device Creation</font>
						</a></li>

						<li class="active"><a data-toggle="tab" href="#/DeviceFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>
			
								
<!-- 							</div> -->
							<!-- 											end of bar				 -->


<!-- 						</div> -->

<div id="member-tab" class="tab-pane ">
							<!-- 											for bar division -->
							<div class="col-sm-12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Device Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="deviceindert">
<!--  <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" >  -->
<!-- <legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Device Creation</font> -->
<!-- </legend> -->

    <div class="row">
    
    
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Select VTU Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist id="deviceinsertmakename">
				<option ng-repeat="x in devicemakenamelist" ng-if="x.assetname=='GPS Device'" value="{{x.makename}}"></option>
		</datalist>
   <input class="form-control clearable" id="deviceinsertMakeName" ng-model="devicemakeinsert" placeholder="Make Name" type="text"  list="deviceinsertmakename" required>
<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Select VTU Model Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     <datalist id="insertmodelnamebind">
			<option ng-repeat="x in devicemodeldetails" ng-if="x.makename==devicemakeinsert" value="{{x.modelname}}"></option>
		</datalist>
            <input class="form-control clearable" id="deviceinsertModelName" list="insertmodelnamebind" placeholder="Model Name" type="text" required>
             		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
     <br><br>
       <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Add Devices</font>
</legend>
        <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Device Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="deviceinsertdeviceid"   placeholder="Device Number"  type="text"   maxlength="6" required >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
           </div>
        </div>
      </div>
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Device IMEI Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="deviceinsertdeviceno"  onkeyup="deviceValidation(this)" onchange="devicenolengthValidation(this)" placeholder="Device Number" type="text" required maxlength='15'>
			<button id="addtolist">Add</button>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          <div class="alert alert-warning"  id="iddeviceno" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="devicenolengthValidation" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 15 digits!
  		</div>
          
          
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="deviceinsertRemarkd" placeholder="Remark" type="text">
    <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
    
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="input5" class="col-md-4 control-label"><font color="black">Upload Excel:</font></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="file-upload" type="file" file-model = "myFile" /> -->
<!--     			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
    
  <div class="col-sm-4 col-lg-6">&nbsp;</div>
  <div class="col-sm-4" style="width:100%">
  <div class="col-sm-12">
								<div class="widget-box" id="devicemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white"> Add Device and Device Number</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<input type="button" id="btnDelete" value="Delete Selected Rows" ng-click="removeSampleRow();"> -->
<!-- 	<input type="button" id="btnAdd" value="Add Sample Row" onclick="addSampleRow()">  -->
<table id="myDeviceTable" class=" table-bordered" border="2"  width="100%" cellspacing="0" >
	<colgroup>
	<col width="10%">
	<col width="10%">
	</colgroup>
<thead>
<tr id="gridheader">
<!-- <td><font color="white">Delete</font></td> -->
<td><font color='white'>Device IMEI Number</font></td>
<td><font color='white'>Device Id</font></td>

</tr>
</thead>
</table>
</div>
</div>
</div>
</div>
     
<!--   </fieldset> -->
 
      
      
  <div class="col-sm-6 col-lg-6 col-md-offset-4" style="text-align: right;" hidden>
       <div class="form-group">
          <a href="" id="assignsim"><font color="black"><u>Sim Assign To Device</u></font></a>
      </div>
    </div>
   <br>
   
  <center>
          
          <button  class="action-button shadow animate green"  ng-click="devieinsert();"><font color="black">Save</font></button>
   </center>
    </div>
  </fieldset>
    <br>
    <center>--------------------------------------------------------------------------------------------------------------OR----------------------------------------------------------------------------------------------</center>
  <br> 
   <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"  > 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Upload Excel</font>
</legend>    
   
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
    
   
      <div class="col-sm-6 col-lg-6" id="dealerasscustomerdetails">
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
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Upload Excel:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
<!--             <img class="profile-pic2" id="bannerImg2"/> -->
			<input class="file-upload2 form-group" type="file" file-model = "myFiledevice" />
<!-- 			 <input accept="image/*" class="file-upload" name="file" ng-value="fileToUpload" value="{{fileToUpload}}" file-model="myFile" set-file-data="fileToUpload = value;" type="file" id="my_file" /> -->
<!--           <input type = "file" file-model = "myFile"/>  -->
<!--          <input type="button" ng-click = "uploadexcel()" value="upload"/>  -->
          </div>
        </div>
      </div>
      
 
  <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <div class="col-md-8">
          <button  class="action-button shadow animate green"  ng-click="uploadexcel()" value="upload"><font color="black">Upload</font></button>
        </div>
        </div>
   </div>
   
  <br>
   <div  style="text-align:right;"><font color="red">*Note: &nbsp; Excel Format Should be: &nbsp; SR No., Deviceid, IMEINO, 
VehicleNO, Chasis No, Engine No, Sim Mobile No1, Mobile No2, Sim No </font><br><font>Excel Sheet should be in Plain text format. No formula excel will be uploaded.</font><b style="color:Red;font-weight:normal;"></div>
   
  </fieldset>
  
  
  
  <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" id="assignsimFieldset" hidden="true" > 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Sim Assignment To Device</font>
</legend>

<div class="row">
 <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Device IMEI Number</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="multipledevice">
          <option ng-repeat="x in jsonArrayDevice" value="{{x.deviceno}}"></option>
          </datalist>
    <input class="form-control clearable" list="multipledevice" id="assingdevicenumber" placeholder="Device Number" type="text">
  <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Sim Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     <datalist id="simnumberbind">
			<option ng-repeat="x in simdetails" ng-if="x.status!='Assigned'" value="{{x.simnumber}}"></option>
		</datalist>
            <input class="form-control clearable" id="assignsimnumber" list="simnumberbind" placeholder="Sim Number" type="text">
            <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
            </div>
            <button id="addsimtolist">Add</button>
        </div>
      </div>
      
        <div class="col-sm-4 col-lg-6">&nbsp;</div>
  <div class="col-sm-4" style="width:100%">
  <div class="col-sm-12">
								<div class="widget-box" id="devicemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white"> Add Device IMEI Number and Sim Number</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<input type="button" id="btnDelete" value="Delete Selected Rows" ng-click="removeSampleRow();"> -->
<!-- 	<input type="button" id="btnAdd" value="Add Sample Row" onclick="addSampleRow()">  -->
<table id="myDevicesimTable" class=" table-bordered" border="2"  width="100%" cellspacing="0" >
	<colgroup>
	<col width="10%">
	<col width="10%">
	</colgroup>
<thead>
<tr id="gridheader">
<!-- <td><font color="white">Delete</font></td> -->
<td><font color='white'>Sim Number</font></td>
<td><font color='white'>Device IMEI Number</font></td>

</tr>
</thead>
</table>
</div>
</div>
</div>
</div>
     </div>
   </div>
  <div class="row">
  <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          <button  class="action-button shadow animate green"  ng-click="multipleSimass();"><font color="black">Assign</font></button>
       					
       </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
  </div>
      
</div>
<!-- </fieldset> -->

  
  
  
  
  <div class="row">
  <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          
<!--           <button  class="action-button shadow animate green"  ng-click="devieinsert();"><font color="black">Save</font></button> -->
     
          
          <button  type="reset" class="action-button shadow animate blue"  type="reset"><font color="black">Reset</font></button>		
         
          
        <a href="#/DeviceFormUpdate"><button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>				
          
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









