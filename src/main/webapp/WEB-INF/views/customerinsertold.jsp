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
									<div class="widget-header widget-header-flat widget-header-small" style="background: rgb(64,64,64) ;">
										<h5 class="widget-title">
											<font color="white">Customer Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
										

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="insertcustomer">
    <div class="row">
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback ">
          <label  class="col-md-4 control-label"><font color="black">Customer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomername"   placeholder="Customer Name" type="text" required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Customer Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="insertcustomertype" value="" placeholder="Customer Type" type="text" required>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
    
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomermobile" maxlength='10' onkeyup="PhoneValidation(this)" onchange="lengthValidation(this)"  value="{{editcompanyy.lanldlinenumber1}}" placeholder="Mobile No" type="text">
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Alternate No:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="insertcustomeraltno" maxlength='11' onkeyup="PhoneValidation(this)" placeholder="Alternate No" type="text" >
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      
      <div class="col-sm-4 col-lg-6">
        <div class="form-group  has-feedback">
          <label class="col-md-4 control-label"><font color="black">Local Address:</font></label>
          <div class="col-md-8">
            <textarea class="form-control clearable " id="insertcuatomerLadd"  placeholder="Local Address" type="text" ></textarea>
        <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Permanent Address:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <textarea class="form-control clearable" id="insertcustPadd"  placeholder="Permanent address" type="text" required></textarea>
         <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback ">
          <label  class="col-md-4 control-label"><font color="black">Local City:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomerLcity"  placeholder="Local City" type="text">
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback ">
          <label  class="col-md-4 control-label"><font color="black">Permanent City:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="insertcustomerPcity"  placeholder="Permanent City" type="text" required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Local Pincode:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomerLpincode"  placeholder="Local Pincode" type="text">
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Permanent Pincode:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertcustomerPpincode"  placeholder="Permanent Pincode" type="text" required>
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable " id="insertcustomerremark"  placeholder="remark" type="text" >
          
          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          </div>
        </div>
      </div>



<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
       
          <button type="submit"  class="action-button shadow animate green" ng-click="customerInsert();"><font color="black">Save</font></button>				
    	
        <button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
        
        <a  class="action-button shadow animate red"  href="#/CustomerMasterFormUpdate"><font color="black">Back</font></a>				
        
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







