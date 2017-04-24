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
											<font color="white">Daily Performance Report</font>
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

	<div class="row">

<div class="col-md-12" id="statistics" hidden>
<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0">
													<colgroup>
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													<th><font color="white">Total Nos. of Case IDs Assigned to Ambys</font></th>
													 <th><font color="white">Nos. of Cases Availed by Ambys</font></th>
													<th><font color="white">% of Total Availed Cases</font></th>
													<th><font color="white">No. of Ambys Availed Cases between 10 to 05</font></th>
													<th><font color="white">No. of Ambys Availed Cases between 5 to 01</font></th>
													<th><font color="white">No. of Ambys Availed Zero (0) Cases</font></th>
													</tr>
													</thead>
												<tbody>
												<tr>
												<td><font color="black">713</font></td>
												<td><font color="black">553</font></td>
												<td><font color="black">78%</font></td>
												<td><font color="black">89</font></td>
												<td><font color="black">421</font></td>
												<td><font color="black">38</font></td>
												
												
												
												</tr>
												
												</tbody>
												
												</table>

</div>

</div>

</div>				





<div class="row">&nbsp;&nbsp;</div>



<div class="row" id="topdata" hidden>

<div class="col-md-12">
	<div class="col-md-6">
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Star Performing Ambys</font></div>
					<div class="panel-body">

<div id="bartop123r" class="barlabel"></div>
	</div>
	</div>
</div>
	
	



<div class="col-md-6" >
		<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font>Top 10 Poor Performing Ambys</font></div>
					<div class="panel-body">

<div id="barpoordistrict" class="barlabel"></div>
	</div>
	</div>
	</div>
</div>
</div>
	
	
<div class="row">&nbsp;&nbsp;</div>
	
	
	
<div class="col-md-12" id="districtGrade" hidden>
<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0">
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														
													
														
													</colgroup>
													<thead>
													<tr id="gridheader">
													 	
													 <th><font color="white">Top 5 Star Performing Districts</font></th>
													 <th><font color="white">Top 5 Poor Performing Districts</font></th>
													<th><font color="white">Star Performer District of the Day</font></th>
													</tr>
													</thead>
												<tbody>
												<tr>
												<td><font color="black">Villupuram</font></td>
												<td><font color="black">Tirupur</font></td>
												<td rowspan="5" style="text-align: center"><font size="20">Villupuram</font></td>
												</tr>
												<tr>
												<tr>
												<td><font color="black">Vallore</font></td>
												<td><font color="black">Salem</font></td>
												</tr>
												<tr>
												<td><font color="black">Neelgiri</font></td>
												<td><font color="black">Erode</font></td></tr>
												
												<tr>
												<td><font color="black">Thiruvannamalai</font></td>
												<td><font color="black">Chennai</font></td></tr>
												
												<tr>
												<td><font color="black">Kancheepuram</font></td>
												<td><font color="black">Coimbatore</font></td>
												</tr>
												</tbody>
												
												</table>
	
	
	
	
	
	
</div>
</div>









<div class="row">&nbsp;&nbsp;</div>

<div class="col-md-12" id="performancetable" hidden>

<table class=" table-bordered"  style="border: 1px solid black; " width="100%" cellspacing="0" >
													<colgroup>
														<col width="50%">
														<col width="50%">
													
														
													</colgroup>
													<thead>
													<tr id="gridheader" style="text-align: center;">
													 	
													 <th><font color="white">Top 10 Star Performing Ambys-Km Basis</font></th>
													 <th><font color="white">Top 10 Poor Performing Ambys-Km Basis</font></th>
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
												</tr>
												</thead>
												<tbody>
												<tr ng-repeat="per in performancetopdetails">
													<td><font>{{per.vehicleno}}</font></td>
													<td><font>{{per.baselocation}}</font></td>
													<td><font>{{per.district}}</font></td>
												
												</tr>
											</tbody></table>
												</td>
											
											
												<td>
												<table width="100%" style="border: 1px ">
												<thead>
												<tr style="background-color:#938d82">
												<th><font>Vehicle No.</font></th>
												<th><font>Base Location</font></th>
												<th><font>District</font></th>
												</tr>
												</thead>
												<tbody>
													<tr ng-repeat="per in performancepoordetails">
													<td><font>{{per.vehicleno}}</font></td>
													<td><font>{{per.baselocation}}</font></td>
													<td><font>{{per.district}}</font></td>
												
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
</div>
</div>			
	
	










