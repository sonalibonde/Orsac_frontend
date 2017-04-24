<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			
			<div class="widget-body">
				<div class="widget-main padding-4">
					<div class="tab-content padding-8">
						<div id="task-tab" class="tab-pane active">
							<div class="col-sm-12">
								<div class="widget-box" id="rolemain">
									<div
										class="widget-header widget-header-flat widget-header-small" id="dealerlabel">
										<h5 class="widget-title">
											<font color="white">Daily Data Report</font>
										</h5>

										<div class="widget-toolbar no-border"></div>
									</div>

<div class="widget-body" >
	<div class="widget-main">
	
<form role="form" name="history">
<div class="row">
  
    
    <div class="form-group col-xs-4 col-md-2">
        <label for="name" class="control-label"><font>To Date:</font><b style="color:Red;font-weight:normal;">*</b></label>
      <input class="form-control datepick" type="text" id="dailydatefield" required>
    </div>
 </div>
</form>

<div class="row">


<div class="row">
<div class="col-md-12">
<table style="width:100%;border: 1px solid; ">

<tr style="background-color: #8c3c61;">
<td style="text-align: center;"><font color="white">Daily Data</font></td>
</tr>
</table>
</div>

</div>

<div class="row">&nbsp;</div>


<div class="row">
<div class="col-md-12">
<table style="width:100%;">
<colgroup>
<col width="20%">
<col width="20%">
</colgroup>

<tr style="background-color: blue;">
<td class="col-md-6"><font color="white">Date</font></td>
<td class="col-md-6"><font color="white">{{datedaily}}</font></td>
</tr>
</table>

</div>
</div>


<div class="row">&nbsp;</div>

<div class="row">
<div class="col-md-12">
<table  class=" table-bordered"  cellspacing="0" style="width:100%;border:1px solid;">
<tr>
<td class="col-md-6"><font color="black">Total Ambulance</font></td>
<td class="col-md-6"><font color="black">812</font></td>
</tr>

<tr>
<td class="col-md-6"><font color="black">Total ambulance Fitted with GPS</font></td>
<td class="col-md-6"><font color="black">791</font></td>
</tr>
<tr>
<td class="col-md-6"><font color="black">GPS Working</font></td>
<td class="col-md-6"><font color="black">659</font></td>
</tr>
</table>

</div>
</div>
<div class="row">&nbsp;</div>


<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr>
<td class="col-md-6"><font color="black">Total Trips per day</font></td>
<td class="col-md-6"><font color="black">23</font></td>
</tr>
<tr>
<td class="col-md-6"><font color="black">Average Trips per day</font></td>
<td class="col-md-6"><font color="black">231</font></td>
</tr>
</table>
</div>
</div>


<div class="row">&nbsp;</div>

<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr colspan="2" style="text-align: center;">
<td><font color="black">Trips Per Ambys Per Day</font></td>
</tr>
<tr>

<td>
<table  style="width:100%" class=" table-bordered"  cellspacing="0">
<thead>
<tr>
<td  class="col-md-6"><font color="black">Trips</font></td>
<td  class="col-md-6"><font color="black">No Of Ambys</font></td>
</tr>
</thead>
<tbody>
<tr>
<td  class="col-md-6"><font color="black">0</font></td>
<td  class="col-md-6"><font color="black">{{zerocount}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">1-5</font></td>
<td  class="col-md-6"><font color="black">{{fivecount}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">6-10</font></td>
<td  class="col-md-6"><font color="black">{{tencount}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">11-15</font></td>
<td  class="col-md-6"><font color="black">{{fifteencount}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">>=16</font></td>
<td  class="col-md-6"><font color="black">{{sixteencount}}</font></td>
</tr>
</tbody>
</table>
</td>
</tr>

</table>


</div>
</div>
		
<div class="row">&nbsp;</div>

<div class="row">
<div class="col-md-12">
	
	<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr colspan="2" style="text-align: center;">
<td><font color="black">Trips Per Ambys Per Day</font></td>
</tr>
<tr>

<td>
<table  style="width:100%" class=" table-bordered"  cellspacing="0">
<thead>
<tr>
<td  class="col-md-6"><font color="black">Hospitals</font></td>
<td  class="col-md-6"><font color="black">Trips</font></td>
</tr>
</thead>
<tbody>
<tr>
<td  class="col-md-6"><font color="black">Govt</font></td>
<td  class="col-md-6"><font color="black">&nbsp;</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">Private</font></td>
<td  class="col-md-6"><font color="black">&nbsp;</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">First Aid</font></td>
<td  class="col-md-6"><font color="black">&nbsp;</font></td>
</tr>


</tbody>
</table>
</td>
</tr>

</table>
	`
		
</div>
</div>	
		
		
<div class="row">&nbsp;</div>		
		
	<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr>
<td  class="col-md-6"><font color="black">Total Distance</font></td>
<td  class="col-md-6"><font color="black">23 Km</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">Average Distance per amby</font></td>
<td  class="col-md-6"><font color="black">231Km</font></td>
</tr>
</table>
</div>
</div>
	
	
	
	
	<div class="row">&nbsp;</div>

<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr colspan="2" style="text-align: center;">
<td><font color="black">Distance Per Ambys Per Day</font></td>
</tr>
<tr>

<td>
<table  style="width:100%" class=" table-bordered"  cellspacing="0">
<thead>
<tr>
<td  class="col-md-6"><font color="black">Km</font></td>
<td  class="col-md-6"><font color="black">No Of Ambys</font></td>
</tr>
</thead>
<tbody>
<tr>
<td  class="col-md-6"><font color="black"> < 1</font></td>
<td  class="col-md-6"><font color="black">{{onekm}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">1-15</font></td>
<td  class="col-md-6"><font color="black">{{fifteenkm}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">16-50</font></td>
<td  class="col-md-6"><font color="black">{{fiftykm}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">51-100</font></td>
<td  class="col-md-6"><font color="black">{{hundredkm}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">>100</font></td>
<td  class="col-md-6"><font color="black">{{above100}}</font></td>
</tr>
</tbody>
</table>
</td>
</tr>

</table>


</div>
</div>
		
	
	
	
	
	<div class="row">&nbsp;</div>
	
	<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr colspan="2" style="text-align: center;">
<td><font color="black">Cycle Time</font></td>
</tr>
<tr>

<td>
<table  style="width:100%" class=" table-bordered"  cellspacing="0">
<thead>
<tr>
<td  class="col-md-6"><font color="black">Mins</font></td>
<td  class="col-md-6"><font color="black">Trips</font></td>
</tr>
</thead>
<tbody>
<tr>
<td  class="col-md-6"><font color="black"> <=30</font></td>
<td  class="col-md-6"><font color="black">{{thirty}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">31-60</font></td>
<td  class="col-md-6"><font color="black">{{sixtycycle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">61-90</font></td>
<td  class="col-md-6"><font color="black">{{nintycycle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">91-120</font></td>
<td  class="col-md-6"><font color="black">{{onetwentycycle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">>120</font></td>
<td  class="col-md-6"><font color="black">{{onetwenty1cycle}}</font></td>
</tr>
</tbody>
</table>
</td>
</tr>

</table>


</div>
</div>
		
		
		
		
		
		
		
	<div class="row">&nbsp;</div>	
		
<div class="row">
<div class="col-md-12">
<table class=" table-bordered"  cellspacing="0" style="width:100%;border: 1px solid; ">
<tr colspan="2" style="text-align: center;">
<td><font color="black">Idle Time Per Day</font></td>
</tr>
<tr>

<td>
<table  style="width:100%" class=" table-bordered"  cellspacing="0">
<thead>
<tr>
<td  class="col-md-6"><font color="black">Hours</font></td>
<td  class="col-md-6"><font color="black">No Of ambys</font></td>
</tr>
</thead>
<tbody>

<tr>
<td  class="col-md-6"><font color="black"> <1</font></td>
<td  class="col-md-6"><font color="black">{{oneidle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">1-5</font></td>
<td  class="col-md-6"><font color="black">{{fiveidle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">6-10</font></td>
<td  class="col-md-6"><font color="black">{{tenidle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">11-15</font></td>
<td  class="col-md-6"><font color="black">{{fifteenidle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">16-20</font></td>
<td  class="col-md-6"><font color="black">{{twentyidle}}</font></td>
</tr>
<tr>
<td  class="col-md-6"><font color="black">>20</font></td>
<td  class="col-md-6"><font color="black">{{abovetwentyidle}}</font></td>
</tr>
</tbody>
</table>
</td>
</tr>

</table>


</div>
</div>
			
</div>




</div>


</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>			
	
	










