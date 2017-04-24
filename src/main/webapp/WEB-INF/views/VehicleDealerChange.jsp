<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">





<div class="widget-box" id="showeditvehicle">
<div class="widget-header widget-header-flat widget-header-small"  id="dealerlabel">
<h5 class="widget-title"><font color="black"> Change Vehicle Dealers</font></h5>
</div>
	<div class="widget-toolbar no-border"></div>
	<div class="widget-body">
	<div class="widget-main">

<div>&nbsp;</div>
<form class="form-horizontal" role="form" name="vehicleeditform">
    <div class="row">
    




<div class="col-sm-6 col-lg-6">
        <div class="form-group ">
          <label for="inputEmail" class="col-md-4 control-label"><font color="black">Vehicle No:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " value="Vehicle Number"  id="vehicleditvehicleno" placeholder="Vehicle No" type="text" required>
         
          </div>
        </div>
      </div>



  <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Select Sub Dealers:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditfitnessval" value="Select Dealer"   placeholder="Fitness Validity" type="text" required>
          </div>
        </div>
      </div> 
      
      <div class="col-sm-6 col-lg-6">
        <div class="form-group">
          <label for="input8" class="col-md-4 control-label"><font color="black">Select Customer:</font><b style="color:Red;font-weight:normal;">*</b></label>
          <div class="col-md-8">
            <input class="form-control " id="veheditfitnessval" value="Select Customer"   placeholder="Fitness Validity" type="text" required>
          </div>
        </div>
      </div> 
      
      
      
       <div class="col-sm-6 col-lg-6 col-md-offset-4">
        <div class="form-group">
          
          <div class="col-md-4">
       <button type="submit"  class="action-button shadow animate green" ng-click="VehicleUpdate();"><font color="black">Save</font></button>
	</div>
	<div class="col-md-4">
	<a    ng-click="back()"><button  class="action-button shadow animate red"><font color="black">Back</font></button></a>
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
</html>