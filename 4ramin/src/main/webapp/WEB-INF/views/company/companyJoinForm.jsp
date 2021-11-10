<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4RAMIN</title>

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
	function companyJoin() {
		
		var com_id = frm.com_id.value ;
		var com_pw = frm.com_pw.value ;
		var com_reg = frm.com_reg.value ;
		var com_name = frm.com_name.value ;
		var com_intro = frm.com_intro.value ;
		var com_branch = frm.com_branch.value ;
		var com_sal = frm.com_sal.value ;
		var idcheck = frm.idcheck.value ;
		var regcheck = frm.regcheck.value ;
		
		if ( com_id == "") {
			alert("아이디를 입력하세요") ;
			frm.com_id.focus() ;
			return ;
		}
		if ( com_pw == "") {
			alert("비밀번호를 입력하세요") ;
			frm.com_pw.focus() ;
			return ;
		}
		if ( com_reg == "") {
			alert("사업자 등록번호를 입력하세요") ;
			frm.com_reg.focus() ;
			return ;
		}
		if ( com_name == "") {
			alert("기업명을 입력하세요") ;
			frm.com_name.focus() ;
			return ;
		}
		if ( com_intro == "") {
			alert("기업소개를 입력하세요") ;
			frm.com_intro.focus() ;
			return ;
		}
		if ( com_branch == "") {
			alert("산업분야를 입력하세요") ;
			frm.com_branch.focus() ;
			return ;
		}
		if ( com_sal == "") {
			alert("신입직원 평균연봉을 입력하세요") ;
			frm.com_sal.focus() ;
			return ;
		}
		if ( idcheck === "중복 미확인") {
			alert("아이디 중복확인을 해주세요") ;
			frm.com_id.focus() ;
			return ;
		}
		if ( regcheck === "유효성 미확인") {
			alert("사업자등록번호 유효성확인을 해주세요") ;
			frm.com_reg.focus() ;
			return ;
		}
		frm.action = "companyJoin.do" ;
		frm.submit() ;
		
		alert("회원가입이 완료되었습니다. 홈페이지로 이동합니다")
	}
	
	function checkid() {
		
		var com_id = frm.com_id.value ;
		
		if ( com_id == "" ) {
			alert("아이디를 입력하세요") ;
			frm.com_id.focus() ;
			return ;
		}
		
		$.ajax({
			url : "companyJoinCheck.do?com_id=" + com_id ,
			type : "get" ,
			data : {
				com_id : com_id 
			} ,
			success : function(result) {
				alert(result) ;
				if (result === "이미 가입된 아이디입니다") {
					frm.com_id.value = "" ;
					frm.com_id.focus() ;
				} else {
					frm.idcheck.value = "중복 확인 완료" ;
				}
			}
		})
	}
	
	function checkreg() {
		
		var com_reg = frm.com_reg.value ;
		
		if ( com_reg == "" ) {
			alert("사업자등록번호를 입력하세요") ;
			frm.com_reg.focus() ;
			return ;
		}
		
		console.log(com_reg.substring(3,4)) ;
		console.log(com_reg.substring(6,7)) ;
		
		if ( com_reg.length < 12 || com_reg.substring(3,4) != "-" || com_reg.substring(6,7) != "-") {
			alert("사업자등록번호를 다시 확인하세요") ;
			frm.com_reg.value = "" ;
			frm.com_reg.focus() ;
		} else {
			alert("가입 가능한 사업자등록번호입니다") ;
			frm.regcheck.value = "유효성 확인완료"
		}	
	}
	
</script>
</head>
<body>
<section class="site-section">
      <div class="container">
        <div class="row align-items-center mb-5">
          <div class="col-lg-8 mb-4 mb-lg-0">
            <div class="d-flex align-items-center">
              <div>
                <h2>기업 회원 가입</h2>
              </div>
            </div>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-lg-12">
            <form id="frm" class="p-4 p-md-5 border rounded">
              
              <br>
              <h6 class="text-black mb-5 border-bottom pb-2">*표시는 필수입력사항입니다</h6>
              
              <div class="form-group">
                <label for="email">* 아이디</label>
                <input type="text" class="form-control" id="com_id" name="com_id" placeholder="기업의 로그인 아이디를 입력하세요">
              </div>
              
              <div class="form-group">
                <button type="button" class="btn btn-primary border-widt" onclick="checkid()" value="test">아이디 중복 검사</button>
                <input id="idcheck" class="btn btn-primary border-widt" readonly value="중복 미확인">
              </div>
              
              <div class="form-group">
                <label for="job-title">* 비밀번호</label>
                <input type="password" class="form-control" id="com_pw" name="com_pw" placeholder="기업의 로그인 비밀번호를 입력하세요">
              </div>
              
              <div class="form-group">
                <label for="job-title">* 사업자등록번호</label>
                <input type="text" class="form-control" id="com_reg" name="com_reg" placeholder="기업의 사업자등록번호를 입력하세요  (○○○-○○-○○○○○)">
              </div>
              
              <div class="form-group">
                <button type="button" class="btn btn-primary border-widt" onclick="checkreg()" value="test">사업자등록번호 유효성 검사</button>
                <input id="regcheck" class="btn btn-primary border-widt" readonly value="유효성 미확인">
              </div>
              
              <br>
              <h3 class="text-black mb-5 border-bottom pb-2">Company Details</h3>

              <div class="form-group">
                <label for="email">* 기업명</label>
                <input type="text" class="form-control" id="com_name" name="com_name" placeholder="기업명을 입력하세요">
              </div>
              
               <div class="form-group">
                <label for="job-title">대표자명</label>
                <input type="text" class="form-control" id="com_man" name="com_man" placeholder="기업의 대표자명을 입력하세요">
              </div>
              
              <div class="form-group">
              	<label for="email">* 기업소개</label>
              	<textarea id="com_intro" name="com_intro" cols="30" rows="7" class="form-control" placeholder="간단한 기업소개를 입력하세요"></textarea>
              </div>
              
              <div class="form-group">
                <label for="job-location">* 산업분야</label>
                <input type="text" class="form-control" id="com_branch" name="com_branch" placeholder="기업의 산업분야를 입력하세요">
              </div>
              
              <div class="form-group">
                <label for="job-location">주소</label>
                <input type="text" class="form-control" id="com_loc" name="com_loc" placeholder="기업의 위치를 입력하세요">
              </div>
              
              <div class="form-group">
                <label for="job-location">대표전화</label>
                <input type="text" class="form-control" id="com_phone" name="com_phone" placeholder="기업의 연락처를 입력하세요">
              </div>
              
              <div class="form-group">
                <label for="job-location">이메일</label>
                <input type="text" class="form-control" id="com_email" name="com_email" placeholder="기업의 이메일을 입력하세요">
              </div>

              <div class="form-group">
                <label for="job-region">임직원수</label>
                <select class="selectpicker border rounded" id="com_imp" name="com_imp" data-style="btn-black" data-width="100%" data-live-search="true" title="임직원수를 선택하세요">
                      <option>10인 미만</option>
                      <option>10인 이상 50인 미만</option>
                      <option>50인 이상 100인 미만</option>
                      <option>100인 이상 200인 미만</option>
                      <option>200인 이상</option>
                    </select>
              </div>
              
              <div class="form-group">
                <label for="job-region">* 신입 평균 연봉</label>
                <select class="selectpicker border rounded" id="com_sal" name="com_sal" data-style="btn-black" data-width="100%" data-live-search="true" title="신입직원의 평균연봉을 선택하세요">
                      <option>2500만원</option>
                      <option>2600만원</option>
                      <option>2700만원</option>
                      <option>2800만원</option>
                      <option>2900만원</option>
                      <option>3000만원</option>
                    </select>
              </div>
            </form>
          </div>
        </div>
        <div class="row align-items-center mb-5">
          <div class="col-lg-4 ml-auto">
            <div class="row">
              <div class="col-6">
                <a href="main.do" class="btn btn-block btn-light btn-md"><span class="icon-open_in_new mr-2"></span>홈으로</a>
              </div>
              <div class="col-6">
                <button onclick="companyJoin()" class="btn btn-block btn-primary btn-md">가입하기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
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