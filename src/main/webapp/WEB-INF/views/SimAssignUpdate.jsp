<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
						<li class="active"><a data-toggle="tab" href="#/SimAssignFormUpdate"><font>Sim Assign</font>
						</a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/SimAssignFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="simassignmain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">SIMs Assigned to Devices Details</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
<!-- 												<legend -->
<!-- 													style="padding: 0 10px; border-bottom: none; width: inherit;">Device Creation -->
<!-- 													</legend> -->
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
											            <td><div style="width:150px;"><font>Search By Device No.</font></div></td>
											            <td><input class="form-control"  id="searchsimassbyDeviceno"  ng-model="ByDeviceNo"/></td>
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]" data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												&nbsp; &nbsp;
												<div id="simDiv">
												<table class=" table-bordered"  border="2"
													width="100%" cellspacing="0" id="printTablesimass">
													<colgroup>
														<col width="5%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
														<col width="10%">
													</colgroup>
													<thead>
														<tr id="gridheader">
												<td ng-click="sort('rowno')"><font color="white">Sr.No.</font><span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
														
															<td ng-click="sort('uniqueid')"><font color="white">Device Number</font><span class="glyphicon sort-icon" ng-show="sortKey=='uniqueid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('mobileno')"><font color="white">SIM Number</font><span class="glyphicon sort-icon" ng-show="sortKey=='simnumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('remarks')"><font color="white">Status</font><span class="glyphicon sort-icon" ng-show="sortKey=='mobileno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
<!-- 															<td ng-click="sort('remarks')"><font color="#1E0833">SimAssign Status</font><span class="glyphicon sort-icon" ng-show="sortKey=='mobileno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
<!-- 															<td ng-click="sort('remarks')"><font color="#1E0833">Activate</font><span class="glyphicon sort-icon" ng-show="sortKey=='mobileno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
															
															<td ><font color="white">Edit</font></td>
															<td ><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="simassignnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="assign in simassignnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{assign.rowno}}</font></td>
															<td><font>{{assign.uniqueid}}</font></td>
															<td><font>{{assign.mobileno}}</font></td>
															<td><button  style="background-color: green;color: white; width:100%;"><font>Assigned</font></button></td>
<!-- 															<td><font>{{assign.simassign_status}}</font></td> -->
<!-- 															<td><font><a ng-click="activateSimassign(assign);">Activate</a></font></td> -->
<!-- 															<td></td> -->
																<td ><a ng-if="assign.flag=='true'" type="submit"  href=""
																   ng-click="showsimdevicediv1();simData(assign);"><i
																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td>
															<td > <img ng-if="assign.flag=='true'"   ng-click="deletesimassign(assign)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"></td>
														</tr>
													</tbody>
												</table>
												
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData23(newPageNumber)">
													</dir-pagination-controls>
													</div>
<!-- 											</fieldset> -->
											<div style="text-align: right;"><font>Total Records:{{simassign.length}}</font></div>	
											<div class="hr hr8 hr-double"></div>
	<div style="text-align:center;">	
		<a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
		<a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a>
										
										
										<a href="" title="Export To Excel" id="exportexcel" ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a>
										</div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
	<div class="widget-box" id="simassignedit" hidden>
<div class="widget-header widget-header-flat widget-header-small"  id="dealerlabel">
<h5 class="widget-title"><font color="white">Edit Sim Assign</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="simassignedit">
    <div class="row">
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Device Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         <datalist id="devicenamebind">
				<option ng-repeat="x in devicedetails" ng-if="x.statussim!='Sim Assigned'" value="{{x.uniqueid}}"></option>
		</datalist>
   <input class="form-control" id="devicename"  value="{{editsim.uniqueid}}" placeholder="Sim Assign" type="text"  list="devicenamebind" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Sim Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
     	<datalist id="simnamebind">
			<option ng-repeat="x in simdetails" ng-if="x.status!='Assigned'" value="{{x.simnumber}}"></option>
		</datalist>
            <input class="form-control" id="simname" value="{{editsim.simnumber}}"  list="simnamebind" placeholder="Sim Name" type="text" required>
          </div>
        </div>
      </div>
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
         <input class="form-control"  id="remarkname" value="{{editsim.remarks}}" placeholder="Remark" type="text">
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button   class="action-button shadow animate green"  ng-click="simassignupdate();"><font color="black">Update</font></button>
          </div>
          <div class="col-md-4 ">
          <a  ng-click="back();"><button class="action-button shadow animate red" type="button"><font color="black">Back</font></button></a>		
          </div>
        </div>
      </div>
    </div><!-- /.row this actually does not appear to be needed with the form-horizontal -->
  </form>


<!-- </fieldset> -->
	
	</div>
	</div>
</div>

</div>
								
								
								
								
								
							</div>
							<!-- 											end of bar				 -->


						</div>


	
						
											<div class="hr hr8 hr-double"></div>

											<!-- 													<div class="clearfix"> -->
											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i></i> -->
											<!-- 																&nbsp;Running Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,255</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Stop Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">941</h4> -->
											<!-- 														</div> -->

											<!-- 														<div class="grid3"> -->
											<!-- 															<span class="grey"> -->
											<!-- 																<i class=""></i> -->
											<!-- 																&nbsp;Total Vehicles -->
											<!-- 															</span> -->
											<!-- 															<h4 class="bigger pull-right">1,050</h4> -->
											<!-- 														</div> -->
											<!-- 													</div> -->
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
	
	
	
	
	</div>
	<!-- /.col -->



</div>








