
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="row">

	<div class="col-xs-12">
	
		<div class="widget-box transparent" id="recent-box">
			<div class="widget-header">
				<h4 class="widget-title lighter smaller">
<!-- 					<i class="ace-icon fa fa-rss orange"></i>RECENT -->
				</h4>

				<div class="widget-toolbar no-border">
					<ul class="nav nav-tabs" id="recent-tab">
							<li><a data-toggle="tab" href="#/home"><font>Vehicle Live Status</font>
							</a></li>
					<li class="active"><a data-toggle="tab" href="#/CustomerMap"><font>Live Map</font>
						</a></li>

					</ul>
				</div>
			</div>

<div class="row">
<div class="col-md-12"  id="maptrack">
<!-- <div class="panel panel-primary"> -->
<!-- 	<div class="panel-heading dark-overlay" id="dealerlabel">Map  Track -->
<!-- 	<a  href="" ng-click="back();showgraph();" title="Go Back"  style="float:right;"> -->
<%-- <img src="<c:url value="/resources/imagenew/back.png" />" height="20px" width="20px"> --%>
<!-- </a> -->
<!-- 					</div> -->
					<div class="panel-body">
<iframe id="mapframe" style="height:78%;width:80%;position: fixed;"></iframe>
						</div>
<!-- </div> -->







</div>
			
			
			</div><!--/.row-->	
		
	
</div>	<!--/.main-->
	

</div>
</div>

