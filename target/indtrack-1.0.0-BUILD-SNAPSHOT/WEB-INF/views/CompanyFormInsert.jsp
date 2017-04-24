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
					
						<li ><a data-toggle="tab" href="#/CompanyFormUpdate"><font>Company
								Creation</font></a></li>

						<li class="active"><a data-toggle="tab" href="#/CompanyFormInsert"><font>New Entry</font>
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
											<font color="white">Company Entry</font>
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
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Company Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"  name="cname1" id="cname1" placeholder="Company Name" type="text" required autofocus>
    		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
             </div>
        </div>
      </div>
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="inputPassword" class="col-md-4 control-label"><font color="black">Short Name:</font></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control clearable" id="sname1" placeholder="Short Name" type="text"> -->
<!--         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="inputPassword" class="col-md-4 control-label"><font color="black">Contact person:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--             <input class="form-control clearable" id="person1" placeholder="Contact person" type="text" required> -->
<!--      	 <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="mobile1" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)" placeholder="Mobile No" type="text" required>
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
            <input class="form-control clearable" maxlength='11' id="landline1" onkeyup="PhoneValidation(this)" placeholder="Landline No" type="text" >
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        <div class="alert alert-warning"  id="idmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input5" class="col-md-4 control-label"><font color="black">Fax No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="fax1" placeholder="Fax No"  type="text">
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
<!--          <div class="alert alert-warning"  id="faxdata" hidden data-toggle=" left"> -->
<!--    	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
<!--     	<strong>Warning!</strong> Allow Digits Only! -->
<!--   		</div> -->
  		
<!--   		 <div class="alert alert-warning"  id="faxval" hidden data-toggle=" left"> -->
<!--    	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a> -->
<!--     	<strong>Warning!</strong> Should not be less than 10 digits! -->
<!--   		</div> -->
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input6" class="col-md-4 control-label"><font color="black">Company Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control clearable" id="cadd1" placeholder="Company address" type="text" required></textarea>
       <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
            </div>
        </div>
      </div>
<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group has-feedback"> -->
<!--           <label for="input7" class="col-md-4 control-label"><font color="black">Registered address:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--               <textarea class="form-control clearable" id="radd1" placeholder="Registered address" type="text" required> -->
<!--          </textarea> -->
<!--              		<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
<!-- </div> -->
<!--         </div> -->
<!--       </div> -->
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="emailid" class="col-md-4 control-label"><font color="black">Email Id:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable"    onkeyup="ValidateEmail(this);" id="email1" placeholder="Email Id" type="text" required>
     <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>
      
       <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">City:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcompcity" placeholder="City" type="text" required>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">State:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcompstate" placeholder="State" type="text" required>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Zip:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcompzip" placeholder="Zip" type="text" required>
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="input8" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="rem1" placeholder="Remark" type="text" >
			<span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
      
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
<!--         <table><tr> -->
<!--         <td> <button type="submit"  class="action-button shadow animate green" ng-click="companyinsert();"><font color="black">Save</font></button>				 -->
<!--         </td> -->
<!--         <td> <button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				 -->
<!--         </td> -->
<!--         <td> <button type="button"   id="myButton" class="action-button shadow animate red"><font color="black">Back</font></button>				 -->
<!--         </td> -->
<!--         </tr> -->
<!--         </table> -->
<!--          <div class="col-md-4 "> -->
          <button type="submit"  class="action-button shadow animate green" ng-click="companyinsert();"><font color="black">Save</font></button>				
<!--     	</div>  -->
<!--  		<div class="col-md-4">   -->
        <button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
<!--          </div> -->
<!--       <div class="col-md-4">   -->
        <a type="button"  class="action-button shadow animate red" href="#/CompanyFormUpdate"><font color="black">Back</font></a>				
          
<!--           </div> -->
          
      
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







