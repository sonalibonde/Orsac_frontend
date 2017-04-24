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
<!-- 						<li ><a data-toggle="tab" href="#/DealerAssignFormUpdate">Device Assignment to Dealer -->
<!-- 						</a></li> -->

						<li class="active" ng-if="loginid!=10001"><a data-toggle="tab" href="#/DealerAssignFormInsert">New Entry</a></li>
						

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
											<font color="white">Device Assignment to Dealer Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
	
<div style="text-align: right;"><font style="font-size: 19px;" color="#52417F"><b>Available Devices:</b></font><font style="font-size: 19px;" color="Green"><b> {{AvialDevice}}</b></font></div>			
<form class="form-horizontal" role="form" name="DealerassignInsert">
<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 
<legend	 style="padding: 0 10px; border-bottom: none; width: inherit;"><font>Basic Details</font>
</legend>
    <div class="row">
    
     <div class="col-sm-6 col-lg-6">
        <div class="form-group has-feedback">
         <label for="input5" class="col-md-4 control-label"><font color="black">Dealer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
    
      
<!--         <select class="form-control" id="insertdealername" data-live-search="true"> -->
<!--            <option ng-repeat="x in dealerassdealerdetailslist" value="{{x.dealername}}">{{x.dealername}}</option> -->
<!--         </select> -->
          
          	<datalist id="insertdealername">
				<option ng-repeat="x in dealerassdealerdetailslist " value="{{x.dealername}}"></option>
			</datalist>
            <input class="form-control clearable"  id="insertdealerassignname"  list="insertdealername"  placeholder="Dealer Name" type="text" required >
          </div>
        </div>
      </div>
      	 
      </div><br><br>
      <div id="devices" >
<!--         <div class="form-group"> -->
<!--           <div class="col-md-8"> -->
<!-- <table class="table table-hover table-bordered"> -->
<%-- <caption id="gridheader" style="text-align:center"><font color="white">Select Devices</font></caption> --%>
<!-- 			<thead><tr> -->
<!-- 					   <td> -->
<!-- 					   <font color="white">Search:</font> -->
<!-- 					   <input  ng-model="query" /> -->
<!-- 					  </td></tr> -->
<!-- 			</thead> -->
<!-- 			</table> -->
			<div>
				<center><table class="table table-hover table-bordered" width="100%" cellspacing="0">
				    <tr dir-paginate="x in devicedealerlist|orderBy:sortKey:reverse|filter:query|itemsPerPage:devlength" style="float: left;">
			       			<td >
			       				<input type="checkbox" id="{{x.deviceid}}" ng-click="includeColour(x.deviceid)"/><label for="{{x.deviceid}}" >&nbsp{{x.uniqueid}}</label>
			       			</td>
			       	</tr>
			</table></center>
			</div>
          <span class="form-control-feedback"></span>
<!--           </div> -->
<!--         </div> -->
      </div>
    </fieldset>

 
    
    
    
    <div class="row">
    
    
    <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        
    <button  class="action-button shadow animate green" ng-click="dealerassign();"><font color="black">Save</font></button>
   
     
   <button type="reset" class="action-button shadow animate blue"><font color="black">Reset</font></button>		
           
<!--     <a href="#/DealerAssignFormUpdate"><button  type="button"  class="action-button shadow animate red"><font color="black">Back</font></button></a>				 -->
          
        </div>
      </div>
    </div>
  </form>

	
						
											<div class="hr hr8 hr-double"></div>

								
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>


						</div>

				




					</div>
				</div>
			</div>









