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
						<li class="active"><a data-toggle="tab" href="#/MenuassignFormUpdate"><font>Menu  Assign</font>
						</a></li>

						<li><a data-toggle="tab" href="#/MenuassignFormInsert"><font>New Entry</font></a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="menurolemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Menu Assigned to Role Details</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
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
											            <td><div style="width:158px;"><font>Search  By SubMenu Name</font></div></td>
											             <td><input class="form-control" id="serachbySubmenu" ng-model="SearchBySubmenu" /></td>
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1=pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
										<div id="menuAssignctrl">
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTablemenuass">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="20%">
														<col width="15%">
														<col width="10%">
														<col width="10%">
														

													</colgroup>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font><span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>

															<td ng-click="sort('menutext')"><font color="white">Main Menu Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='menutext'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('menutext')"><font color="white">Sub Menu Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='menutext'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('rolename')"><font color="white">Role Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='rolename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="menuassigndetnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="menuassign in menuassigndetnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{menuassign.rowno}}</font></td>
															<td><font >{{menuassign.parentname}}</font></td>
															<td><font >{{menuassign.menutext}}</font></td>
															<td><font>{{menuassign.rolename}}</font></td>
													
															
															<td><a type="submit" 
																ng-click="showmenurolediv1();menuroleData(menuassign);" href=""><i
																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td>
															<td>
															<img ng-click="deletemenuassign(menuassign)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"></td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData16(newPageNumber)" >
												</dir-pagination-controls>
												</div>
							<div style="text-align: right;"><font>Total Records:{{menuassigndet.length}}</font></div>
												
<!-- 											</fieldset> -->
											
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
								
<div class="widget-box" id="menuroleedit" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"> <font color="white">Edit Menu Assign</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
	<div>&nbsp;</div>

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="menuassignUpdate">
    <div class="row">
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
        <datalist id="editmenubind">
				<option ng-repeat="x in  menudetails" ng-if="x.flag='true'" value="{{x.menutext}}"></option>
		</datalist>
          <label for="input5" class="col-md-4 control-label"><font color="black">Menu Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editmenuassmenuname" list="editmenubind" value="{{menuroleeditdet.menutext}}" placeholder="Menu Name" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
        <datalist id="editmenurolebind">
				<option ng-repeat="x in  roledetails" ng-if="x.flag='true'" value="{{x.rolename}}"></option>
		</datalist>
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Role Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
        
   		<input class="form-control" id="editmenuassrolename"  list="editmenurolebind" value="{{menuroleeditdet.rolename}}" placeholder="Role Name" type="text"   required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          <div class="col-md-4">
    <button  class="action-button shadow animate green" ng-click="menuroleupdateform();"><font color="black">Update</font></button>
   </div>
     <div class="col-md-4">
   <a  ng-click="back();"><button type="button" class="action-button shadow animate red"><font color="black">Back</font></button></a>		
          </div>
        </div>
      </div>
    </div>
  </form>

	
	</div>
	</div>
</div>

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













