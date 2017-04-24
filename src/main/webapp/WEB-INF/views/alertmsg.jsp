<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Alerts</h2>
  <p>The a element with class="close" and data-dismiss="alert" is used to close the alert box.</p>
  <div class="alert alert-success">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> This alert box could indicate a successful or positive action.
  </div>
  <div class="alert alert-info">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Info!</strong> This alert box could indicate a neutral informative change or action.
  </div>
  <div class="alert alert-warning">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Warning!</strong> This alert box could indicate a warning that might need attention.
  </div>
  <div class="alert alert-danger">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
  </div>
</div>
<p>
    <button id="success-btn">Success</button>
    <button id="failure-btn">Failure</button>
    <button id="warning-btn">Warning</button>
</p>
<div class="alert-box success">Successful Alert !!!</div>
<div class="alert-box failure">Failure Alert !!!</div>
<div class="alert-box warning">Warning Alert !!!</div>

<script>
$( "#success-btn" ).click(function() {
  $( "div.success" ).fadeIn( 300 ).delay( 1500 ).fadeOut( 400 );
});

$( "#failure-btn" ).click(function() {
  $( "div.failure" ).fadeIn( 300 ).delay( 1500 ).fadeOut( 400 );
});

$( "#warning-btn" ).click(function() {
  $( "div.warning" ).fadeIn( 300 ).delay( 1500 ).fadeOut( 400 );
});
</script>
</body>
</html>

</body>
</html>