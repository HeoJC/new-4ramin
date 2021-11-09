<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/custom-bs.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="css/bootstrap-select.min.css">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/line-icons/style.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/animate.min.css">
	<link rel="stylesheet" href="css/quill.snow.css">
	
	<script type="text/javascript">
		function companyDelete() {
			var id1 = "${id}" ;
			var id2 = $("#com_id").val() ;
			var pw1 = "${pw}" ;
			var pw2 = $("#com_pw").val() ;
			var reg1 = "${com_reg}" ;
			var reg2 = $("#com_reg").val() ;
			
			if ( id2 == "" || pw2 == "" || reg2 == "") {
				alert("내용을 입력하세요") ;
				return 
			}
			if ( id1 != id2 ) {
				alert("아이디가 일치하지 않습니다")
				frm.com_id.focus() ;
				return
			}
			if ( pw1 != pw2 ) {
				alert("비밀번호가 일치하지 않습니다")
				frm.com_pw.focus() ;
				return
			}
			if ( reg1 != reg2 ) {
				alert("사업자 등록번호가 일치하지 않습니다")
				frm.com_reg.focus() ;
				return
			}
			
			alert("탈퇴되었습니다") ;
			frm.action = "companyDelete.do" ;
			frm.submit() ;
		}
	</script>
</head>
<body>
<section class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5">
					<h2 class="mb-4">사업자 본인확인</h2>
					<form id="frm" action="companyDelete.do" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">아이디</label> <input
									type="text" id="com_id" name="com_id" class="form-control"
									placeholder="businessperson - ID">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">비밀번호</label> <input
									type="password" id="com_pw" name="com_pw" class="form-control"
									placeholder="Password">
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">사업자 번호</label> <input
									type="password" id="com_reg" name="com_reg" class="form-control"
									placeholder="businessperson - number">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12">
								<button onclick="companyDelete()" class="btn px-4 btn-primary text-white">탈퇴하기</button>									
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/stickyfill.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/quill.min.js"></script>
	<script src="js/bootstrap-select.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>