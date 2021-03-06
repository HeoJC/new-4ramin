<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<script src="js/jquery.min.js"></script>
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
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	border: 1px solid #888;
	width: 80%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #89ba16;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #89ba16;
	color: white;
}
 .modaltable {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .th {
    border-bottom: 1px solid #444444;
    border-left: 1px solid #444444;
    padding: 10px;
  }
  th:first-child, .tt:first-child {
    border-left: none;
  }
/* ???????????? */
</style>
<title>??????????????????</title>
<script type="text/javascript">


//ModalDelivery ??? ???????????? ???????????? frm.uid ?????? ?????? ?????????,????????????
function ModalDelivery(v) {
	 $.ajax({
		 url : 'UserOne.do?uid=' + v,
		 type : 'get',
		 dataType : 'json',
		 success : function(str) {
				$('#one').empty();
			for (let data in str ){
				$('#one').append(
		
					$('<td />').html(str[data])	
				);
	
			}
		},
		error : function () {
			alert('??????');
		}
	 });

}

</script>
</head>
<body>
	<div>
		<div>
			<div align="center">
				<table id="myBtn">
					<tr align="center">
						<th width="100">?????????</th>
						<th width="200">??????</th>
					</tr>

					<!-- td ????????? ????????? ????????? ???????????? , ?????? id?????? ???????????? ?????? -->
					<c:forEach items="${users }" var="user">
						<tr onmouseover='this.style.background="#fcecae";'
							onmouseleave='this.style.background="#FFFFFF";'
							onclick="ModalDelivery('${user.user_id }')">
							<td align="center">${user.user_id }</td>
							<td align="center">${user.user_name }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- ????????? ?????????????????? ?????? ??? ????????? ID ?????? ???????????? ????????????????????? -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close"></span>
				<h5>??????????????????</h5>
			</div>
			<div class="modal-body">
				<form action="">
					<div>
						<table class="modaltable">
							<tr align="center">
								<th width="200" class="th">?????????</th>
								<th width="200" class="th">??????</th>
								<th width="200" class="th">?????????</th>
								<th width="200" class="th">?????????</th>

							</tr>
							<!-- ?????? ?????? -->
							<tr id="one" align="center" />
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<h5>????????? ?????? ?????? ??????</h5>
			</div>
		</div>
	</div>
	<script>
	// Get the modal
		var modal = document.getElementById("myModal");

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