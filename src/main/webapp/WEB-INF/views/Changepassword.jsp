<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
						<!-- 	vehicle creation	 -->


						<div id="member-tab" class="tab-pane ">
							<!-- 											for bar division -->
							<div class="col-sm-12">
								<div class="widget-box">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<font color="white">Change Password</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">


<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="insertchangeuserform">
    <div class="row">
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Login Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"   id="changeuserloginname" placeholder="Login Name" type="text" required readonly>
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
     
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Old Password:</font><b style="color:Red;font-weight:normal;">*</b></label>
           <div class="col-md-8">
            <input class="form-control clearable"  onblur="CheckPassword(this);" id="changeolduserpassword" placeholder=" Old Password" type="password" required >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		    <div class="alert alert-danger"  id="passmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Password Field  should contains atleast one Digit,one Uppercase,one Lowercase and special character!
		  		</div>
<!-- 		  		<a href="" onclick="toggle_password('insertuserpassword');" id="showhide">Show</a> -->
			 </div>
        </div>
      </div>
      
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">New Password:</font><b style="color:Red;font-weight:normal;">*</b></label>
           <div class="col-md-8">
            <input class="form-control clearable"  onblur="ChecknewPassword(this);" id="changenewuserpassword" placeholder=" New Password" type="password" required >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		    <div class="alert alert-danger"  id="passnewmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Password Field  should contains atleast one Digit,one Uppercase,one Lowercase and special character!
		  		</div>
<!-- 		  		<a href="" onclick="toggle_password('insertuserpassword');" id="showhide">Show</a> -->
			 </div>
        </div>
      </div>
      
      
      
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Confirm Password:</font><b style="color:Red;font-weight:normal;">*</b></label>
           <div class="col-md-8">
            <input type="password" class="form-control clearable"  onblur="CheckconfirmPassword(this);" id="confirmuserpassword" placeholder="Password" type=" Confirm password" required >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		    <div class="alert alert-danger"  id="passconfirmmsg" hidden data-toggle=" left">
		   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Warning!</strong>Password Field  should contains atleast one Digit,one Uppercase,one Lowercase and special character!
		  		</div>
<!-- 		  		<a href="" onclick="toggle_password('insertuserpassword');" id="showhide">Show</a> -->
			 </div>
        </div>
      </div>
      
      
      
    
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        <button type="submit"  class="action-button shadow animate green" ng-click="changePass();"><font color="black">Change Password</font></button>				
    	<button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
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







