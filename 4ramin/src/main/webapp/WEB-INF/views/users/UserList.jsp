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
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}
/* 체크박스 */
</style>
<title>개인회원목록</title>
<script type="text/javascript">


//ModalDelivery 에 담긴값을 가져와서 frm.uid 한테 값을 넘기고,전송한다
function ModalDelivery(v) {
	 $.ajax({
		 url : 'UserOne.do?uid=' + v,
		 type : 'get',
		 dataType : 'json',
		 success : function(str) {
				$('#one').empty();
			for (let data in str ){
				$('#one').append(
					$('<td />').html(str[data]),	
				);
	
			}
		},
		error : function () {
			alert('실패');
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
						<th width="100">아이디</th>
						<th width="100">비밀벙호</th>
						<th width="100">이름</th>
						<th width="200">연락처</th>
						<th width="200">이메일</th>
						<th width="200">권한</th>
					</tr>

					<!-- td 어디를 누르든 모달이 열리면서 , 누른 id값을 상세보기 한다 -->
					<c:forEach items="${users }" var="user">
						<tr onmouseover='this.style.background="#fcecae";'
							onmouseleave='this.style.background="#FFFFFF";'
							onclick="ModalDelivery('${user.user_id }')">

							<td align="center">${user.user_id }</td>
							<td align="center">${user.user_password }</td>
							<td align="center">${user.user_name }</td>
							<td align="center">${user.user_phone }</td>
							<td align="center">${user.user_email }</td>
							<td align="center">${user.user_auth }</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">
		<!-- 모달을 클릭이벤트로 열면 그 클린한 ID 값을 기준으로 단건검색할계획 -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close"></span>
				<h4>회원상세보기</h4>
			</div>
			<div class="modal-body">
				<form action="">
					<div>
						<table>
							<tr align="center">
								<th width="200">아이디</th>
								<th width="200">비밀벙호</th>
								<th width="200">이름</th>
								<th width="200">연락처</th>
								<th width="200">이메일</th>
								<th width="200">권한</th>
							</tr>
							<!-- 단건 조회 -->
							<tr id="one" align="center" />
						</table>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<h2>이력서 출력 해줄 부분</h2>
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