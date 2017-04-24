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
						<li class="active"><a data-toggle="tab" href="#/SimFormUpdate"><font>Sim
								Creation</font> </a></li>

						<li ng-if="loginid!=10001"><a data-toggle="tab"  href="#/SimFormInsert"><font>New Entry</font></a></li>


					</ul>
				</div>
			</div>
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">

						<!-- 	vehicle creation	 -->


						<div id="task-tab" class="tab-pane active">

							<div class="col-sm-12">
								<div class="widget-box" id="mainsim">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">SIMs Detail</font>
										</h5>

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
											            <td><div style="width:150px;"><font>Search By Sim No</font></div></td>
											            <td><input class="form-control" id="searchbySimno" ng-model="BySimno"/></td>
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
												<div id="simDiv">
												<table class=" table-bordered" border="2"
													width="100%" cellspacing="0" id="printTablesim">
													<colgroup>
														<col width="5%">
														<col width="15%">
														<col width="10%">
														<col width="15%">
														<col width="15%">
														<col width="15%">
														<col width="10%">
														<col width="10%">
														<col width="10%	">
													</colgroup>
													<thead>
														<tr id="gridheader">
															<td ng-click="sort('rowno')"><font color="white">Sr.No.</font><span class="glyphicon sort-icon" ng-show="sortKey=='rowno'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
													
															<td ng-click="sort('simnumber')"><font color="white">Sim Number</font><span class="glyphicon sort-icon" ng-show="sortKey=='simnumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('networkname')"><font color="white">Network Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='networkname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('vendorname')"><font color="white">Vendor Name</font><span class="glyphicon sort-icon" ng-show="sortKey=='vendorname'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
															<td ng-click="sort('mobilenumber')"><font color="white">Mobile No</font><span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('mobilenumber2')"><font color="white">Mobile No.2</font><span class="glyphicon sort-icon" ng-show="sortKey=='mobilenumber2'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('remarks')"><font color="white">Remarks</font><span class="glyphicon sort-icon" ng-show="sortKey=='remarks'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('status')"><font color="white">Sim Status</font><span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															<td ng-click="sort('status')"><font color="white">Action</font><span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td>
															
<!-- 															<td ng-click="sort('status')"><font color="#1E0833">Activate</font><span class="glyphicon sort-icon" ng-show="sortKey=='status'" ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span></td> -->
															<td ><font color="white">Edit</font></td>
<!-- 															<td><font color="white">Delete</font></td> -->

														</tr>
													</thead>

													<tbody>
<%-- 														<tr ng-show="simnew.length <= 0"><td colspan="50" style="text-align:center;">Loading data ... </td></tr> --%>
														<tr dir-paginate="sim in simnew|itemsPerPage:pagesint|filter:query|orderBy:sortKey:reverse" total-items="total_count">
											 			 	<td><font>{{sim.rowno}}</font></td>
															<td><font>{{sim.simnumber}}</font></td>
															<td><font>{{sim.networkname}}</font></td>
															<td><font>{{sim.vendorname}}</font></td>
															<td><font>{{sim.mobilenumber}}</font></td>
															<td><font>{{sim.mobilenumber2}}</font></td>
															<td><font>{{sim.remarks}}</font></td>
															<td ng-if='sim.status=="Assigned"'><button  style="background-color: green;color: white; width:95px;"><font>{{sim.status}}</font></button></td>
															<td ng-if='sim.status!="Assigned"'><button  style="background-color: #e07b53;color: white; width:95px"><font>{{sim.status}}</font></button></td>
															<td ng-if='sim.sim_status=="Deactivate"' ng-click="deletesim(sim)"><a ng-if="sim.flag=='true'"><button  style="background-color: #e07b53;color: white; width:95px"><font>{{sim.sim_status}}</font></button></a></td>
															<td ng-if='sim.sim_status=="Activate"' ng-click="activatesim(sim);"><a ng-if="sim.flag=='true'"><button  style="background-color: green;color: white; width:95px;"><font>{{sim.sim_status}}</font></button></a></td>
															
<!-- 															<td><a ng-click="activatesim(sim);">Activate</a></td> -->
															<td><a  ng-if="sim.flag=='true'" type="submit" href=""
																  ng-click="showsimdiv1();simdata(sim);"><i
																	class="fa fa-pencil-square-o" style="color:#1F32DC;"></i></a></td>
<%-- 															<td><img  ng-if="sim.flag=='true'"   ng-click="deletesim(sim)" src="<c:url value="/resources/assets/images/Delete.png" />" height="16px" width="16px"></td> --%>
														</tr>
													</tbody>
												</table>
												<dir-pagination-controls
														max-size="5"
														direction-links="true"
														boundary-links="true" 
														on-page-change="getData22(newPageNumber)">
													</dir-pagination-controls>
													</div>
										<div style="text-align: right;"><font>Total Records:{{sim.length}}</font></div>
													
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
								
								
<div class="widget-box" id="simedit" hidden>
<div class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
<h5 class="widget-title"><font color="white"> Edit Sim </font></h5>
	</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="simeditform">
    <div class="row">
    
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputPassword" class="col-md-4 control-label"><font color="black">Sim No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editsimnumber" onkeyup="simValidation(this)" onchange="simlengthValidation(this)"  id="insertsimno"  value={{simdata.simnumber}} placeholder="Sim No" type="text"  maxlength="15" required>
         <div class="alert alert-warning"  id="idsim" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="simnolength" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 15 digits!
  		</div>
        
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Network Provider</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
      <datalist id="editnetworkdetails">
			<option ng-repeat="x in simnetworkdetails" value="{{x.networkname}}"></option>
		</datalist>
            <input class="form-control" id="editsimnetworkname" list="editnetworkdetails"  value={{simdata.networkname}} placeholder="Network Provider" type="text" required>
          </div>
        </div>
      </div>
     
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editsimmobileno" value={{simdata.mobilenumber}} placeholder="Mobile Number" type="text" required>
           <div class="alert alert-warning"  id="idmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="length" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel3" class="col-md-4 control-label"><font color="black">Mobile No.2:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control" id="editsimmobileno2" value={{simdata.mobilenumber2}} placeholder="Mobile Number" type="text" required>
           <div class="alert alert-warning"  id="idmsg" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Allow Digits Only!
  		</div>
  		
  		 <div class="alert alert-warning"  id="length" hidden data-toggle=" left">
   	 	<a href="" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    	<strong>Warning!</strong> Should not be less than 10 digits!
  		</div>
          
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputLabel4" class="col-md-4 control-label"><font color="black">Vendor Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <datalist id="editsimvendordetailsdata">
				<option ng-repeat="x in simvendordetails" value="{{x.vendorfirmname}}"></option>
			</datalist>
            <input class="form-control" id="editsimvendorname" list="editsimvendordetailsdata"  value={{simdata.vendorname}} placeholder="Vendor Name" type="text" required>
          </div>
        </div>
      </div>

<!--       <div class="col-sm-6 col-lg-6"> -->
<!--         <div class="form-group"> -->
<!--           <label for="input5" class="col-md-4 control-label"><font color="black">Asset Name:</font><b style="color:Red;font-weight:normal;">*</b></label> -->
<!--           <div class="col-md-8"> -->
<!--            <datalist id="simeditassetname"> -->
<!-- 				<option ng-repeat="x in simassetnamelist" value="{{x.assetname}}"></option> -->
<!-- 		   </datalist> -->
<!--             <input class="form-control"  list="simeditassetname" id="editsimassetname" value={{simdata.assetname}} placeholder="Asset Name" type="text" required> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Receipt Date:</font></label>
          <div class="col-md-8 ">
          <input class="form-control datepick" id="editsimreceiptdate"  value={{simdata.receiptdt}} placeholder="Receipt Date" type="text" >
            </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Date Of Active:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control datepick" id="editsimactivedate"  value={{simdata.dateofactive}} placeholder="Date Of Active" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input5" class="col-md-4 control-label"><font color="black">Remark:</font></label>
          <div class="col-md-8">
            <input class="form-control" id="editsimRemark"  value={{simdata.remarks}} placeholder="Remark" type="text">
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <div class="col-md-8">
          &nbsp;&nbsp;
          </div>
        </div>
      </div>
       <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <div class="col-md-8">
          &nbsp;&nbsp;
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        <div class="col-md-4 ">
          <button   class="action-button shadow animate green" ng-click="simupdate();"><font color="black">Update</font></button>
         </div>
         <div class="col-md-4 ">
          <a  ng-click="back();"><button  class="action-button shadow animate red" type="button"><font color="black">Back</font></button></a>		
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













