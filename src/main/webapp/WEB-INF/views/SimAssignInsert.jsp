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
						<li ><a data-toggle="tab" href="#/SimAssignFormUpdate"><font>Sim Assign</font>
						</a></li>

						<li class="active"><a data-toggle="tab" href="#/SimAssignFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>

<div id="member-tab" class="tab-pane ">
							<!-- 											for bar division -->
							<div class="col-sm-12">
								<div class="widget-box" id="siminsert">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">SIM Assign to Device Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
									
<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="simassigninsert">
    <div class="row">
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label  class="col-md-4 control-label"><font color="black">Device IMEI Number</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist id="devicenamebind">
				<option ng-repeat="x in devicedetails" ng-if="x.statussim!='Sim Assigned'" value="{{x.uniqueid}}"></option>
		</datalist>
   <input class="form-control clearable" id="devicenumber" placeholder="Device Number" type="text"  list="devicenamebind" required>
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
            <input class="form-control clearable" id="simnumberInsert" list="simnumberbind" placeholder="Sim Number" type="text" required>
            <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
        
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
         <input class="form-control clearable"  id="remark" placeholder="Remark" type="text" >
      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
          
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
    
          <button   class="action-button shadow animate green"  ng-click="simassigninsertnew();"><font color="black">Save</font></button>
       
          <button  type="reset"  class="action-button shadow animate blue"  type="reset"><font color="black">Reset</font></button>		
        <a  href="#/SimAssignFormUpdate"><button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>				
         
        </div>
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
  </form>

<!-- </fieldset> -->
	
						
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








