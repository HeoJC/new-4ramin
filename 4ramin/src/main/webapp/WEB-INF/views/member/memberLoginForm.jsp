<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>4RAMIN</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/custom-bs.css">
<link rel="stylesheet" href="css/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="fonts/line-icons/style.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/quill.snow.css">

<script src="js/jquery.min.js"></script>

<script type="text/javascript">
	function companyLogin() { 
		var com_id = $("#com_id").val() ;
		var com_pw = $("#com_pw").val() ;
		var com_reg = $("#com_reg").val() ;
		
		$.ajax({
			url : "companyLogin.do" ,
			type : "get" ,
			data : {
				com_id : com_id ,
				com_pw : com_pw ,
				com_reg : com_reg
			} ,
			datatype : "json" ,
			success: function() {
				location.href = "main.do" ; 
		    } ,
		    error : function() {
		        alert("아이디 혹은 비밀번호 혹은 사업자번호를 다시 확인하세요") ;
		        return ;
		    }
		})
	}
	
	function userLogin() {
		var user_id = $("#user_id").val() ;
		var user_password = $("#user_password").val() ;
		
		$.ajax({
			url : "userLogin.do" ,
			type : "get" ,
			data : {
				user_id : user_id ,
				user_password : user_password
			} ,
			datatype : "json" ,
			success : function() {
				location.href = "main.do" ;
			} ,
			error : function() {
				alert("아이디 혹은 비밀번호를 다시 확인하세요") ;
				return ;
			}
		})
	}
</script>

<!-- MAIN CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body id="top">
	<!-- HOME -->
		<section class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5">
					<h2 class="mb-4">사업자 회원전용 로그인</h2>
					<form id="frm" action="companyLogin.do" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">아이디</label> <input
									type="text" id="com_id" name="com_id" class="form-control"
									placeholder="기업 로그인 아이디를 입력하세요">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">비밀번호</label> <input
									type="password" id="com_pw" name="com_pw" class="form-control"
									placeholder="기업 로그인 비밀번호를 입력하세요">
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">사업자 번호</label> <input
									type="password" id="com_reg" name="com_reg" class="form-control"
									placeholder="사업자 등록번호를 입력하세요">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<input type="button" value="Log in" onclick="companyLogin()"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>
						
					</form>
				</div>
				<div class="col-lg-6">
					<h2 class="mb-4">회원용 로그인</h2>
					<form id="frm2" action="UserLogin.do" class="p-4 border rounded">

						<div class="row form-group">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">아이디</label> <input
									type="text" id="user_id" name="user_id" class="form-control"
									placeholder="개인 로그인 아이디를 입력하세요">
							</div>
						</div>
						<div class="row form-group mb-4">
							<div class="col-md-12 mb-3 mb-md-0">
								<label class="text-black" for="fname">비밀번호</label> <input
									type="password" id="user_password" name="user_password" class="form-control"
									placeholder="개인 로그인 비밀번호를 입력하세요">
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12">
								<input type="button" value="Log In" onclick="userLogin()"
									class="btn px-4 btn-primary text-white">
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</section>

	<section class="py-5 bg-image overlay-primary fixed overlay" style="background-image: url('images/hero_1.jpg');">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-8">
            <h2 class="text-white">일을 찾고 계신가요?</h2>
            <p class="mb-0 text-white lead">고객의 시간 확보를 방해합니다.</p>
          </div>
          <div class="col-md-3 ml-auto">
            <a href="UsersJoinForm.do" class="btn btn-warning btn-block btn-lg">가입하기 !</a>
          </div>
        </div>
      </div>
      
    </section>

	<!-- SCRIPTS -->
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