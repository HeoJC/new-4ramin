<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 보기</title>
<script type="text/javascript">
	window.onload = function() {
		var resule = "";
		ajax({
			type : "post",
			url : "이력서 셀렉트 할 do",
			async : false,

		})
	}

	function Editfunction() {
		frm2.action = "UserEdit.do";
		frm2.submit();

	}
	function DeleteFunction() {

		var pw1 = "${user.user_password }";
		var pw2 = prompt("비밀번호를 입력해주세요");
		if (pw2 == "") {
			alert("내용을입력하세요")
			return;
		}
		if (pw1 != pw2) {
			alert("비밀번호가 일치하지 않습니다.")
			return;
		}
		alert("탈퇴가 완료되었습니다.")
		frm.action = "UserDelete.do";
		frm.submit();

	}
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<br>
	<div>
		<form id="frm" action="" method="post">
			<div class="col-lg-4" align="center">
				<div class="bg-light p-3 border rounded mb-4">
					<h3 class="text-primary  mt-3 h5 pl-3 mb-3 ">개인정보 페이지 입니다.</h3>
					<ul class="list-unstyled pl-3 mb-0">
						<li class="mb-2" name="user_id"><strong class="text-black">이름
								:</strong> ${user.user_name }</li>
						<li class="mb-2"><strong class="text-black">아이디 :</strong>
							${user.user_id }</li>
						<li class="mb-2"><strong class="text-black">비밀번호 :</strong>
							${user.user_password }</li>
						<li class="mb-2"><strong class="text-black">이메일 :</strong>
							${user.user_email }</li>
						<li class="mb-2"><strong class="text-black">연락처 :</strong>
							${user.user_phone }</li>
						<%-- <div align="center">
							<input
								onclick="document.getElementById('id01').style.display='block'"
								class="w3-button w3-gray" value="수정하기"> <input
								type="hidden" name="user_id" value="${user.user_id }">
						</div> --%>
					</ul>
					<div align="center">
						<input
							onclick="document.getElementById('id01').style.display='block'"
							class="w3-button w3-gray" value="수정하기"> <input
							type="hidden" name="user_id" value="${user.user_id }">
					</div>
				</div>
			</div>
			<div align="center">
				<section class="block__62849" id="next-section">
					<div>
						<div class="col-6 col-md-6 ">
							<div class="block__16443 text-center d-block">
								<a href=""> <span class="custom-icon mx-auto"><span
										class="icon-magnet d-block"></span></span>
								</a>
								<h3>이력서Box</h3>
								<p id="ptag">이력서가없습니다.</p>
							</div>
						</div>
					</div>
				</section>
			</div>
		</form>
	</div>
	<br>
	<!-- 모달 -->
	<div>
		<div align="center">
			<input style="margin_bottom: 100px" class="w3-button w3-black"
				type="button" onclick="DeleteFunction()" value="회원탈퇴"><br>
			<br>
		</div>

		<div id="id01" class="w3-modal w3-animate-opacity">
			<div class="w3-modal-content w3-card-4">
				<!-- 헤드부븐 -->
				<header class="w3-container w3-teal">
					<span
						onclick="document.getElementById('id01').style.display='none'"
						class="w3-button w3-large w3-display-topright">&times;</span>
					<h2>내정보 수정</h2>
				</header>

				<div class="w3-container">
					<form id="frm2" method="post" action="">
						<div>
							<table>
								<tr>
									<th width="50">아이디</th>
									<td width="20"><input type="text" style="width: 70px"
										name="user_id" value="${user.user_id }" readonly></td>
									<th width="">이름</th>
									<td><textarea rows="1" cols="10" id="user_name"
											name="user_name">${user.user_name }</textarea></td>
								</tr>
								<tr>
									<th width="70">비밀번호</th>
									<td><textarea rows="1" cols="9" id="user_password"
											name="user_password">${user.user_password }</textarea></td>
									<th width="50">이메일</th>
									<td><textarea rows="1" cols="18" id="user_email"
											name="user_email">${user.user_email }</textarea></td>


									<th width="50">연락처</th>
									<td><textarea rows="1" cols="15" id="user_phone"
											name="user_phone">${user.user_phone }</textarea></td>
									<td><input type="hidden" id="user_auth" name="user_auth"
										value="USER"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>

				<!-- 하단값 -->
				<footer class="w3-container w3-teal">
					<p>수정중입니다 ...</p>
					<div align="right">
						<input type="button" onclick="Editfunction()" value="완료">
					</div>
				</footer>
			</div>
		</div>
	</div>
</body>
</html>