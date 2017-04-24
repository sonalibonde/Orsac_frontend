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
						<li class="active"><a data-toggle="tab" href="#/CompanyFormUpdate"><font>Company
								Creation</font></a></li>

<!-- 						<li><a data-toggle="tab" href="#/CompanyFormInsert"><font>New Entry</font> -->
<!-- 							</a></li> -->

					</ul>
				</div>
			</div>


			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 		comapnay creation											 -->

						<div id="task-tab" class="tab-pane active">

							<div class="col-sm-12">
							
								<div class="widget-box" id="maincom">
									<div class="widget-header widget-header-flat widget-header-small" style="background:rgb(64,64,64);">
									<div style="text-align:left;padding-top: 0px">	<h5 class="widget-title"><font color="white">Companies Detail</font></h5></div>
											<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset	style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->

												<div>&nbsp;</div>
												<table>
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
											            <td></td>
											            <td></td>
											        	<td><table><tr><td><font>Show Rows</font></td>
											        	<td></td>
											        	<td>
											        	<select data-ng-init="option1 = pagesno[0]"  data-ng-model="option1" data-ng-options="option for option in pagesno" data-ng-change="onpagechange(option1)">
														</select></td>
											        	</tr></table></td>
											        </tr>   
												</table>
												<table class="table table-striped table-bordered"
													width="100%" cellspacing="0" id="printTable">
													<colgroup>
														<col width="5%">
														<col width="20%">
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
<th ng-click="sort('companyname')"><font color="white">Sr.No.</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('companyname')"><font color="white">Company Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('shortname')"><font color="white">Short Name</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='shortname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('contactpersonname')"><font color="white">Contact Person</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='contactpersonname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('companyaddress')"><font color="white">Company Address</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='companyaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('lanldlinenumber1')"><font color="white">Mobile No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber1'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('lanldlinenumber2')"><font color="white">LandLine No</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='lanldlinenumber2'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															
															<th ng-click="sort('emailid')"><font color="white">Email-Id</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='emailid'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('registeredaddress')"><font color="white">Reg. Address</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='registeredaddress'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															<th ng-click="sort('status')"><font color="white">Status</font>
																<span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</th>
															
<!-- 															<th><font color="white">Edit</font></th> -->
<!-- 															<th><font color="white">Delete</font></th> -->

														</tr>
													</thead>

													<tbody>
														<tr dir-paginate="comp in company |orderBy:sortKey:reverse|filter:query|itemsPerPage:pagesint">
														<td><font>{{comp.rowno}}</font></td>
															<td><font>{{comp.companyname}}</font></td>
															<td><font>{{comp.shortname}}</font></td>
															<td><font>{{comp.contactpersonname}}</font></td>
															<td ><font>{{comp.companyaddress}}</font></td>
															<td ><font>{{comp.lanldlinenumber1}}</font></td>
															<td ><font>{{comp.lanldlinenumber2}}</font></td>
															
															<td ><font>{{comp.emailid}}</font></td>
															<td ><font>{{comp.registeredaddress}}</font></td>
															<td ><font>{{comp.status}}</font></td>
<!-- 															<td><a ng-if="comp.flag=='true'" type="submit" ng-click="showcomdiv1();companyData(comp);" href=""> -->
<!-- 															<i class="fa fa-pencil-square-o"></i> -->
<!-- 															</a></td> -->
<!-- 															<td> -->
<!-- 															<a ng-if="comp.flag=='true'" href=""> -->
<%-- 															<img ng-click="deletecom(comp)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"> --%>
<!-- 															</a> -->
<!-- 															</td> -->
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" >
													</dir-pagination-controls>
													<div style="text-align: right;"><font>Total Records:{{company.length}}</font></div>
<!-- 											</fieldset> -->

											<div class="hr hr8 hr-double"></div>
		<div style="text-align:center;">	
		<a id="printbutton" title="Print" href="">
		<img  src="<c:url value="/resources/assets/images/printer.png" />" height="30px" width="30px">
										</a>
		<a href="" title="Export To PDF"  id="exportpdf"><img src="<c:url value="/resources/assets/images/PDF-icon.png" />"
									 height="20px" width="20px"></a>
										
										
										<a href="" title="Export To Excel" id="exportexcel"  ><img src="<c:url value="/resources/assets/images/excel.png" />"
									 height="20px" width="20px"></a>
<!-- 									 <button  id="" ng-click="demoFromHTML();">PDF</button> -->
										</div>
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
								
			
</div>


		</div>
						

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







