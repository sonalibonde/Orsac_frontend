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
					
						<li ><a  href="#/UserFormUpdate"><font>User Creation</font>
							</a></li>

						<li class="active"><a  href="#/UserFormInsert"><font>New Entry</font>
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
											<font color="white">User Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">


<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="insertuserform">
    <div class="row">
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Role Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <datalist id="insertuserrolebind">
				<option ng-repeat="x in  insertroledetailslist" ng-if="x.flag='true'" value="{{x.rolename}}"></option>
			</datalist>
            <input class="form-control clearable"  list="insertuserrolebind" id="insertuserrolename" placeholder="Role Name" type="text" required>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">{{rname}} Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     		 <datalist id="insertusercomapnybind">
				<option ng-repeat="x in  userclist"  value="{{x.companyname}}"></option>
			</datalist>
			 <datalist id="insertuserdealerbind">
				<option ng-repeat="x in  userdlist" value="{{x.dealername}}"></option>
			</datalist>
			 <datalist id="insertusercustomerbind">
				<option ng-repeat="x in  usercustlist" value="{{x.customername}}"></option>
			</datalist>
			<datalist id="insertusercirclebind">
				<option ng-repeat="x in  usercirclelist" value="{{x.circlename}}"></option>
			</datalist>
            <input class="form-control clearable"  id="insertusercompany" placeholder="Name" type="text" required>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Login Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertuserloginname" placeholder="Login Name" type="text" required >
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
     
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Password:</font><b style="color:Red;font-weight:normal;">*</b></label>
           <div class="col-md-8">
            <input class="form-control clearable" id="insertuserpassword" placeholder="Password" type="password" required >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		      <div class="alert alert-danger"  id="passmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Password Field  should contains atleast one Digit,one Uppercase,one Lowercase and special character!
		  		</div>
		  		<a href="" onclick="toggle_password('insertuserpassword');" id="showhide">Show</a>
			 </div>
        </div>
      </div>
      
    
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        
          <button type="submit"  class="action-button shadow animate green" ng-click="userInsert();"><font color="black">Save</font></button>				
    	
 		
        	<button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
          
         
        
        <a  href="#/UserFormUpdate"><button type="button" class="action-button shadow animate red"><font color="black">Back</font></button></a>				
         
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







