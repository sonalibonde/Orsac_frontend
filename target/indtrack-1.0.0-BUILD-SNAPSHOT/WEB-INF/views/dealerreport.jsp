<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	

<div >
<!-- 				<button class="action-button shadow animate green"  ng-click="getAllMap();"><font color="black">View on Map</font></button> -->
				<table class="table table-striped" 	width="100%" cellspacing="2" >
													<colgroup>
														<col width="8%">
														<col width="20%">
														<col width="30%">
														<col width="10%">
														<col width="5%">
														<col width="5%">
														<col width="5%">
													</colgroup>
													<tr>
											            <td><font>Search :</font></td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											        	<td><font>Show Rows</font></td>
											        	
											        	<td><select data-ng-init="option1=pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select>
														</td>
											        	
<%-- 											        	<td style="text-align:right;margin-right:0;"><img title="Track on Map" ng-click="getAllMap();" src="<c:url value="/resources/imagenew/historyicon.png" />"></td> --%>
											        	<td style="text-align:right;margin-right:0;"><img title="Export To Excel" id="overspeedexcel" src="<c:url value="/resources/imagenew/icon.png" />"></td>
											        </tr>   
												</table>				          
                								<table   class=" table-bordered" border="2"  width="100%" cellspacing="0" id="overspeedtable" >
													<colgroup>
														<col width="30%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														
													</colgroup>
						
													<thead>
														<tr id="gridheader">
															<th><font color="white">Company</font></th>
															<th><font color="white">Dealer</font></th>
														    <th><font color="white">Total Devices</font></th>
														    <th><font color="white">Installed</font></th>
															<th><font color="white">Polling</font></th>
															<th><font color="white">Not Polling</font></th>
														</tr>
													</thead>

													<tbody>
														<tr ng-show="overspeeddetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr>
														<tr dir-paginate="veh in overspeeddetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{veh.company}}</font></td>
															<td><font>{{veh.dealer}}</font></td>
															<td><font>{{veh.total}}</font></td>
															<td><font>{{veh.installed}}</font></td>
															<td><font>{{veh.polling}}</font></td>
															<td><font>{{veh.notpolling}}</font></td>
													
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getDatadealer(newPageNumber)" >
												</dir-pagination-controls>
							</div>		
				
			
</div>		
	
	










