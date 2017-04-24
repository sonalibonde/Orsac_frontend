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
					
						<li ><a data-toggle="tab" href="#/CustomerMasterFormUpdate">Customer Master</a></li>

						<li class="active"><a data-toggle="tab" href="#/CustomerMasterFormInsert">New Entry
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
											<font color="white">Customer Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
										

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="inserdealerform">
<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Basic Details</font>
</legend>

 <div class="row">
 
 
 <div class="col-sm-6 col-lg-6" id="maindealer">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Dealer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist  id="vehDealer1">
     		  <option    ng-if="x.loginid=='10001'"  ng-repeat=" x in dealerdetailslistcust" value="{{x.dealername}}"></option>
      	   </datalist>
      	<input type="checkbox" id="dealercheck" ng-click="getdealer()" value="dealer">
        <input class="form-control clearable"  list="vehDealer1" id="vehdealerdetails1" ng-model="dealername"  placeholder=" Select Dealers" type="text" hidden required>
         </div>
        </div>
      </div>
 
 
 <div class="col-sm-6 col-lg-6" id="dealersDetails">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Select Sub Dealers:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist  id="custDealer">
     		 <option ng-if="x.parentdealer==dealername  && x.loginid!=='10001'" value="{{x.dealername}}"  ng-repeat=" x in dealerdetailslistcust"></option>
      	</datalist>
      	<input type="checkbox" id="subdealercheck" ng-click="getsubdealer()" value="subdealer">
        <input class="form-control clearable col-sm-4"  ng-model="dealercusthdetails1"  list="custDealer" id="custdealerdetails" placeholder=" Select Dealers" type="text" hidden required>
         </div>
        </div>
      </div>
        
  <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Customer Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="insertcustomertypelist">
           		<option value="Individual"></option>
				<option value="Organization"></option>
		  	</datalist>
            <input class="form-control clearable" list="insertcustomertypelist" id="insertcustomertype" placeholder="Customer Type" value="Individual" type="text" required >
            <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
    </div>
  <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" id="cname" class="col-md-4 control-label"><font color="black">{{rname}}</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomername" placeholder="Customer Name" type="text"  required>
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact Person:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomercontactperson" placeholder="Contact Person" type="text" required>
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomermobileno" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
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
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Alternate No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  onkeyup="alternateValidation(this)" id="insertcustomeraltno" maxlength='10'  onchange="lengthAlternateNo(this)" placeholder="Alternate  No" type="text" >
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          <div class="alert alert-warning"  id="idmsg2" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		 <div class="alert alert-warning"  id="length1" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          </div>
        </div>
      </div>
     
     
     

      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input7" class="col-md-4 control-label"><font color="black">Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
              <textarea class="form-control clearable" id="insertcustomeradd" placeholder="Address" type="text" required>
         </textarea>
             		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
</div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black"> City:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomercity" placeholder="City" type="text">
     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>

       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">Pincode:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomerpincode" placeholder=" Pincode" type="text">
     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" onblur="return validateForm(this);"  id="insertcustomeremailid" placeholder="Email Id" type="text" required>
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          <div class="alert alert-warning"  id="emailmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong>Not a valid Email Id!
  		</div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Is Credit:</font></label>
          <div class="col-md-8">
          <input type="radio"  id="insertcustomercredit"  name="insertcustomermode" value="Yes" checked> <label for="customerdealercredit">Yes</label>
  		<input type="radio" id="insertcustomernotcredit"  name="insertcustomermode" value="No" > <label for="customerdealernotcredit">No</label>
         	
             </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6" id="customercreditDays">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Days:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onkeyup="creditdaysValidation(this)"  id="insertcustomercreditdays" placeholder="Credit Days" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             <div class="alert alert-warning"  id="creditdays" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
             
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6" id="customercreditAmt" >
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Amount:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onkeyup="deviceValidation(this)" id="insertcustomercreditamount" placeholder="Credit Amount" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          <div class="alert alert-warning"  id="iddeviceno" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
          
             </div>
        </div>
      </div>
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Payment Mode:</font></label>
          <div class="col-md-8">
          <input type="radio"  id="insertcustomerBycash"  name="insertcustpaymode" value="By Cash" checked> <label for="insertcustomerBycash">By Cash</label>
  		<input type="radio" id="insertcustomernotBybank"  name="insertcustpaymode" value="By Bank" > <label for="insertcustomernotBybank">By Bank</label>
         	
             </div>
        </div>
      </div>
      
</div>
</fieldset>
<!-- <div class="row"> -->

<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" id="insertbankFieldset"  hidden ="true"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Banking Details</font>
</legend>


<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Name:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomerbankname" placeholder="Bank Name" type="text"  >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
<div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Branch:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomerbranch" placeholder="Branch" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Account No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomeraccountno"  onkeypress="return isNumberKey(event)" placeholder="Account no" type="text"  >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Bank Address:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomerbankadd" placeholder="Bank Address" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">IFSC No.:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertcustomerifsc" placeholder="IFSC" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
       
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomerremark" placeholder="remark" type="text" >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
            
</fieldset>

<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;" id="insertbankFieldset"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>User Creation</font>
</legend>

  <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Login Name:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable"  id="insertCustomerLoginname" placeholder="Login Name" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
         
  <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Password:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" onblur="CheckPassword(this);"  type="password"  id="insertCustomerpassword" placeholder="Password" type="text" >
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             <div class="alert alert-danger"  id="passmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Password Field  should contains atleast one Digit,one Uppercase,one Lowercase and special character!
		  		</div>
		  	<a href="" onclick="toggle_password('insertCustomerpassword');" id="showhide">Show</a>
		  		
             </div>
        </div>
      </div>
       

</fieldset>




<div class="row">
<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         
          <button type="submit"  class="action-button shadow animate green" ng-click="customerInsert();"><font color="black">Save</font></button>				
    	
 		
        	<button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
          
         
    
        <a   href="#/CustomerMasterFormUpdate"><button class="action-button shadow animate red" type="button"><font color="black">Back</font></button></a>				
         
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







