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
						<li ><a data-toggle="tab" href="#/DealerAssignFormUpdate">Device Sale
						</a></li>

						<li class="active"><a data-toggle="tab" href="#/DealerAssignFormInsert">New Entry</a></li>
						

					</ul>
				</div>
			</div>
			
		
<div id="member-tab" class="tab-pane ">
							<div class="col-sm-12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<!-- 													<i class="ace-icon fa fa-signal"></i> -->
											<font color="white">New Dealer Assign Entry</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

									<div class="widget-body">
										<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="DealerassignInsert">
    <div class="row">
     <div class="col-sm-6 col-lg-6">
        <div class="form-group">
         <label for="input5" class="col-md-4 control-label"><font color="black">Dealer Name:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
          <datalist id="insertdealername">
				<option ng-repeat="x in dealerassdealerdetailslist " value="{{x.dealername}}"></option>
		</datalist>
            <input class="form-control"  id="insertdealerassignname" list="insertdealername"  placeholder="Dealer Name" type="text" required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Device Number:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           <datalist id="insertdealerdeviceno">
				<option ng-repeat="x in  devicedealerlist" value="{{x.uniqueid}}"></option>
		</datalist>
           	<input class="form-control"  list="insertdealerdeviceno" id="insertdealerdeviceNo"  placeholder="Device Number" type="text"   required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Sale Cost:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
           	<input class="form-control" id="insertdealersalecost"  placeholder="Sale Cost" type="text"   required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Credit Money:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control"   id="insertdealerassvcreditmoney"  placeholder="Credit Money" type="text"   required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Payment Mode:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
         
           	<input class="form-control"   id="insertdealerpaymentmode"  placeholder="Payment Mode" type="text"   required>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
        
    <button  class="action-button shadow animate green" ng-click="dealerassignInsert();"><font color="black">Save</font></button>
       
   <button type="reset" class="action-button shadow animate red""><font color="black">Reset</font></button>		
         
         
        <a type="button"  class="action-button shadow animate red" href="#/DealerAssignFormUpdate"><font color="black">Back</font></a>				
            
        </div>
      </div>
    </div>
  </form>

	
						
											<div class="hr hr8 hr-double"></div>

								
										</div>
										<!-- /.widget-main -->
									</div>
									<!-- /.widget-body -->
								</div>
								<!-- /.widget-box -->
							</div>


						</div>

				




					</div>
				</div>
			</div>









