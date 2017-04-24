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
						<li ><a data-toggle="tab" href="#/SimFormUpdate"><font>Sim
								Creation </font></a></li>

						<li class="active"><a data-toggle="tab"  href="#/SimFormInsert"><font>New Entry</font></a></li>


					</ul>
				</div>
			</div>
	
<div id="member-tab" class="tab-pane ">
							<div class="col-sm-12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
										<font color="white">Sim Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
	<div>&nbsp;</div>											
<form class="form-horizontal" role="form" name="siminsertform">
<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Sim Creation</font>
</legend>

    <div class="row">
    <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Sim No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           
            <input class="form-control clearable"  onkeyup="simValidation(this)" onchange="simlengthValidation(this)"  id="insertsimno" placeholder="Sim No" type="text" required maxlength="20">
              <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         <div class="alert alert-warning"  id="idsim" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="simnolength" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 15 digits!
  		</div> 
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Network Provider</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="insertnetworkdetails">
			<option ng-repeat="x in simnetworkdetails" value="{{x.networkname}}"></option>
		</datalist>
            <input class="form-control clearable" list="insertnetworkdetails"  id="insertsimnetwork"  placeholder="Network Provider" type="text" required>
     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
        <input class="form-control clearable" id="insertsimmobileno"  onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  placeholder="Mobile No" type="text" required maxlength='10'>
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
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No. 2:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
        <input class="form-control clearable" id="insertsimmobileno2"  onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  placeholder="Mobile No" type="text" required maxlength='10'>
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
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vendor Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="simvendordetailsdata">
			<option ng-repeat="x in simvendordetails" value="{{x.vendorfirmname}}"></option>
		</datalist>
            <input class="form-control clearer" list="simvendordetailsdata" id="simvendorinsert" placeholder="Vendor Name" type="text" required>
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>

      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Receipt Date:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable datepick" id="siminsertreciptdate" placeholder="Receipt Date" type="text" >
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Date Of Active:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearer datepick" id="insertsimactivedate" placeholder="Date Of Active" type="text" required>
 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertsimRemark1" placeholder="Remark" type="text">
     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6 col-md-offset-4" style="text-align: right;">
        <div class="form-group">
           <a href="" id="simassign"><font color="Green"><u>Sim Assign To Device</u></font></a>
      </div>
    </div>
      
      
<!--        <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <div class="col-md-8"> -->
<!--           &nbsp;&nbsp; -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--        <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <div class="col-md-8"> -->
<!--           &nbsp;&nbsp; -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      </div>
       </fieldset>
       <fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" id="assignFieldset" hidden="true"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Sim Assignment to Device</font>
</legend>
<div class="row">
 <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Sim No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           
            <input class="form-control clearable"  onkeyup="simValidation(this)" onchange="simlengthValidation(this)"  id="insertAsssimno" placeholder="Sim No" type="text" maxlength="20">
              <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         <div class="alert alert-warning"  id="idsim" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="simnolength" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 15 digits!
  		</div> 
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Device Number</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist id="devicenamebind">
				<option ng-repeat="x in devicedetails" ng-if="x.statussim!='Sim Assigned'" value="{{x.uniqueid}}"></option>
		</datalist>
   <input class="form-control clearable" id="simassdevicenumber" placeholder="Device Number" type="text"  list="devicenamebind">
  <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      
      </div>
</fieldset>
      <div class="row">
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         
          <button  class="action-button shadow animate green" ng-click="Siminsert();"><font color="black">Save</font></button>
        
          
		<button  type="test" class="action-button shadow animate blue"><font color="black">Reset</font></button>		
       
        
         
        <a  href="#/SimFormUpdate"><button type="button"  class="action-button shadow animate red"><font color="black">Back</font></button></a>				
           
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
 </div>

  </form>
  
	

<!-- 											</fieldset> -->


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




	</div>
	<!-- /.col -->



</div>









