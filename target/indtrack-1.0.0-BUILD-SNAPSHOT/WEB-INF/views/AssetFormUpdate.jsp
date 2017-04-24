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
						<li class="active"><a data-toggle="tab" href="#/AssetFormUpdate">Asset Creation
						</a></li>

						<li><a data-toggle="tab" href="#/AssetFormInsert">New Entry</a></li>
						

					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">
	
							<div class="col-sm-12">
								<div class="widget-box" id="mainasset">
									<div
										class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64);">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">Asset</font>
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
											            <td>Search :</td>
											            <td><input class="form-control" ng-model="query[queryBy]" /></td>
											            <td></td>
											            <td></td>
											            <td></td>
											        	<td><table><tr><td>Show Rows</td>
											        	<td></td>
											        	<td><select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														    </select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
										
												<table class="table table-striped table-bordered"
													width="100%" cellspacing="0" id="userTable">
													<colgroup>
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="20%">

													</colgroup>
													<thead>
														<tr id="gridheader">

															<th ng-click="sort('assetname')"><font color="white">Asset name</font><span class="glyphicon sort-icon" ng-show="sortKey=='assetname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th ng-click="sort('datetimestamp')"><font color="white">Datetimestamp</font><span class="glyphicon sort-icon" ng-show="sortKey=='datetimestamp'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															<th ng-click="sort('remarks')"><font color="white">Remark</font><span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></th>
															
															<th><font color="white">Edit</font></th>
															<th><font color="white">Delete</font></th>

														</tr>
													</thead>

													<tbody>
														<tr  dir-paginate="asset in assetdetailslist |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
															<td>{{asset.assetname}}</td>
															<td>{{asset.datetimestamp}}</td>
															<td>{{asset.remarks}}</td>
															<td><a type="submit" 
																ng-click="showassetdiv1();editasset(asset);" href=""><i
																	class="fa fa-pencil-square-o"></i></a></td>
															<td>
															<img ng-click="deletedevice(dev)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"></td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" >
												</dir-pagination-controls>
											
											<div class="hr hr8 hr-double"></div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
<div class="widget-box" id="showeditasset" hidden>
<div class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64);">
<h5 class="widget-title"> <font color="white">Edit Asset</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">
	<div>&nbsp;</div>

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="deviceEdit">
    <div class="row">
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Asset Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <input class="form-control" id="editassetname" value="{{dataaAsset.assetname}}" placeholder="Asset Name" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="editassetremark" value="{{dataaAsset.remarks}}" placeholder="Remark" type="text">
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          <div class="col-md-4">
    <button  class="action-button shadow animate green" ng-click="assetUpdate();"><font color="black">Update</font></button>
   </div>
     <div class="col-md-4">
   <button class="action-button shadow animate red" ng-click="back();"><font color="black">Back</font></button>		
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


				




					</div>
				</div>
				<!-- /.widget-main -->
			</div>
			<!-- /.widget-body -->
		</div>
	
		<!-- /.widget-box -->
	
	
	
	
	</div>
	<!-- /.col -->













