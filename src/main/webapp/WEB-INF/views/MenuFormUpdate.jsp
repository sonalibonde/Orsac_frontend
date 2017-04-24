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
						<li class="active"><a data-toggle="tab" href="#/MenuFormUpdate"><font>Menu
								Creation</font></a></li>

						<li><a data-toggle="tab" href="#/MenuFormInsert"><font>New Entry</font>
							</a></li>

					</ul>
				</div>
			</div>


			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 		comapnay creation											 -->

						<div id="task-tab" class="tab-pane active">

							<div class="col-sm-12">
							
								<div class="widget-box" id="mainmenu">
									<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Menus Detail</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

												<div>&nbsp;</div>
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
											            <td><div style="width:150px;"><font>Search By Menu Name</font></div></td>
											            <td><input class="form-control" id="searchbymenuname" ng-model="SearchByMenuname" /></td>
<!-- 											            <td><input class="form-control" ng-model="query[queryBy]" /></td> -->
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><div style="width:100px;"><font>Show Rows</font></div></td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<div id="menuDiv">
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="menutable">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="20%">
														<col width="30%">
														<col width="10%">
														<col width="10%">
														<col width="10%">

													</colgroup>
													<thead>
														<tr id="gridheader">
<td ng-click="sort('menutext')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='menutext'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('parentname')"><font color="white">Parent Menu</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='parentname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('menutext')"><font color="white">Menu Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='menutext'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('navigateurl')"><font color="white">Navigate URL</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='navigateurl'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															
															<td ng-click="sort('orderno')"><font color="white">Order No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='orderno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="menusdetailsnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="menu in menusdetailsnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" ng-if="menu.parentid!='11'" total-items="total_count">
															<td><font>{{menu.rowno}}</font></td>
															<td><font>{{menu.parentname}}</font></td>
															<td><font>{{menu.menutext}}</font></td>
															
															<td><font>{{menu.navigateurl}}</font></td>
														
															<td ><font>{{menu.orderno}}</font></td>
															<td><a type="submit" ng-click="showmenudiv1();menuData(menu);" href="">
															<i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
															</a></td>
															<td>
															<a href="">
															<img ng-click="deletemenu(menu)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
															</a>
															</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="8"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData15(newPageNumber)" >
													</dir-pagination-controls>
													</div>
															<div style="text-align: right;"><font>Total Records:{{menusdetails.length}}</font></div>
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
								
								
<div class="widget-box" id="showeditmenu" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title">	<font color="white"> Edit Menu</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="menuupdateform">
    <div class="row">
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Menu Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="updatemenuname"  value="{{menueditdet.menutext}}" placeholder="Menu Name" type="text" required>
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label  class="col-md-4 control-label"><font color="black">Navigate URL:</font></label>
          <div class="col-md-8">
            <input class="form-control " id="updatenavigateurl" value="{{menueditdet.navigateurl}}" placeholder="Navigate URL" type="text" >
<!--          <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
         
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Parent Menu:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="updatemenuparentbind">
				<option ng-repeat="x in  menusdetails" ng-if="x.parentid=='11'" value="{{x.menutext}}"></option>
		  </datalist>
            <input class="form-control " id="updateparentmenu" list="updatemenuparentbind" value="{{menueditdet.parentname}}" placeholder="Parent Menu" type="text">
          
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          </div>
        </div>
      </div>
      
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Menu Description:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="updatedescription"  value="{{menueditdet.description}}" placeholder="Menu Description" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>
      
      
      <div class="col-sm-4 col-lg-6">
        <div class="form-group ">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Order No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="updateorderno"  value="{{menueditdet.orderno}}" placeholder="Order No" type="text">
<!--           <span class="clearer glyphicon glyphicon-remove form-control-feedback"></span> -->
          
          </div>
        </div>
      </div>

<div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
         <div class="col-md-4 ">
          <button type="submit"  class="action-button shadow animate green" ng-click="menueditform();"><font color="black">Update</font></button>				
    	</div> 
 <div class="col-md-4">  
        <a  ng-click="back()" ><button type="button" class="action-button shadow animate red" ><font color="black">Back</font></button></a>				
          
          </div>
        </div>
      </div>



	</div>
</form>

<!-- </fieldset> -->
	
	</div>
	</div>
</div>

</div>


		</div>
							<!-- 											end of bar				 -->

						</div>





						<!-- 	vehicle creation	 -->


							
						
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
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	</div>
	<!-- /.col -->



</div>







