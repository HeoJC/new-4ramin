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
<script type="text/javascript">
	function companyJoin() {
		
		var com_id = frm.com_id.value ;
		var com_pw = frm.com_pw.value ;
		var com_reg = frm.com_reg.value ;
		var com_name = frm.com_name.value ;
		var com_intro = frm.com_intro.value ;
		var com_sal = frm.com_sal.value ;
		
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
		frm.action = "companyJoin.do" ;
		frm.submit() ;
		
		alert("회원가입이 완료되었습니다. 홈페이지로 이동합니다")
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
                <label for="job-title">* 비밀번호</label>
                <input type="password" class="form-control" id="com_pw" name="com_pw" placeholder="기업의 로그인 비밀번호를 입력하세요">
              </div>
              
              <div class="form-group">
                <label for="job-title">* 사업자등록번호</label>
                <input type="text" class="form-control" id="com_reg" name="com_reg" placeholder="기업의 사업자등록번호를 입력하세요">
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
                <label for="job-location">산업분야</label>
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
                      <option>2,400만원 미만</option>
                      <option>2,400만원 이상 2,500만원 미만</option>
                      <option>2,500만원 이상 2,600만원 미만</option>
                      <option>2,600만원 이상 2,700만원 미만</option>
                      <option>2,700만원 이상</option>
                      <option>회사 내규에 따름</option>
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