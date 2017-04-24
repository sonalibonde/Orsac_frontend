
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<div class="row">

<div class="col-md-12"  id="main">
				<div class="panel panel-primary">
					<div class="panel-heading dark-overlay" id="dealerlabel"><i class="fa fa-list-alt" style="color:white"></i>Vehicle Summary</div>
					<div class="panel-body">
								<table class="table table-striped" cellspacing="0">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td><font>Overspeed Limit</font></td>
											            <td> <select id="livevehiclesumspeedlimit"   class="form-control" ng-model="limit">
     														 <option value="20" >20</option>
     														 <option value="25" >25</option>
     														 <option value="30">30</option>
     														 <option value="35" >35</option>
     														 <option value="40" >40</option>
     		 												 <option value="45">45</option>
     														 <option value="50" selected>50</option>
     		 												 <option value="55">55</option>
     		 												 <option value="60" >60</option>
     		 												 <option value="65" >65</option>
     		 												 <option value="70">70</option>
     														 <option value="75" >75</option>
     													    <option value="80" >80</option>
   															 </select>  
   														</td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														    </td>
														     <td>&nbsp;</td>
									<td style="text-align:right;margin-right:0;"><a href=""><img title="Export To Excel" id="Summaryexcel" src="<c:url value="/resources/imagenew/icon.png" />"></a></td>
									<td>&nbsp;</td>
									<td style="text-align:right;margin-right:0;"><a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a></td>
											        	</tr></table></td>
											        </tr>   
												</table>
									<table class=""  border="1px" style=" border-color:black; table-layout:fixed; width:100%;" id="livesumm">
									<colgroup>
														<col width="5%">
														<col width="9%">
														<col width="9%">
														<col width="6%">
														<col width="9%">
														<col width="9%">
														<col width="9%">
														<col width="9%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
													</colgroup>
										<thead class="thin-border-bottom">
											<tr id="gridheader">
												<td style="word-wrap:break-word" ng-click="sort('Serial No')"><font color="#1E0833">Sr.No.</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='Serial No'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('vehicletype')"><font color="#1E0833">Type</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicletype'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('vehicleid')"><font color="#1E0833">Vehicle No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word" ng-click="sort('imeino')"><font color="#1E0833">IMEI No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='imeino'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('deviceid')"><font color="#1E0833">Device No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='deviceid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td  style="word-wrap:break-word" ng-click="sort('mobileno')"><font color="#1E0833">Mobile No</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='mobileno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												<td style="word-wrap:break-word"  ng-click="sort('customername')"><font color="#1E0833">Customer Name</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
												
												<td style="word-wrap:break-word"  ng-click="sort('location')"><font
													color="#1E0833">Location</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
												<td style="word-wrap:break-word" class="hidden-480" ng-click="sort('datatimestamp')"><font color="#1E0833">Polling Time</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='datatimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
												</td>
													
												<td style="word-wrap:break-word"  ng-click="sort('vehiclespeed')"><font
													color="#1E0833">Speed (KM/Hr)</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclespeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td style="word-wrap:break-word"  ng-click="sort('vehiclestatus')"><font
													color="#1E0833">Status</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehiclestatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													
													<td style="word-wrap:break-word"  ng-click="sort('ignumber')"><font
													color="#1E0833">Ignition</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='ignumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td style="word-wrap:break-word" ng-click="sort('vehicledirection')"><font
													color="#1E0833">Direction</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='vehicledirection'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td ng-click="sort('gpsstatus')"><font
													color="#1E0833">GPS Valid</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='gpsstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													
													<td style="word-wrap:break-word"  ng-click="sort('temperstatus')"><font
													color="#1E0833">Tamper</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='temperstatus'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													
													<td style="word-wrap:break-word" ng-click="sort('ac')"><font
													color="#1E0833">Ac</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='ac'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													
													<td style="word-wrap:break-word" ng-click="sort('overspeedstaus')"><font
													color="#1E0833">Overpeed</font>
													<span class="glyphicon sort-icon" ng-show="sortKey=='overspeed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
													</td>
													<td style="word-wrap:break-word"><font color="#1E0833">On Map</font>
												</td>
												
											</tr>
										</thead>

										<tbody>
											<tr ng-show="users.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
											<tr dir-paginate="user in users|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
												<td style="word-wrap:break-word"><font>{{user.rowno}}</font></td>
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehicletype}}"/> "height="19" width="19"></font></td>
												<td style="word-wrap:break-word"><font>{{user.vehicleid}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.imeino}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.deviceid}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.mobileno}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.customername}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.location}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.datatimestamp}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.vehiclespeed}}</font></td>
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehiclestatus}}"/> "height="19" width="19"></font></td>
												
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.ignumber}}"/> "height="19" width="19"></font></td>
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.vehicledirection}}"/> "height="19" width="19"></font></td>
												<td style="word-wrap:break-word"><font><img src="<c:url value="{{user.gpsstatus}}"/> "height="19" width="19"></font></td>
												<td style="word-wrap:break-word"><font>{{user.temperstatus}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.ac}}</font></td>
												<td style="word-wrap:break-word"><font>{{user.overspeed}}</font></td>
												<td style="word-wrap:break-word"><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(user);graphhide();"><img src="<c:url value="/resources/imagenew/map.png" />"
												 height="20px" width="20px"></a></td>
											</tr>
										</tbody>
									</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData43(newPageNumber)" >
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



