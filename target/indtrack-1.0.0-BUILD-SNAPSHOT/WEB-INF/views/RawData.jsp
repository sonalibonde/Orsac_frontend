<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="mainasset">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Raw Data</font>
										</h5>
										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

												<table class="table table-striped"
													width="100%" cellspacing="0"  id="rawdatatable">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="15%">
														<col width="10%">
													</colgroup>
													<tr>
													
<!-- 													 <td><div class="form-group col-xs-4 col-md-2"></td> -->
<!--         <label for="name" class="control-label"><font>Date:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--        <input type="text" class="form-control datepick" id="datesummaryreport" required/> -->
<!--                                        </div> -->
                                                   
                                                   
                                                    <td>Date</td>
											            <td><input type="text" class="form-control datepick" id="datesummaryreport" required/></td>
											            
											            <td></td>
                                                  


											            <td>Search :</td>
											            <td><input class="form-control" ng-model="imeis" /></td>
											            <td> <button type="submit"  class="action-button shadow animate green" ng-click="getRawdata(imeis);"><font color="black">Show</font></button></td>
											            <td></td>
											            <td></td>
											            <td>
											        	<a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									                       height="20px" width="20px"></a>
									                     </td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        	
											        </tr>   
												</table>
										<table class="table"  border="1px" style=" border-color:black;  " id="rawdatatbl" hidden width="100%">
<%-- 									<colgroup> --%>
<%-- 													<col width="20%" style="max-width: 200px;word-wrap: break-word;"> --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="20%"> --%>
<%-- 														<col width="20%"> --%>
<%-- 													</colgroup> --%>
										<thead class="thin-border-bottom">
											<tr id="gridheader">

															<td ng-click="sort('datamessage')"><font color="#1E0833">Device Log</font><span class="glyphicon sort-icon" ng-show="sortKey=='assetname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('datatimestamp')"><font color="#1E0833">Device Polling Time</font><span class="glyphicon sort-icon" ng-show="sortKey=='datetimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('clientfqdn')"><font color="#1E0833">Device IP</font><span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('clientport')"><font color="#1E0833">Device Port</font><span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
															

														</tr>
										</thead>

										<tbody>
											<tr ng-show="rawdatadetails.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
											<tr dir-paginate="raw in rawdatadetails|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td style="max-width: 400px;word-wrap: break-word;">{{raw.datamessage}}</td>
															<td>{{raw.datatimestamp}}</td>
															<td>{{raw.clientfqdn}}</td>
															<td>{{raw.clientport}}</td>
											</tr>
										</tbody>
									</table>
												
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData42(newPageNumber)" >
												</dir-pagination-controls>
											
											<div class="hr hr8 hr-double"></div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->


</div>
								
								
								
								
								
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
	
	
	
	
	</div>
	<!-- /.col -->













