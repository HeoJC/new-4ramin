<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 이력서 작성</title>
<link rel="stylesheet" href="styles.css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic|Open+Sans:300,400,500,700|Waiting+for+the+Sunrise|Shadows+Into+Light'
	rel='stylesheet' type='text/css'>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"
	type="text/javascript"></script>
</head>
<script type="text/javascript">
	function resumeJoin() {
		var rsm_idx = frm.rsm_idx.value;
		var rsm_name = frm.rsm_name.value;
		var user_id = frm.user_id.value;
		var rsm_birthday = frm.rsm_birthday.value;
		var rsm_gender = frm.rsm_gender.value;
		var rsm_idx = frm.rsm_idx.value;
		var rsm_education = frm.rsm_education.value;
		var rsm_career = frm.rsm_career.value;
		var rsm_certificate = frm.rsm_certificate.value;
		var rsm_photo = frm.rsm_photo.value;
		var rsm_tel = frm.rsm_tel.value;
		
		if ( rsm_name == "") {
			alert("성명 입력하세요") ;
			frm.com_pw.focus() ;
			return ;
		}
		if ( user_id == "") {
			alert("아이디를 입력하세요") ;
			frm.user_id.focus() ;
			return ;
		}
		if ( rsm_birthday == "") {
			alert("생년월일을 입력하세요") ;
			frm.rsm_birthday.focus() ;
			return ;
		}
		if ( rsm_gender == "") {
			alert("성별을 선택하세요") ;
			frm.rsm_gender.focus() ;
			return ;
		}
		frm.action = "resumeJoin.do" ;
		frm.submit() ;
		
		alert("회원가입이 완료되었습니다. 홈페이지로 이동합니다")
	}
</script>

<body>
<br>
<br>
	<section class="site-section">
		<div class="container">

			<div class="row align-items-center mb-5">
				<div class="col-lg-8 mb-4 mb-lg-0">
					<div class="d-flex align-items-center">
						<div>
							<h2>이력서 수정</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="row mb-5">
				<div class="col-lg-12">
				
					<form id="frm" name="frm" action="resumeJoin.do"
						class="p-4 p-md-5 border rounded">

						<br>
						<h6 class="text-black mb-5 border-bottom pb-2">*표시는 필수입력사항입니다</h6>
						
						<div class="form-group">
							<label for="email">*이력서 제목</label> <input type="text"
								class="form-control" id="rsm_title" name="rsm_title"
								placeholder="이력서 제목을 입력해 주세요">
						</div>
						
						<div class="form-group">
							<label for="email">*성 명</label> <input type="text"
								class="form-control" id="rsm_name" name="rsm_name"
								placeholder="이름을 입력해주세요">
						</div>

						<div class="form-group">
							<label for="job-title">* 유저아이디</label> <input type="text"
								class="form-control" id="user_id" name="user_id"
								placeholder="아이디 기입?">
						</div>

						<div class="form-group">
							<label for="job-title">* 생년 월일</label> <input type="date"
								class="form-control" id="rsm_birthday" name="rsm_birthday">
						</div>

						<br>
						<h3 class="text-black mb-5 border-bottom pb-2">상세 정보를 입력하세요</h3>
						<div class="form-group">
							<label for="email">*성별</label> <label class="checkbox-inline">
								<input type="checkbox" id="rsm_gender" name= "rsm_gender" value="남자">
								남
							</label> 
							<label class="checkbox-inline"> 
							<input type="checkbox" id="rsm_gender" name = "rsm_gender" value="여자">
							 여
							</label>

						</div>

						<div class="form-group">
							<label for="email">* 학력</label>
							<textarea id="rsm_education" name="rsm_education" cols="30" rows="7"
								class="form-control" placeholder="학력 입력하세요"></textarea>
						</div>

						<div class="form-group">
							<label for="email">* 경력</label>
							<textarea id="rsm_career" name="rsm_career" cols="30" rows="7"
								class="form-control" placeholder="경력을 입력하세요"></textarea>
						</div>

						<div class="form-group">
							<label for="job-location">자격증</label> <input type="text"
								class="form-control" id="rsm_certificate" name="rsm_certificate"
								placeholder="보유한 자격증을 기재하세요">
						</div>

						<div class="form-group">
							<label for="job-location">*연락처</label> <input type="text"
								class="form-control" id="rsm_tel" name="rsm_tel"
								placeholder="연락처를 입력하세요">
						</div>

						<div class="form-group">
							<label for="exampleInputFile">사진 업로드</label> <input type="file"
								id="rsm_photo" name="rsm_photo">

						</div>
						<div class="col-6">
							<button onclick="resumeJoin()"
								class="btn btn-block btn-primary btn-md">이력서 등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="row align-items-center mb-5">
			<div class="col-lg-4 ml-auto">
				<div class="row">
					<div class="col-6">
						<a href="main.do" class="btn btn-block btn-light btn-md"><span
							class="icon-open_in_new mr-2"></span>홈으로</a>
					</div>
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
</body>
</html>