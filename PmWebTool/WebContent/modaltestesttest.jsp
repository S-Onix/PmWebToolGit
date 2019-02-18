<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* background / opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 60%;
	height: 60%;
	display: flex;
}

.modal-left {
	width: 50%;
	float: left;
	flex: 5;
}

.center-line {
	border-left: 0.5px solid #cccccc;;
  	height: 360px;
	flex: 0.5;
}

.modal-right {
	width: 50%;
	float: right;
	flex: 5;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.center {
	margin-top: 50px;
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
	padding: 0;
}

.modal-footer .btn-group button {
	height: 40px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border: none;
	border-right: 1px solid #ddd;
}

.modal-footer .btn-group:last-child>button {
	border-right: 0;
}

.form-group {
	padding-top: 10px;
}

.modal-footer {
	padding-top: 70px;
	padding-left: 30%;
}

.calendar {
	padding-top: 70px;
	padding-left: 30%;
}

.form-control {
	width: 80%;
	height: 30px;
	font-size: 18px;
}

.cm-text {
	width: 80%;
	height: 50px;
	font-size: 18px;
}

.test1 {
	width: 80%;
	height: 170px;
}

.test2 {
	height: 50%;
}

.test3 {
	height: 50%;
}


</style>
</head>
<body>

	<h2>Modal Example</h2>

	<!-- Trigger/Open The Modal -->
	<button id="myBtn">Open Modal</button>
	<h1>TEST</h1>
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<!-- ----------left--------- -->
			<div class="modal-left">
				<div class="modal-header">
					<h3 class="modal-title" id="lineModalLabel">My Modal</h3>
				</div>
				<div class="modal-body">

					<!-- content goes here -->
					<form>
						<div class="form-group">
							<input type="text" class="form-control" id="title"
								placeholder="TITLE UPDATE">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="chadule"
								placeholder="SCHADULE">
						</div>

					</form>
				</div>
				<div class="calendar">
					<button>calendar</button>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
			
			<!-- center -->
			<div class="center-line"></div>
			
			<!-- ----------right---------- -->
			<div class="modal-right">
				<span class="close">&times;</span>
				<div class="test1">
					<div class="test2">
						<h3>comment title</h3>
					</div>
					<div class="test3">
						<h3>comment</h3>

					</div>
				</div>
				<div class="comment-wrap">
					<div class="comment-text">
						<h3>text</h3>
						<input type="text" placeholder="COMMENT" class="cm-text">
						<button value="comment">CM</button>

						<div class="comment-btn"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>

</body>
</html>
