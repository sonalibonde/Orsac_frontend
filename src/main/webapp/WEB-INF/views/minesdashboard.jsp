<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
									<div style="text-align:left;padding-top: 0px">	<h5 class="widget-title"><font color="white">CircleWise Dashboard</font></h5></div>
											<div class="widget-toolbar no-border"></div>
									</div>

<!-- 									<div class="widget-body"> -->
<!-- 										<div class="widget-main"> -->
<!-- 										<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;">  -->

<!-- 												<div>&nbsp;</div> -->
<!-- <!-- 												<table> --> 
<%-- 													<colgroup>  --%>
<%-- 														<col width="5%">  --%>
<%-- <%-- 														<col width="20%"> --%> 
<%-- <%-- 														<col width="10%"> --%> 
<%-- <%-- 														<col width="10%"> --%> 
<%-- <%-- 														<col width="15%"> --%> 
<%-- <%-- 														<col width="10%"> --%> 
<%-- 													</colgroup>  --%>
<!-- 												<tr> -->
<!-- <!-- 											            <td><font>Search :</font></td>  -->
<!-- <!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td>  -->
<!-- <!-- 											            <td></td>  -->
<!-- <!-- 											            <td></td>  -->
<!-- <!-- 											            <td></td>  -->
<!-- 											        	<td><table><tr><td><font>Show Rows</font></td>  -->
<!-- <!-- 											        	<td></td>  -->
<!-- 											        	<td>  -->
<!-- 											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">   -->
<!-- 													</select></td>  -->
<!--  											        	</tr></table></td>  -->
<!-- 										        </tr>     -->
<!-- 												</table>  -->
<!-- 												<div>&nbsp;</div> -->
												
<!-- 									<div id="uprintlTable">			 -->
<!-- 									<table class="table-bordered" border="2" width="100%" cellspacing="0" id="printTable"> -->
<%-- 													<colgroup> --%>
<%-- 														<col width="10%"> --%>
<%-- 														<col width="25%"> --%>
<%-- 														<col width="20%"> --%>
<%-- <%-- 												    	<col width="15%">  --%> 
<%-- 														</colgroup> --%>
<!-- 													<thead> -->
<!-- 														<tr id="gridheader"> -->
<!-- 															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
<!-- <!-- 															<td ng-click="sort('shelterid')"><font color="white">Shelter Id</font> --> 
<!-- <!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='shelterid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> --> 
<!-- <!-- 															</td> --> 
<!-- 															<td ng-click="sort('sheltername')"><font color="white">Mine Name</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='sheltername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
<!-- 																<td ng-click="sort('sheltercode')"><font color="white">Type</font> -->
<!-- 																<span class="glyphicon sort-icon" ng-show="sortKey=='sheltercode'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span> -->
<!-- 															</td> -->
<!-- <!-- 															<td><font color="white">Edit</font></td> --> 

<!-- 														</tr> -->
<!-- 													</thead> -->

<!-- 													<tbody> -->
<%-- <%-- 													<tr ng-show="shelterdetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%> 
<!-- 													<tr dir-paginate="x in shelterdetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count"> -->
<!-- <!--  														<tr ng-repeat="x in shelterdetails">  --> 
<!-- 														<td><font>{{x.rowno}}</font></td> -->
<!-- 														<td><font>{{x.sheltername}}</font></td> -->
<!-- 														<td><font>{{x.sheltercode}}</font></td>  -->
                                                         
															
<!-- 													</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
<!-- 												<dir-pagination-controls  -->
<!-- 													max-size="8"  -->
<!-- 													direction-links="true"  -->
<!--  													boundary-links="true"   -->
<!-- 													on-page-change="getDatamine(newPageNumber)" > </dir-pagination-controls>  -->
<!-- 												</div> -->
												
<!-- 													<div style="text-align: right;"><font>Total Records:{{total_count}}</font></div> -->
<!-- 											</fieldset>  -->

<!-- 										</div> -->
<!-- 										/.widget-main -->
<!-- 									</div> -->
<!-- 									/.widget-body -->

<br>

        
        <div class="ui-widget" ng-repeat="x in circlenew">
		  <h1 class="ui-value">{{x.count}}</h1>
		  <span class="ui-label"><a href=""  ng-click="getcirclename(x.circlename);" data-toggle="modal" data-target="#mydeviceModal1" class="small-box-footer">{{x.circlename}}<i class="fa fa-arrow-circle-right"></i></a></span>
		</div>
        
        <!-- The Modal -->
        
        <div id="mydeviceModal1" class="modal fade" role="dialog">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
     <span class="close" data-dismiss="modal">×</span>
      <h4>Circle Details</h4>
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
					
<!-- 					<td style="background-color:#00c0ef" ng-click="sort('typeid')" ng-if='roleid!=1003'><font color="white">Trip ID</font><span class="glyphicon sort-icon" ng-show="sortKey=='typeid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
					<td style="background-color:#00c0ef" ng-click="sort('transportername')" ng-if='roleid!=1003'><font color="white">Transporter Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='transportername'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
					
					
					
					<td style="background-color:#00c0ef"><font color="white">Map</font></td>

														</tr>
													</thead>

													<tbody>
											<tr ng-show="circlenamedt.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
											<tr dir-paginate="cir in circlenamenew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
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
															
															
															
															<td><a ng-click="shomap(cir)" ><img src="<c:url value="/resources/imagenew/historyicon.png" />"
									 					height="20px" width="20px"></a></td>
														
														</tr>
													</tbody>
												</table>
												</div>
												<dir-pagination-controls
													max-size="8"
													direction-links="true"
													boundary-links="true" 
													on-page-change="getDatamine(newPageNumber)" >
												</dir-pagination-controls>
												</div>
<!-- 											</fieldset> -->
												<div style="text-align: right;"><font>Total Records:{{circlenamedt.length}}</font></div>	
											
											
											<div class="hr hr8 hr-double"></div>

        
         
    </div>
    <div class="modal-footer">
      <h3></h3>
    </div>
  </div>
</div>
</div>

        

        

								</div>
								<!-- /.widget-box -->
								
								

</div>


<!-- for pdf -->

							













		</div>
							<!-- 											end of bar				 -->

						</div>





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







