<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="row" id="main">

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

						<div id="tasktab" class="tab-pane active">

							<div class="col-sm-12">
							
								<div class="widget-box" id="maincom">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
									<div style="text-align:left;padding-top: 0px">	<h5 class="widget-title"><font color="black">Live Status</font></h5></div>
											<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
										<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> 

												<div>&nbsp;</div>
												
												
												
												<table> 
												<colgroup>
														<col width="7%">
														<col width="15%">
														<col width="15%">
 												    	<col width="05%">  
 												    	<col width="5%">
 												    	
														</colgroup>
											
												<tr>
 											            <td><font>Search :</font></td> 
 											            <td><input class="form-control" ng-model="query[queryBy]"/></td> 
 											            <td><div></div></td>
										            <td></td> 
											            <td><div></div></td> 
											        	<td><table><tr><td><font>Show Rows</font></td> 
 									        	<td> 
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">  
													</select></td> 
 											        	</tr></table></td> 
 											        	
 											      <td style="text-align:right;margin-right:10px;"><a href=""><img height="30px";width="30px"; title="Export To Excel" id="Summaryexcel" src="<c:url value="/resources/imagenew/icon.png" />"></a></td>
										        </tr>    
												</table> 
												<div>&nbsp;</div>
												
									<div id="uprintlTable">			
									<table class="table-bordered" border="2" width="100%" cellspacing="0" id="printTable">
													<colgroup>
														<col width="10%">
														<col width="15%">
														<col width="15%">
 												    	<col width="15%">  
 												    	<col width="15%">
 												    	<col width="15%">
 												    	<col width="15%">
														</colgroup>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>															
															<td ng-click="sort('customername')"><font color="white">Customer Name</font> 
 																<span class="glyphicon sort-icon" ng-show="sortKey=='customername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> 
															</td> 
															<td ng-click="sort('vehicleno')"><font color="white">Vehicle No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='vehicleno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
																<td ng-click="sort('deviceno')"><font color="white">Device No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='deviceno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('pollingtime')"><font color="white">Polling Time</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='pollingtime'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('speed')"><font color="white">Speed</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='speed'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('location')"><font color="white">Location</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='location'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
<!-- 															<td ng-click="sort('sheltercode')"><font color="white">Device No</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='sheltercode'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
<!-- 															<td><font color="white">Edit</font></td> -->
																<td class="hidden-410"><font color="White">Track On Map</font>
														</tr>
													</thead>

													<tbody>
<%-- 													<tr ng-show="shelterdetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
													<tr dir-paginate="x in users|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
<!--  														<tr ng-repeat="x in shelterdetails">  -->
														<td><font>{{x.rowno}}</font></td>
														<td><font>{{x.customername}}</font></td>
														<td><font>{{x.vehicleid}}</font></td> 
                                                        <td><font>{{x.imeino}}</font></td>
														<td><font>{{x.datatimestamp}}</font></td> 
														<td><font>{{x.vehiclespeed}}</font></td>
														<td><font>{{x.location}}</font></td> 	
														<td><a href=""  type="submit" id="showmap"  ng-click="showmapdiv1(x);"><img src="<c:url value="/resources/imagenew/map.png" />"
									 height="20px" width="20px"></a></td>
													</tr>
													</tbody>
												</table>
												<dir-pagination-controls 
													max-size="8" 
													direction-links="true" 
 													boundary-links="true"  
													on-page-change="getDatalived(newPageNumber)" > </dir-pagination-controls> 
												</div>
												
													<div style="text-align: right;"><font>Total Records:{{total_count}}</font></div>
											</fieldset> 

										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
								

</div>


<!-- for pdf -->

							













		</div>
							<!-- 											end of bar				 -->

						





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





