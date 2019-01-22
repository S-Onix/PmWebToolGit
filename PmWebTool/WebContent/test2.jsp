<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	  $('#example').popover();
	});

</script>
<style type="text/css">
.popover {
    margin-top: -20px;
}

.popover.right .arrow {
    margin-top: 8px;
}
</style>
</head>
<body>
<p>Click on button to see Popover</p>

<a href="#" id="example" class="btn btn-primary" rel="popover" data-content="This is the body of Popover" data-original-title="Creativity Tuts">pop
</a>

</body>
</html>