<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">

<div class="row">

	<div class="col-xs-12">

		<div class="widget-box transparent" id="recent-box">
			<!-- 			<div class="widget-header"> -->
			<!-- 				<h4 class="widget-title lighter smaller"> -->
			<!-- <!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
			<!-- 				</h4> -->

			<!-- 				<div class="widget-toolbar no-border"> -->
			<!-- 					<ul class="nav nav-tabs" id="recent-tab"> -->
			<!-- 						<li class="active"><a data-toggle="tab" href="#/CompanyFormUpdate"><font>Company -->
			<!-- 								Creation</font></a></li> -->

			<!-- 						<li><a data-toggle="tab" href="#/CompanyFormInsert"><font>New Entry</font> -->
			<!-- 							</a></li> -->

			<!-- 					</ul> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 		comapnay creation											 -->

						<div id="task-tab" class="tab-pane active">
							<div class="col-sm-12">

								<div class="widget-box" id="maincom">
									<div
										class="widget-header widget-header-flat widget-header-small"
										id="dealerlabel">
										<div style="text-align: left; padding-top: 0px">
											<h5 class="widget-title">
												<font color="white">CircleWise Dashboard</font>
											</h5>
										</div>
										<div class="widget-toolbar no-border"></div>
									</div>
									
									
									
<!-- 										<div class="container"> -->
											<div class="row">
											<div class="col-sm-6"><div id="chart-container"></div>
											</div> 
											<div class="col-sm-6"><div id="tonnage"></div>
												</div>
											</div>
											<div class="row">
											<div class="col-sm-12">
													<table class="table table-striped"
															width="100%" cellspacing="0">
															<colgroup>
																<col width="5%">
																<col width="20%">
																<col width="10%">
																<col width="10%">
																<col width="15%">
																<col width="10%">
															</colgroup>
															<tr>
													            <td><div style="width:150px;"><font>Search</font></div></td>
													            <td><input class="form-control"  ng-model="query" /></td>
		<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
													            <td></td>
													            <td></td>
													            <td></td>
													              
													        	<td>
													        	<table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
													        	<td></td>
													        	<td><select data-ng-init="option1 = pagesno[0]" data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
																    </select></td>
													        	</tr></table>
													        	
																   </td>
													        </tr>   
														</table>
												</div>
											<div id="PricingTab">
											<div class="col-sm-12">
												<table class="table table-condensed table-hover">
													<thead>
														<tr>
															<th style="background-color: #00c0ef"
																ng-click="sort('srno')"><font color="white">SR
																	No.</font> <span class="glyphicon sort-icon"
																ng-show="sortKey=='srno'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('etpno')" ng-if='roleid!=1003'><font
																color="white">ETP No</font><span
																class="glyphicon sort-icon" ng-show="sortKey=='etpno'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('circle')" ng-if='roleid!=1003'><font
																color="white">Circle</font><span
																class="glyphicon sort-icon" ng-show="sortKey=='circle'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('vehicleno')"><font color="white">Vehicle
																	No.</font> <span class="glyphicon sort-icon"
																ng-show="sortKey=='vehicleno'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<!-- 					<th style="background-color:#00c0ef" ng-click="sort('routename')"><font color="white">Route Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='routename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th> -->
															<th style="background-color: #00c0ef"
																ng-click="sort('code')" ng-if='roleid!=1003'><font
																color="white">Code</font><span
																class="glyphicon sort-icon" ng-show="sortKey=='code'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>

															<th style="background-color: #00c0ef"
																ng-click="sort('source')"><font color="white">Source</font>
																<span class="glyphicon sort-icon"
																ng-show="sortKey=='source'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>

															<th style="background-color: #00c0ef"
																ng-click="sort('destination')"><font color="white">Destination</font><span
																class="glyphicon sort-icon"
																ng-show="sortKey=='destination'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('starttime')"><font color="white">Start
																	Time</font><span class="glyphicon sort-icon"
																ng-show="sortKey=='starttime'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('passvaliddate')" ng-if='roleid!=1003'><font
																color="white">PassValid Upto</font><span
																class="glyphicon sort-icon"
																ng-show="sortKey=='passvaliddate'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>

															<th style="background-color: #00c0ef"
																ng-click="sort('minename')" ng-if='roleid!=1003'><font
																color="white">Mineral Name</font><span
																class="glyphicon sort-icon"
																ng-show="sortKey=='minename'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th style="background-color: #00c0ef"
																ng-click="sort('quantity')" ng-if='roleid!=1003'><font
																color="white">Quantity</font><span
																class="glyphicon sort-icon"
																ng-show="sortKey=='quantity'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>

															<!-- 					<th style="background-color:#00c0ef" ng-click="sort('typeid')" ng-if='roleid!=1003'><font color="white">Trip ID</font><span class="glyphicon sort-icon" ng-show="sortKey=='typeid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th> -->
															<th style="background-color: #00c0ef"
																ng-click="sort('transportername')" ng-if='roleid!=1003'><font
																color="white">Transporter Name</font><span
																class="glyphicon sort-icon"
																ng-show="sortKey=='transportername'"
																ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>



															<th style="background-color: #00c0ef"><font
																color="white">Map</font></th>
														</tr>
													</thead>
													<tbody>


														<tr ng-show="circlenamedt.length <= 0">
															<td colspan="50" style="text-align: center;">No Data Found</td>
														</tr>
														<tr
															dir-paginate="cir in circlenamenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse"
															total-items="total_count">
															<td class="tabco1"><font>{{cir.rowno}}</font></td>
															<td class="tabco2"><font>{{cir.etpno}}</font></td>
															<td class="tabco3"><font>{{cir.circle}}</font></td>

															<td class="tabco4"><font>{{cir.vehicleno}}</font></td>
															<!-- 															<td><font>{{cir.routename}}</font></td> -->
															<td class="tabco2"><font>{{cir.code}}</font></td>

															<td class="tabco3"><font>{{cir.source}}</font></td>
															<td class="tabco4"><font>{{cir.destination}}</font></td>
															<td class="tabco2"><font>{{cir.starttime}}</font></td>
															<td class="tabco3"><font>{{cir.passvalid}}</font></td>
															<td class="tabco4"><font>{{cir.minename}}</font></td>
															<td class="tabco2"><font>{{cir.quantity}}</font></td>

															<!-- 															<td><font>{{cir.tripid}}</font></td> -->
															<td class="tabco3"><font>{{cir.transportername}}</font></td>



															<td class="tabco4"><a ng-click="shomap(cir)"><img
																	src="<c:url value="/resources/imagenew/historyicon.png" />"
																	height="20px" width="20px"></a></td>

														</tr>


													</tbody>
												</table>

												<dir-pagination-controls max-size="8" direction-links="true"
													boundary-links="true"
													on-page-change="getDataminedash(newPageNumber)">
												</dir-pagination-controls>
											</div>
											<!--container-->
										</div>
										
								
										<!--PricingTab-->
</div>
									</div>
									<!--row-->
									<!-- for pdf -->















								
								<!-- 											end of bar				 -->

							</div>

</div></div>



							<!-- 	vehicle creation	 -->




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







