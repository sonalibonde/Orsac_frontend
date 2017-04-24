<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">
						<div id="task-tab" class="tab-pane active">
							<div class="col-sm-12">
								<div class="widget-box" id="rolemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<font color="white">Daily Performance Report Movement Idle Time Base</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >


<div class="widget-main">
<form role="form" name="history">
<div class="row">
   
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>Select Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="poorPerformancedate" required>
    </div>
    
    <div class="form-group col-xs-4 col-md-2">
     <div>&nbsp;</div>
      <button  type="submit" id="showrep" class="action-button shadow animate green"  ng-click="getLogs();"><font color="black">View</font></button>
    </div>
     <div class="form-group col-xs-4">
  	   <div class="alert alert-danger"  id="reportmsg" hidden data-toggle=" bottom">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong>You can see Report within seven days!
  		</div>
  	</div>
</div>
</form>

<div class="row">&nbsp;&nbsp;</div>

<div class="row" id="topdatatime" hidden>

<div class="col-md-12">
	<div>
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Star Performing Ambys</font></div>
					<div class="panel-body">

<div id="bartop123r" class="barlabel"></div>
	</div>
	</div>
	</div>
	
	
</div>
</div>


<div class="row">&nbsp;&nbsp;</div>




<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable" hidden>
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													 <th><font color="white">Top 10 Star Performing Ambys-Idle Time Basis</font></th>
<!-- 													 <th><font color="white">Top 10 Poor Performing Ambys-Idle Time Basis</font></th> -->
													</tr>
													</thead>

												<tbody>
										
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color: #938d82">
												<th><font>Vehicle No.</font></th>
												<th><font>Base Location</font></th>
												<th><font>District</font></th>
												<th><font>Time-HH:MM:SS</font></th>
												</tr>
												</thead>
												<tbody>
												<tr ng-repeat="per in performancetopdetails">
													<td><font>{{per.vehicleno}}</font></td>
													<td><font>{{per.baselocation}}</font></td>
													<td><font>{{per.district}}</font></td>
													<td><font>{{per.time}}</font></td>
												
												</tr>
											</tbody></table>
												</td>
												
													</tbody>
												</table>
												
				
								
			
</div>

<div class="row">&nbsp;&nbsp;</div>

<div class="row"  id="poordatatime" hidden>
<div class="col-md-12">

<div >
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Poor Performing Ambys</font></div>
					<div class="panel-body">

<div id="barpoor" class="barlabel"></div>
	</div>
	</div>
	</div>
</div></div>

<div class="row">&nbsp;&nbsp;</div>

<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" id="performancetable1" hidden>
													<colgroup>
														<col width="50%">
<%-- 														<col width="50%"> --%>
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
<!-- 													 <th><font color="white">Top 10 Star Performing Ambys-Idle Time Basis</font></th> -->
													 <th><font color="white">Top 10 Poor Performing Ambys-Idle Time Basis</font></th>
													</tr>
													</thead>

												<tbody>
										
												
											
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color:#938d82">
												<th><font>Vehicle No.</font></th>
												<th><font>Base Location</font></th>
												<th><font>District</font></th>
												<th><font>Time-HH:MM:SS</font></th>
												</tr>
												</thead>
												<tbody>
													<tr ng-repeat="per in performancepoordetails">
													<td><font>{{per.vehicleno}}</font></td>
													<td><font>{{per.baselocation}}</font></td>
													<td><font>{{per.district}}</font></td>
													<td><font>{{per.time}}</font></td>
												
												 </tr>	
												 </tbody>
													</table>
													</td>
													
												
											</tbody>
									</table>






</div>




</div>


</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
			
	
	










