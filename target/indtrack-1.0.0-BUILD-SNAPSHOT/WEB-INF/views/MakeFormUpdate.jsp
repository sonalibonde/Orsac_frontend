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
						<li class="active"><a data-toggle="tab" href="#/MakeFormUpdate"><font>Make</font></a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab" href="#/MakeFormInsert"><font>MakeEntry</font>
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
							
								<div class="widget-box" id="mainmake">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title"><font color="white">Makes Detail</font></h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">
<!-- 											<fieldset style="border: 1px groove #ddd; padding: 0 1.4em 1.4em 1.4em; margin: 0 0 1.5em 0; -webkit-box-shadow: 0px 0px 0px 0px #000; box-shadow: 0px 0px 0px 0px #000;"> -->
<!-- 												<legend -->
<!-- 													style="padding: 0 10px; border-bottom: none; width: inherit;">Company -->
<!-- 													Creation</legend> -->

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
											            <td><div style="width:150px;"><font>Search By Make Name</font></div></td>
											             <td><input class="form-control" id="searchBYmakename"  ng-model="BYmakename"/></td>
											            
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
												<div id="makeDiv">
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTablemake">
													<colgroup>
														<col width="5%">
														<col width="20%">
														<col width="20%">
														<col width="20%">
														<col width="10%">
														<col width="10%">
														
													</colgroup>
													<thead>
														<tr  id="gridheader">
														<td ng-click="sort('rowno')"><font color="white">Sr.No.</font>
														<span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
														<td ng-click="sort('makename')"><font color="white">Make Name</font>
														<span class="glyphicon sort-icon" ng-show="sortKey=='makename'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
															<td ng-click="sort('assetname')"><font color="white">Make Type</font>
														<span class="glyphicon sort-icon" ng-show="sortKey=='assetname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															</td>
																<td ng-click="sort('remarks')"><font color="white">Remark</font>
															<span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
															
															</td>
															<td><font color="white">Edit</font></td>
															<td><font color="white">Delete</font></td>

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="makenamelistnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="make in makenamelistnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
															<td><font>{{make.rowno}}</font></td>
															<td><font>{{make.makename}}</font></td>
															<td><font>{{make.assetname}}</font></td>
															
															<td><font>{{make.remarks}}</font></td>
														<td>
														<a href="" type="submit"   ng-if="make.flag=='true'" ng-click="showmakediv1();makeeditdata(make);"><i class="fa fa-pencil-square-o" style="color:#1F32DC;"></i>
														</a>
														</td>
														<td>
														<a ng-click="deletemake(make)"  ng-if="make.flag=='true'" >
														<img src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px">
														</a>
														</td>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true"
														on-page-change="getData19(newPageNumber)"  >
													</dir-pagination-controls>
											</div>
												<div style="text-align: right;"><font>Total Records:{{makenamelist.length}}</font></div>		
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
								
								
<div class="widget-box" id="showeditmake" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"><font color="white"> Edit Make</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="makeedit">
    <div class="row">
    
    <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Make Type:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
		<datalist id="editMakeassetName">
			<option ng-repeat="x in assetnamelist" ng-if="x.assetname!='Sim'" value="{{x.assetname}}"></option>
		</datalist>
            <input class="form-control" id="editmakeassetname"  list="editMakeassetName" value="{{editmakedetails.assetname}}" placeholder="Make Type" type="text" required>
          </div>
        </div>
      </div>
    
    
      <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Make Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           
      <input class="form-control" id="editMakeName"  value="{{editmakedetails.makename}}" placeholder="Make Name" type="text" required>
    
    	</div>
        </div>
      </div>
     
      <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="editmakeremark" value="{{editmakedetails.remarks}}" placeholder="Remark" type="text">
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-lg-6">
        <div class="form-group">
          <div class="col-md-8">
          &nbsp; &nbsp;
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          
          <div class="col-md-4">
          <button  type="submit" class="action-button shadow animate green" ng-click="makeupdate();"><font color="black">Update</font></button>
           </div>
           <div class="col-md-4">
           <a  ng-click="back()" ><button class="action-button shadow animate red" type="button"><font color="black">Back</font></button></a>
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
			
				<!-- /.widget-main -->
		
			<!-- /.widget-body -->
	
	
		<!-- /.widget-box -->
	
	
	
	
<!-- 	company edd -->
	
	
	
	
	
	
	
	
	
	
	
	<!-- /.col -->













