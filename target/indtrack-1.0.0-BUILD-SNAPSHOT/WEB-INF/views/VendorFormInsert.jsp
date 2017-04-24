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
						<li ><a href="#/VendorFormUpdate"><font>Vendor</font>
						</a></li>

						<li class="active"><a  href="#/VendorFormInsert"><font>New Entry</font></a></li>
						

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
											<font color="white">Vendor Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="vendorforminsert">
    <div class="row">
    
    <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Make Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          	 <datalist id="insertvendorassetnamebind">
				<option ng-repeat="x in  vendorassetdetails"  value="{{x.assetname}}"></option>
			</datalist>
			
<!-- 					 <input type="text"   id="maketypenamevendorlist" style="width:289px;" ng-model="maketypevendor"  name='input' /> -->
<!-- 			{{maketypevendor}} -->
            <input class="form-control clearable" id="insertvendorassetname" ng-model="vendormakename" list="insertvendorassetnamebind" placeholder="Make Name" type="text" required>
    	        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
    	
    	 </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          	 <datalist id="insertvendormakenamebind">
				<option ng-repeat="x in  vendormakenamelist" ng-if="x.assetname==vendormakename"  value="{{x.makename}}"></option>
			</datalist>
<!-- 		<input type="text" ng-click="getval()"  style="width:289px;" id="makenamevendorlist" name='input1' /> -->
			
			
            <input class="form-control clearable" id="insertvendormakename" value="{{vendorupdate.makename}}" list="insertvendormakenamebind" placeholder="Make Name" type="text" required>
                 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
    
     <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vendor Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
      <input class="form-control clearable" id="insertvendorname"  value="" placeholder="Vendor Name" type="text" required>
            <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
    
    	</div>
        </div>
      </div>
     <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          
      <input class="form-control clearable" id="insertvendorcontactperson"  value="" placeholder="Contact Person" type="text" required>
                  <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Designation:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
<!--          <datalist id="MakeVendorName12"> -->
<!-- 			<option ng-repeat="x in vendorlist" value="{{x.vendorfirmname}}"></option> -->
<!-- 		</datalist> -->
	<input class="form-control clearable" id="insertvendordesignation" list="MakeVendorName12" value="" placeholder="Designation" type="text" required>
		        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		
        </div>
        </div>
      </div>

<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendormobileno"  onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" maxlength="10" required>
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
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Landline No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendorlandlineno"  maxlength='11' onkeyup="landlineValidation(this)"  onchange="lengthValidationLandline(this);" placeholder="Landline No" type="text">
                 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          <div class="alert alert-warning"  id="idmsg1" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		<div class="alert alert-warning"  id="lengthlanline" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 11 digits!
  		</div>
  		
  		
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Email ID:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="insertvendoremailid"  onblur="return validateForm(this);" placeholder="Email ID" type="text" required>
            <div class="alert alert-warning"  id="emailmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Not a valid Email Id!
	  		</div>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Contact No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendorserstationcontactno"  onkeyup="contactnoValidation(this)" onchange="lengthValidationcontact(this);" placeholder="Contact No" type="text" maxlength="10" required>
                 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
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
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vendor Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control clearable" id="insertvendoraddress" placeholder="Vendor Address" type="text" required></textarea>
                  <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6" hidden>
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">ServiceStation Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control clearable" id="insertvendorserstationadd" placeholder="ServiceStation Address" type="text"></textarea>
                 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">City:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendorcity" placeholder="City" type="text">
                     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>

          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">State:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendorstate" placeholder="State" type="text">
                      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Credit Days:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"   onkeyup="deviceValidation(this)" id="insertvendorcreditdays" placeholder="Credit Days" type="text" required>
                       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
            <div class="alert alert-warning"    id="iddeviceno" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
          </div>
        </div>
      </div>
      
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Credit Date:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control datepick" id="insertvendorpaymentdate" placeholder="Payment Date" type="text" required> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertvendorremark" placeholder="Remark" type="text">
             <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         
          <button  type="submit"  class="action-button shadow animate green" ng-click="vendorInsert();"><font color="black">Save</font></button>				
         
          
          <button  class="action-button shadow animate blue" type="reset" ><font color="black">Reset</font></button>
         
         
       
          <a  href="#/VendorFormUpdate"><button type="button" class="action-button shadow animate red"  ><font color="black">Back</font></button></a>
          
          
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
		
	
		<!-- /.widget-box -->
	
	
	
	
	
	<!-- /.col -->












