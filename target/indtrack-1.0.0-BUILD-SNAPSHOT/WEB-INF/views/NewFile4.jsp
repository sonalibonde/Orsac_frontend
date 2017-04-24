<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<style>
	#overlay {
	    position: absolute;
	    left: 0;
	    top: 0;
	    bottom: 0;
	    right: 0;
	    background: #ccc;
	    opacity: 0.5;
	    filter: alpha(opacity=80);
		background-color:white;
	    background:url('resources/Mapscript/images/Preloader_7.gif') no-repeat center center rgba(0,0,0,0.25)
	}
	.loader{
    text-align: center;
    z-index: 999;
    position: relative;
    top: 10px;
	}
	#loading {
	    width: 50px;
	    height: 57px;
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    margin: -28px 0 0 -25px;
	}
</style>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<body>

<div ng-app="myApp" ng-controller="deviceCtrl">
	 <form ng-submit="addMapping()">


        <div>
           
           <table>
           		<tr>
           			<td>
           				 <select data-ng-model="option1" data-ng-options="option.imeino for option in device" data-ng-change="ondevicechange(option1)">
						    <option value="" disabled selected>-- select a {{dim}} --</option>
						</select>
           			</td>
           			<td>
           			   <input type="text" id="command" />
           			</td>
           		</tr>
           		<tr>
           			<td>
           			<button type="submit" ng-click="send()">Send</button>
           			</td>
           		</tr>
           </table>
           
        </div>        
    </form>

</div>

<script>
var app = angular.module('myApp', []);
app.controller('deviceCtrl', function($scope, $http, $compile, $filter) {
	var over = '<div id="overlay"></div>';
    $(over).appendTo('body');
	$http.get('http://localhost:8080/indtrackwebservice/rest/CallService/devicemanager')
	.success(function(data, status, headers, config) {
// 		alert(data);
		$scope.device = data;
		$('#overlay').remove();
	}).error(function(data, status, headers, config) {
		console.log('error: data = ', data);
		$('#overlay').remove();
	});
	
	var reactorkey,clientkey,msg;
	var key1 = []
	$scope.ondevicechange = function(key){
		key1 = key;
		
	}
	
	$scope.send = function(){
		msg =  "{"+
		"\"reactorKey\":\""+key1.reactorkey+"\","+
		"\"clientKey\":\""+key1.clientkey+"\","+
		"\"messageReceived\":\""+document.getElementById("command").value+"\""+
		"}";
		alert(msg);
		var over = '<div id="overlay"></div>';
	    $(over).appendTo('body');
		$http.get('getmessage?jsonmsg=ok&queuename='+key1.reactorkey)
		.success(function(data, status, headers, config) {
//	 		alert(data);
			$('#overlay').remove();
			alert("message send");
		}).error(function(data, status, headers, config) {
			console.log('error: data = ', data);
			$('#overlay').remove();
		});
	}
	
});
</script>

</body>
</html>