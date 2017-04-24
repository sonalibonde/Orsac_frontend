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
						<li ><a href="#/ModelFormUpdate"><font>Model</font>
						</a></li>

						<li class="active"><a  href="#/ModelFormInsert"><font>New Entry</font></a></li>
						

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
											<font color="white">Model Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="modelforminsert">
    <div class="row">
    
    
    <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Make Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
		<datalist id="editModelassetName">
			<option ng-repeat="x in modelassetnamelist" ng-if="x.assetname!='Sim'" value="{{x.assetname}}"></option>
		</datalist>
            <input class="form-control" id="editmodelassetname" ng-model="modelassetname"  list="editModelassetName"  placeholder="Make Type" type="text" required>
          </div>
        </div>
      </div>
    
     <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist id="modelinsertmakebind">
			<option ng-repeat="x in modelmakenamelist" ng-if="x.assetname==modelassetname" value="{{x.makename}}"></option>
		</datalist>
	<input class="form-control clearable" id="insertmodelmakename" list="modelinsertmakebind" value="" placeholder="Make Name" type="text" required>
		  <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
		
        </div>
        </div>
      </div>
    
    
    
     <div class="col-sm-4 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Model Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
      <input class="form-control clearable" id="insertmodelname"  value="" placeholder="Model Name" type="text" required>
      <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
    
    	</div>
        </div>
      </div>
     
     

      <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control clearable" id="insertmodelremark" placeholder="Remark" type="text">
           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span>
         
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <div class="col-md-8">
          &nbsp;
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        
          <button  type="submit"  class="action-button shadow animate green" ng-click="modelInsert();"><font color="black">Save</font></button>				
         
         
          <button  class="action-button shadow animate blue"type="reset" ><font color="black">Reset</font></button>
       
           
        <a  href="#/ModelFormUpdate"><button type="button"  class="action-button shadow animate red"><font color="black">Back</font></button></a>				
         
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












