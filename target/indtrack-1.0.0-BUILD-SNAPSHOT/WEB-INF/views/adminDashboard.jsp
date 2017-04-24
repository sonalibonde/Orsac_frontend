<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<div id="container">
<div class="row">

	<div class="col-xs-12">
	<div class="row">
	
	<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border" >
					<ul class="nav nav-tabs" id="recent-tab">
					<li class="active"><a data-toggle="tab" href="#/adminDashboard"><font>Summary</font>
							</a></li>

						<li><a data-toggle="tab" href="#/Devicestatistics"><font>Device Statistics</font>
							</a></li>
							
<!-- 						<li><a data-toggle="tab" href="#/DealerMap"><font>Live Map</font> -->
<!-- 						</a></li> -->
<!-- 						<li><a data-toggle="tab" href="#/Nonpolling"><font>Nonpolling</font> -->
<!-- 						</a></li> -->

					</ul>
				</div>
			</div>
			</br>
			<div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-aqua">
            <span class="info-box-icon"><font color="white"><i class="fa fa-building fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Empanelled Companies Providing VTD</span>
              <span class="info-box-number">{{companycount}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-green">
            <span class="info-box-icon"><font color="white"><i class="fa fa-truck fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Vehicle Tracking Devices</span>
              <span class="info-box-numberval">{{totdevices}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-yellow">
            <span class="info-box-icon"><font color="white"><i class="fa fa-mobile fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Installed Devices</span>
              <span class="info-box-numberdev">{{totinstalled}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box bg-red">
            <span class="info-box-icon"><font color="white"><i class="fa fa-truck fa-3x"></i></font></span>

            <div class="info-box-content">
              <span class="info-box-text">Vehicle Trip Count</span>
              <span class="info-box-numbertri">{{tottripcount}}</span>

              <div class="progress">
                <div class="progress-bar" style="width: 70%"></div>
              </div>
                  <span class="progress-description">
<!--                     70% Increase in 30 Days -->
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
        </div>
        
        
        <!-- /.col -->
			</br>
	
                    <div class="col-lg-6 col-md-6" hidden>
                        <div class="panel panel-blue">
                            <div class="panel-heading barheading">
                                <div class="row">
                                    <div class="col-xs-3">
                                    <i class="fa fa-building fa-4x"></i>  
                                   </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">{{companycount}}</div>
                                        <div><b>Empanelled Companies Providing VTD</b></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#/CompanyFormUpdate">
                                <div class="panel-footer" >
                                    <span class="pull-left">View Details</span>
                                   <span class="pull-right"><i class="fa fa-arrow-circle-right" id="myBtn"></i></span>
                                    <div class="clearfix" ></div>
                                     
                                         </div>
                                    
                                </div>
                            </a>
                        </div>
                    
                    <div class="col-lg-6 col-md-6" hidden>
                        <div class="panel panel-green">
                            <div class="panel-heading barheading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-4x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><span>{{sumval}}</span></div>
                                        <div><b>Vehicle Tracking Devices</b></div>
                                    </div>
                                </div>
                            </div>
                            <a href="#/DeviceFormUpdate">
                                <div class="panel-footer" >
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right" id="mydeviceBtn1"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-lg-2 col-md-2" hidden>
                        <div class="panel panel-red">
                            <div class="panel-heading barheading" style= "height: 130px;">
                                <div class="row">
                                <a href="" id="comp" title="Complaint" ng-click="complaint();">
                                    <div class="col-xs-12">
                                     <center>
                                     <font color="white";>
                                        <i class="fa fa-pencil-square-o fa-3x"></i>
                                        </font>
                                        </center>
                                         
                                    </div>
                                    <div class="col-xs-10 text-right">
                                       <div class="huge"><span><font color="white";><h4><b>Write To Us</b></h4></font></span></div> 
                                        <div></div>
                                    </div>
                                  </a>
                                </div>
                            </div>
                           
                        </div>
                    </div>
                    
                    
<!--                     <div class="col-lg-2 col-md-4" style="height:800px;"> -->
<!--                     <div class="panel panel-red"> -->
<!--                      <div class="panel-heading barheading"> -->
                    
<!--                     <div class="row" > -->
                    
<%--                     <a href="" id="comp" title="Complaint" ng-click="complaint();"> <center><font color="white";><i class="fa fa-pencil-square-o fa-3x"></font></i><font color="white";>Write To Us</font></center></a> --%>
					
<!-- 					</div> -->
						         
<!--                     </div> -->
<!--                     </div> -->
<!--                     </div> -->
                    
                    
<div class="panel-body" id="comp12" hidden>							
<div>
<div id="comp">

<div id="compDiv">
<table class="table-bordered" border="2" width="80%" cellspacing="0">
<colgroup>	
														<col width="20%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														</colgroup>
<thead style="background: #1a78a5"><tr><td><font color="white">Company Name</font></td>
<td><font color="white">Toll Free NO</font></td>
<td><font color="white">Contact Person</font></td>
<td><font color="white">Write To Us</font></td></tr>
</thead>

<tbody>
<tr ng-repeat="x in contactus">
<td><font>{{x.companyName}}</font></td>
<td><font>{{x.tollFreeNo}}</font></td>
<td><font>{{x.contactperson}}</font></td>
<td><font><button ng-click="getcomplaint(comp);" data-toggle="modal" data-target="#myModal" style="background-color: #e07b53;color: white; width:90px">Complaint</button></font></td>
</tr>
</tbody>
</table>
</div>
<!-- <div style="text-align:center;">	  -->
<%-- <a><img src="<c:url value="/resources/assets/images/PDF-icon.png" />" height="20px" width="20px" ng-click="nonopollindet();"></a> --%>
<!-- </div>  -->
</div>
 </div>
 </div>
                    
<!--                     <div class="col-lg-3 col-md-6"> -->
<!--                         <div class="panel panel-yellow"> -->
<!--                             <div class="panel-heading barheading"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-xs-3"> -->
<!--                                        <i class="fa fa-pencil-square-o fa-4x"></i> -->
<!--                                     </div> -->
<!--                                     <div class="col-xs-9 text-right"> -->
<!-- <!--                                         <div class="huge"></div> --> 
<!--                                        <div><h3>Complaints</h3></div>  -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <a href=""> -->
<!--                                 <div class="panel-footer" data-toggle="modal" data-target="#myModal"> -->
<!--                                     <span class="pull-left">Write To Us</span> -->
<!--                                     <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span> -->
<!--                                     <div class="clearfix"></div> -->
<!--                                 </div> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                    
                    
                  
                    
                    
                    
                    
                    
<!--                     <div class="col-lg-3 col-md-6"> -->
<!--                         <div class="panel panel-red"> -->
<!--                             <div class="panel-heading barheading"> -->
<!--                                 <div class="row"> -->
<!--                                     <div class="col-xs-3"> -->
<!--                                         <i class="fa fa-bus fa-4x"></i> -->
<!--                                     </div> -->
<!--                                     <div class="col-xs-9 text-right"> -->
<!--                                         <div class="huge">13</div> -->
<!--                                         <div>Devices</div> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <a href="#"> -->
<!--                                 <div class="panel-footer"> -->
<!--                                     <span class="pull-left">View Details</span> -->
<!--                                     <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span> -->
<!--                                     <div class="clearfix"></div> -->
<!--                                 </div> -->
<!--                             </a> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>


<div class="col-xs-12">
<div class="row">
<!-- <div class="col-md-12"> -->

<!--  <div class="col-xs-2"  style="background-color:lavender;"><font style="size:20px;"><b>Company Name</b></font> -->
 
<!-- </div> -->
<!--  <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>Running</b></font> -->
<!--     </div> -->
<!--  <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>Stop</b></font> -->
<!--     </div> -->
<!-- <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>Halt</b></font> -->
<!--     </div> -->
    
<!--  <div class="col-xs-2"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>Total Devices</b></font> -->
<!--     </div> -->
    
<!--     <div class="col-xs-2"  style="background-color:#1c9b55;"><font style="size:20px;" color="white";><b>Polling Devices</b></font> -->
<!--    </div> -->
    
<!--     <div class="col-xs-2"  style="background-color:#dc3912;"><font style="size:20px;" color="white";><b>Non Pollling Devices</b></font> -->
<!--    </div> -->
     
<!--      <div class="col-xs-2"  style="background-color:#ff9900;"><font style="size:20px;" color="white";><b>Installed Devices</b></font> -->
<!--     </div> -->
<!--    <div> -->
<!--    &nbsp; -->
<!-- </div> -->
<!--   </div> -->
  	








<div class="col-md-12">

<!--  <div class="col-xs-2" style="background-color:lavender;"><font style="size:20px;"><b>{{x.companyName}}</b></font> -->
 
<!-- </div> -->


<table class="table-bordered" border="0" width="100%" cellspacing="2">
<colgroup>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="15%"> --%>
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														
<thead>													</colgroup>
<tr>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Company Name</center></font></th>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Running</center></font></th> --%>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Stop</center></font></th> --%>
<%-- <th style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><center>Halt</center></font></th> --%>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Total Devices</center></font></th>
<%-- <th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Polling Devices</center></font></th> --%>
<%-- <th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>NonPollling Devices</center></font></th> --%>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Installed Devices</center></font></th>
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Available Devices</center></font></th> 
<th style="background-color:#1a78a5;"><font style="size:20px;" color="white";><center>Vehicles Trip Count</center></font></th> 
</tr>
</thead>
<tbody>
  <tr ng-repeat="x in totaldevicesdet">
    <td style="background-color:white;"><font style="size:20px;"><center>{{ x.companyName }}</center></font></td>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.running}}</b></center></font></td> --%>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.stop}}</b></center></font></td> --%>
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.halt}}</b></center></font></td> --%>
    <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.totalDevices}}</b></center></font></td> 
<%--     <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.pollingDevices}}</b></center></font></td> --%>
<%--      <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.nonPolllingDevices}}</b></center></font></td> --%>
      <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.installedDevices}}</b></center></font></td>
       <td style="background-color:white;"><font style="size:20px;" color="black"><center><b>{{x.availabledevices}}</b></center></font></td>
       <td style="background-color:white;"  ng-click="gettripdetails(x.companyName);"data-toggle="modal" data-target="#mydeviceModal1"><font style="size:20px;" color="black"><center><span class="label label-success"><b>{{x.tripcount}}</b></span></center></font></td>
  </tr>
  <tr>
<th style="background-color:#9dabb5;"><font style="size:20px;" color="black";><center>Total</center></font>
</th>
<td style="background-color:#9dabb5;"><font style="size:20px;" color="black"><center><b>{{totdevices}}</b></center></font></td> 
<%--     <td style="background-color:#9dabb5;"><font style="size:20px;" color="white"><center><b>{{totpolling}}</b></center></font></td> --%>
<%--      <td style="background-color:#9dabb5;"><font style="size:20px;" color="white"><center><b>{{totnonpolling}}</b></center></font></td> --%>
      <td style="background-color:#9dabb5;"><font style="size:20px;" color="black"><center><b>{{totinstalled}}</b></center></font></td>
       <td style="background-color:#9dabb5;"><font style="size:20px;" color="black"><center><b>{{available}}</b></center></font></td>
       <td style="background-color:#9dabb5;"><font style="size:20px;" color="black"><center><b>{{tottripcount}}</b></center></font></td>
</tr>
  
  </tbody>
</table>


<!--  <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>{{x.running}}</b></font> -->
<!--     </div> -->
<!--  <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>{{x.stop}}</b></font> -->
<!--   </div> -->
<!-- <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><font style="size:20px;" color="white";><b>{{x.halt}}</b></font> -->
<!--   </div> -->
  
<!--  <div class="col-xs-1"  style="background-color:rgb(211,173,6);"><div id="circle" style="border-color:#8B7500;"><font style="size:20px;" color="white";><b>{{x.totalDevices}}</b></font> -->
<!--    </div></div> -->
    
<!--     <div class="col-xs-1" style="background-color:#1c9b55;"><div id="circle2" style="border-color:#8B7500;"><font style="size:20px;" color="white";><b>{{x.pollingDevices}}</b></font> -->
<!--    </div></div> -->
    
<!--     <div class="col-xs-2"  style="background-color:#dc3912;"><div id="circle3" style="border-color:#8B7500;"><font style="size:20px;" color="white";><b>{{x.nonPolllingDevices}}</b></font> -->
<!--    </div></div> -->
     
<!--      <div class="col-xs-2"  style="background-color:#ff9900;"><div id="circle4" style="border-color:#8B7500;"><font style="size:20px;" color="white";><b>{{x.installedDevices}}</b></font> -->
<!--     </div></div> -->
<!--    <div> -->
  &nbsp; 
<!-- </div> -->
  </div>
  
</div>
</div>
 <div id="mydeviceModal1" class="modal fade" role="dialog">
 <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
    
     <span class="close" color="white" data-dismiss="modal">×</span>
     <span style="text-align:center;font-size:20px;margin-left:550px"><b>{{compname}}</b></span>
      <h4>Trip Details</h4>
<!--        <div style="text-align:right;"></div> -->
    </div>
   
    <div class="modal-body">
        
        <div class="widget-body">
										<div class="widget-main">												
									<div id="deviceDiv" >	
									<table class=" table-bordered" border="2" width="100%" cellspacing="0" id="printTabledevice">
													<colgroup>
														<col width="5%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="12%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="4%">
														<col width="15%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="4%">

													</colgroup>
													<thead>
														<tr id="gridheader">
														<td style="background-color:#00c0ef" ng-click=sort('srno')"><font  color="white">SR No.</font>	<span class="glyphicon sort-icon" ng-show="sortKey=='srno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click="sort('etpno')" ng-if='roleid!=1003'><font color="white">ETP No</font><span class="glyphicon sort-icon" ng-show="sortKey=='etpno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click="sort('circle')" ng-if='roleid!=1003'><font color="white">Circle</font><span class="glyphicon sort-icon" ng-show="sortKey=='circle'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click=sort('vehicleno')"><font  color="white">Vehicle No.</font>	<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					<!-- 					<td style="background-color:#00c0ef" ng-click="sort('routename')"><font color="white">Route Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='routename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
										<td style="background-color:#00c0ef" ng-click="sort('code')" ng-if='roleid!=1003'><font color="white">Code</font><span class="glyphicon sort-icon" ng-show="sortKey=='code'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										
										<td style="background-color:#00c0ef"  ng-click="sort('source')"><font color="white">Source</font>
										<span class="glyphicon sort-icon" ng-show="sortKey=='source'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										
										<td style="background-color:#00c0ef" ng-click="sort('destination')"><font color="white">Destination</font><span class="glyphicon sort-icon" ng-show="sortKey=='destination'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click="sort('starttime')"><font color="white">Start Time</font><span class="glyphicon sort-icon" ng-show="sortKey=='starttime'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click="sort('passvaliddate')" ng-if='roleid!=1003'><font color="white">PassValid Upto</font><span class="glyphicon sort-icon" ng-show="sortKey=='passvaliddate'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										
										<td style="background-color:#00c0ef" ng-click="sort('minename')" ng-if='roleid!=1003'><font color="white">Mineral Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='minename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										<td style="background-color:#00c0ef" ng-click="sort('quantity')" ng-if='roleid!=1003'><font color="white">Quantity</font><span class="glyphicon sort-icon" ng-show="sortKey=='quantity'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										
<!-- 										<td style="background-color:#00c0ef" ng-click="sort('typeid')" ng-if='roleid!=1003'><font color="white">Trip ID</font><span class="glyphicon sort-icon" ng-show="sortKey=='typeid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
										<td style="background-color:#00c0ef" ng-click="sort('transportername')" ng-if='roleid!=1003'><font color="white">Transporter Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='transportername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
										
										
										
										<td style="background-color:#00c0ef"><font color="white">Map</font></td>

														</tr>
													</thead>

													<tbody>
											<tr ng-show="companynamedt.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
											<tr dir-paginate="cir in companynamenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{cir.rowno}}</font></td>
															<td><font>{{cir.etpno}}</font></td>
															<td><font>{{cir.circle}}</font></td>
															
															<td><font>{{cir.vehicleno}}</font></td>
<!-- 															<td><font>{{cir.routename}}</font></td> -->
															<td><font>{{cir.code}}</font></td>
															
															<td><font>{{cir.source}}</font></td>
															<td><font>{{cir.destination}}</font></td>
															<td><font>{{cir.starttime}}</font></td>
															<td><font>{{cir.passvalid}}</font></td>
															<td><font>{{cir.minename}}</font></td>
															<td><font>{{cir.quantity}}</font></td>
															
<!-- 															<td><font>{{cir.tripid}}</font></td> -->
															<td><font>{{cir.transportername}}</font></td>
															<td><a  ng-click="shomap(cir)" ><img src="<c:url value="/resources/imagenew/historyicon.png" />"
									 					height="20px" width="20px"></a></td>
														
														</tr>
													</tbody>
												</table>
												</div>
												<dir-pagination-controls
													max-size="8"
													direction-links="true"
													boundary-links="true" 
													on-page-change="getDataadmin(newPageNumber)" >
												</dir-pagination-controls>
												</div>
												</div>
<!-- 											</fieldset> -->
												<div style="text-align: right;"><font>Total Records:{{companynamedt.length}}</font></div>	
											
											
											<div class="hr hr8 hr-double"></div>

        
         
    </div>
    <div class="modal-footer">
      <h3></h3>
    </div>
  </div>
</div>
</div>

</div>










</div>


<!-- The Modal -->
<div id="mydeviceModal1" class="modal fade" role="dialog">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
     <span class="close" data-dismiss="modal">×</span>
      <h4>Device Details</h4>
    </div>
    <div class="modal-body">
        
        <div class="widget-body">
<!-- 										<div class="widget-main">												 -->
<!-- 									<div id="deviceDiv" >	 -->
<!-- 									<table class=" table-bordered" border="2" width="100%" cellspacing="0" id="printTabledevice"> -->
<%-- 													<colgroup> --%>
<%-- 														<col width="5%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="12%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="4%"> --%>
<%-- 														<col width="4%"> --%>
<%-- 														<col width="15%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
														

<%-- 													</colgroup> --%>
<!-- 													<thead> -->
<!-- 														<tr id="gridheader"> -->
<!-- 					<td ng-click="sort('rowno')"><font  color="white">Sr.No.</font>	<span class="glyphicon sort-icon" ng-show="sortKey=='uniqueid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td ng-click="sort('deviceid')"><font color="white">Device Id</font><span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					
<!-- 					<td ng-click="sort('uniqueid')"><font color="white">Device Number</font> -->
<!-- 					<span class="glyphicon sort-icon" ng-show="sortKey=='uniqueid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					
<!-- 					<td ng-click="sort('makename')"><font color="white">Make Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='makename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td ng-click="sort('modelname')"><font color="white">Model Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td ng-click="sort('customername')" ng-if='roleid!=1003'><font color="white">Customer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 					<td ng-click="sort('dealername')" ng-if='roleid!=1003'><font color="white">Dealer Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='modelname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->

<!-- 														</tr> -->
<!-- 													</thead> -->

<!-- 													<tbody> -->
<%-- 											<tr ng-show="devicenew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
<!-- 											<tr dir-paginate="dev in devicenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"> -->
<!-- 															<td><font>{{dev.rowno}}</font></td> -->
<!-- 															<td><font>{{dev.deviceid}}</font></td> -->
<!-- 															<td><font>{{dev.uniqueid}}</font></td> -->
<!-- 															<td><font>{{dev.makename}}</font></td> -->
<!-- 															<td><font>{{dev.modelname}}</font></td> -->
<!-- 															<td ng-if='roleid!=1003'><font>{{dev.customername}}</font></td> -->
<!-- 															<td ng-if='roleid!=1003'><font>{{dev.dealername}}</font></td> -->
													
														
<!-- 														</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
<!-- 												</div> -->
<!-- 												<dir-pagination-controls> -->
<!-- 													max-size="8" -->
<!-- 													direction-links="true" -->
<!-- 													boundary-links="true"  -->
<!-- 													on-page-change="getData12(newPageNumber)" > -->
<!-- 												</dir-pagination-controls> -->
<!-- 												</div> -->
<!-- 											</fieldset> -->
												<div style="text-align: right;"><font>Total Records:{{devicenew.length}}</font></div>	
											
											
											<div class="hr hr8 hr-double"></div>

        
         
    </div>
    <div class="modal-footer">
      <h3></h3>
    </div>
  </div>
</div>
</div>


<div class="row">
<div id="solddevice" style="display: none">
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="devi in soldDevicelist"><font color="#212121">{{devi.uniqueid}}</font></li></ul>
 </div>
</div>
	
	
<div id="availableDevice" style="display: none;" >
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="avail in avialDeviceNo"><font color="#212121">{{avail.uniqueid}}</font></li></ul>
 </div>
</div>


<div id="dealercustomer" style="display: none;" >
  <div  style="overflow-x:auto;overflow-y:auto; height:100px; width:210px;">
<ul type="disc">
<li ng-repeat="cust in dealerCustomers"><font color="#212121">{{cust.customername}}</font></li></ul>
 </div>
</div>
	
	</div>
	
		<div class="row">
		<div class="col-md-18">		

<!-- <div class="col-md-6" id="showgraph"> -->
<!-- 				<div class="panel panel-primary"> -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-pie-chart" style="color:white"></i><font color="white">Device Statistics</font></div> -->
<!-- 					<div class="panel-body"> -->
<!--                    <div id="donutchart" style="width: 500px; height: 400px;"></div> -->
<!-- <!-- 				<div><a  href="" ng-click="showtext();"> --> 
<!-- <!-- 					<i title="Show Text" class="fa fa-file-text-o"></i> --> 
<!-- <!-- 				Show Text --> 
<!-- <!-- 				</a></div> --> 

<!-- 				</div> -->
<!-- 				</div> -->
<!-- </div> -->

<!-- <div class="col-md-6" id="customerdet"  hidden > -->
<!-- 				<div class="panel panel-primary" > -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:white"></i>Device Details</div> -->
<!-- 					<div class="panel-body" style="height:500px;overflow: scroll"> -->
					
<!-- 						<table  border="2"	width="100%" cellspacing="0" id="printTable" > -->
<%-- 													<colgroup> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="10%"> --%>
<%-- 													</colgroup> --%>
<!-- 													<thead> -->
<!-- 														<tr id="gridheader"> -->
<!-- 														<th ng-click="sort('dealername')"><font color="white">Dealer Name</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='dealername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 																<th ng-click="sort('customername')"><font color="white">Subdealer</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 															<th ng-click="sort('customername')"><font color="white">Devices sold</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</th> -->
<!-- 														</tr> -->
<!-- 													</thead> -->
<!-- 	<tbody> -->
<!-- 														<tr ng-repeat="del in customerDetailslist"> -->
<!-- 														<td><font>{{del.dealername}}</font></td> -->
<!-- 														<td><font>{{del.customername}}</font> -->
<!-- 														<td><font>{{del.no_devices}}</font> -->
<!-- 													</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
												
<!-- 											<div style="text-align: left;"><a href="" ng-click="showgraph();"> -->
<!-- 											<i title="Show Graph" class="fa fa-pie-chart"></i> -->
<!-- 											show Graph -->
<!-- 											</a></div> -->

<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
			
			<div class="col-md-8" id="showgraph">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-pie-chart" style="color:white"></i><font color="white">CompanyWise Trip Details</font></div>
					<div class="panel-body">
                    <div id="tripveh" style="width: 800px; height: 400px;"></div>
				</div>
				</div>
</div>
</div>  <!-- /.col -->
			
			
			
		
		<div class="col-md-4">
		<div class="panel panel-primary" >
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font color="white">Device Sale Details</font></div>
					<div class="panel-body">
				    <div id="chart_div" style="width: 300px; height: 400px;" ></div>
				    </div>
		</div>
		</div>
			
		
			</div><!--/.row-->
			
			
		
		
		
		
		
		
		
<!-- 		<div class="row"> -->
		
<!-- 		<div class="col-md-18"> -->
		
		
<!-- 		<div class="col-md-6"> -->
<!-- 		<div class="panel panel-primary" > -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font color="white">Dealer Customer Details</font></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 				    <div id="barchart_values" style="width: 800px; height: 500px;"></div> -->
<!-- 				    </div> -->
		
		
<!-- 		</div> -->
<!-- 		</div> -->
		
		
		
		
		
<!-- 		<div class="col-md-6"> -->
<!-- 		<div class="panel panel-primary" > -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-pie-chart" style="color:white"></i><font color="white">Vehicle Statistics</font></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 		            <div id="chart-container1" style="width: 800px; height: 500px;" ></div> -->
<!-- 				    </div> -->
<!-- 		</div> -->
<!-- 		</div> -->
		
<!-- 	    </div> -->
		
<!-- 		</div> -->
		

<!-- <div class="row"> -->
<!-- <div class="col-md-18"> -->
<!-- 		<div class="col-md-12"> -->
<!-- 		<div class="panel panel-primary" > -->
<!-- 					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-bar-chart" style="color:white"></i><font color="white">Company Wise Device Sale Details Statistics</font></div> -->
<!-- 					<div class="panel-body"> -->
<!-- 				    <div id="chart_div" style="width: 500px; height: 400px;" ></div> -->
<!-- 				    </div> -->
<!-- 		</div> -->
<!-- 		</div> -->

<!-- </div> -->
<!-- </div> -->
</div>
</div>
