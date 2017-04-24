<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	  <title>CheckData</title>
</head>
<body ng-app="checkdataapp">
<div ng-controller="datactrl">
<div class="container"><br><br>
 <div class="col-md-12">
 <div style="margin-right:-900px;">
  
      
     

 <h1><font><u>GVK EMRI CLIENT DETAILS</u></font></h1>
 
 </div>
 </div>
       <div class="row">&nbsp;</div>
       <div style="margin-right:-900px;">
 
 <h3><font color="red">NOTE:</font><u>GVK CHENNAI send this SMS Alerts because Customer want to receive alerts.</u> </h3>
 
 </div>
      
      
       <div class="row">&nbsp;</div>
      
      <table class="table table-striped">
	    <thead>
	      <tr>
	        <th>Sr.NO.</th>
	        <th>Mobile No</th>
	        <th>Name</th>
	         <th>District</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr ng-repeat="x in clientdetails">
	        <td>{{x.rowno}}</td>
	        <td>{{x.mobileno}}</td>
	        <td>{{x.clientname}}</td>
	        <td>{{x.district}}</td>
	      </tr>
	    </tbody>
	  </table>
   
     
 </div>
    </div>
  </div>
<!-- </div> -->
<script>
var scotchApp = angular.module('checkdataapp', []);
scotchApp.controller('datactrl', function($scope,$http, $compile, $filter) {
	
	
		var over = '<div id="overlay">' +
	     '</div>';
	    $(over).appendTo('body');
		try{
		$http.get('http://59.144.132.170/gvkwebservice/rest/CallService/clientdetails').success(function(data, status, headers, config){ 
			 $('#overlay').remove();
			 
			$scope.clientdetails = data; 
		}).error(function(data, status, headers, config) {
			 $('#overlay').remove();
			
				console.log('error: data = ', data);
		});
		}catch(e)
		{}
	
})
</script>



</body>
</html>