
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
	
<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li ><a data-toggle="tab" href="#/Dealerdashnew">Summary
							</a></li>

						<li><a data-toggle="tab" href="#/DealerdashLiveDetails">Vehicle Live Status
							</a></li>
							
							<li><a data-toggle="tab" href="#/DealerMap"><font>Live Map</font>
						</a></li>
						<li class="active"><a data-toggle="tab" href="#/Nonpolling"><font>Nonpolling</font>
						</a></li>

					</ul>
				</div>
			</div>

	

	</div>	<!--/.main-->
	
<div class="row">

<div class="col-md-12"  id="nonpollingTable" >
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:white"></i>Non Polling Devices
					<div style="text-align: right;margin-top: -10px;"><font>Total Records:{{pollingtotal_count}}</font></div>
<!-- 					</div> -->
<!-- 					<div style="text-align: right;margin-top: -10px;"> -->
			
					</div>
					<div class="panel-body">
					
					
										
								<table class="table table-striped" cellspacing="0">
<colgroup>
														<col width="12%">
														<col width="12%">
														<col width="12%">
														<col width="12%">
													<col width="12%">
													</colgroup>
													<tr>
											            <td><font>Search By IMEINO/DeviceNO</font></td>
											            <td><div style="text-align: right;"><input class="form-control" id="nonpollingsearchbyDeviceid" /></div></td>
											           	<td><font>Show Rows</font></td>
											        	<td>
											        	<select data-ng-init="option2 = pagesno[0]"  data-ng-model="option2" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option2)">
														    </select>
														    </td>
														    </tr>
														    </table>
					
					
					
					<table class=""  border="1px" style=" border-color:black; width:100%;" id="livesumm" >
										<colgroup>
														<col width="9%">
														<col width="12%">
														<col width="12%">
														<col width="12%">
													<col width="12%">
													</colgroup>
										<thead class="thin-border-bottom">
											<tr id="gridheader">
											<td style="word-wrap:break-word" ng-click="sort('Serial No')"><font color="white">Sr.No.</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('deviceid')"><font color="white">Device ID</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('imeino')"><font color="white">IMEI NO</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='imeino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('simnumber')"><font color="white">Sim Number</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='simnumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('customername')"><font color="white">Customer Name</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												</tr>
												</thead>
												<tbody>
												
									<tr  dir-paginate="x in nonPollingDetails|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="pollingtotal_count">
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.rowno}}</font></td>			
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.deviceid}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.uniqueid}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.simnumber}}</font></td>
								<td style="word-wrap:break-word"><font style="font-weight: 800;">{{x.customername}}</font></td>
												
									</tr>
												</tbody>
												
				</table>
<dir-pagination-controls
										max-size="8"
										direction-links="true"
										boundary-links="true" 
										on-page-change="getDatapol(newPageNumber)" >
									</dir-pagination-controls>

</div>
</div>
</div>









<div class="col-md-12"  id="maptrack" hidden>
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel">Map  Track
					<a  href="" ng-click="back();showgraph();" title="Go Back"  style="float:right;">
<img src="<c:url value="/resources/imagenew/back.png" />" height="20px" width="20px">
</a>
					</div>
					<div class="panel-body">
				<center><iframe id="mapframe" height="500px" width="100%"></iframe></center>
						</div>
</div>







</div>
<!-- --row -->
</div>
</div>
</div>


