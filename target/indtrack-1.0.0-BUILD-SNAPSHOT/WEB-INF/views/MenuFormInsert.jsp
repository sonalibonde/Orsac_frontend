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
					
						<li ><a data-toggle="tab" href="#/MenuFormUpdate"><font>Menu
								Creation</font></a></li>

						<li class="active"><a data-toggle="tab" href="#/MenuFormInsert"><font>New Entry</font>
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
											<font color="white">Menu Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
										

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="menuinsertform">
    <div class="row">
       <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Menu Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="insertmenuname" placeholder="Menu Name" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Navigate URL:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="insertnavigateurl"  placeholder="Navigate URL" type="text" >
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Parent Menu:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="insertmenuparentbind">
				<option ng-repeat="x in  menusdetails" ng-if="x.parentid=='11'" value="{{x.menutext}}"></option>
		  </datalist>
		  
		  
<!-- <select ng-model="selectedCar" class="selectRow"> -->
<!-- <option ng-repeat="x in menusdetails" value="{{x.menutext}}">{{x.menutext}}</option> -->
<!-- </select> -->
		  
	
      
      
		  
<!-- 		  <div class="selectRow"> -->
<!-- 		        <input type="hidden"  style="width:289px;"  id="remoteDataExample"  name="input" ng-model="selectvalue"  /> -->
<!-- 		    </div> -->
		 
          <input class="form-control " id="insertparentmenu" list="insertmenuparentbind" placeholder="Parent Menu" type="text" >
<!--            <div class="selectRow"> -->
<!-- 		        <input type="hidden" id="remoteDataExample" name='input' /> -->
<!-- 		    </div> -->
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
<!--         <select id="mySel" class="form-control"> -->
<!--           <option ng-repeat="item in menusdetails" ng-selected="item.selected" >{{item.menutext}}</option> -->
<!--         </select> -->


<!-- <select class="selectpicker" data-live-search="true" > -->
<!--     <option>Alabama</option> -->
<!--     <option>Alaska </option> -->
<!--     <option>Arizona </option> -->
<!--     <option>Arkansas </option> -->
<!--     <option>California </option> -->
<!--     <option>Colorado </option> -->
<!--     <option>Connecticut </option> -->
<!--     <option>Delaware </option> -->
<!--     <option>Florida </option> -->
<!--     <option>Georgia </option> -->
<!--     <option>Hawaii </option> -->
<!--     <option>Idaho </option> -->
<!--     <option>Illinois Indiana </option> -->
<!--     <option>Iowa </option> -->
<!--     <option>Kansas </option> -->
<!--     <option>Kentucky </option> -->
<!--     <option>Louisiana </option> -->
<!--     <option>Maine </option> -->
<!--     <option>Maryland </option> -->
<!--     <option>Massachusetts </option> -->
<!--     <option>Michigan </option> -->
<!--     <option>Minnesota </option> -->
<!--     <option>Mississippi </option> -->
<!--     <option>Missouri </option> -->
<!--     <option>Montana Nebraska </option> -->
<!--     <option>Nevada </option> -->
<!--     <option>New Hampshire </option> -->
<!--     <option>New Jersey </option> -->
<!--     <option>New Mexico </option> -->
<!--     <option>New York </option> -->
<!--     <option>North Carolina </option> -->
<!--     <option>North Dakota </option> -->
<!--     <option>Ohio </option> -->
<!--     <option>Oklahoma </option> -->
<!--     <option>Oregon </option> -->
<!--     <option>Pennsylvania Rhode Island </option> -->
<!--     <option>South Carolina </option> -->
<!--     <option>South Dakota </option> -->
<!--     <option>Tennessee </option> -->
<!--     <option>Texas </option> -->
<!--     <option>Utah </option> -->
<!--     <option>Vermont </option> -->
<!--     <option>Virginia </option> -->
<!--     <option>Washington </option> -->
<!--     <option>West Virginia </option> -->
<!--     <option>Wisconsin </option> -->
<!--     <option>Wyoming</option> -->
<!-- </select> -->





      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Menu Description:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="insertdescription"  placeholder="Menu Description" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Order No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="insertorderno"  placeholder="Order No" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        
          <button type="submit"  class="action-button shadow animate green" ng-click="menuinsert();"><font color="black">Save</font></button>				
    	
 		 
        <button type="reset" class="action-button shadow animate blue" ><font color="black">Reset</font></button>				
          
         
        
        <a href="#/MenuFormUpdate"><button type="button"  class="action-button shadow animate red" ><font color="black">Back</font></button></a>				
          
         
          
         
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







