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
      function userJoin() {
        var pw = frm.user_password.value;
        var pwr = frm.user_passwordRE.value;
        if (frm.user_id.value == "") {
          alert("아이디 를 입력해주세요")
          frm.user_id.focus();
          return false;
        }
        if (frm.user_password.value == "") {
          alert("비밀번호 를 입력해주세요")
          frm.user_password.focus();
          return false;
        }
        if (frm.user_name.value == "") {
          alert("이름을 입력해주세요")
          frm.user_name.focus();
          return false;
        }
        if (frm.user_phone.value == "") {
          alert("연락처 를 입력해주세요")
          frm.user_phone.focus();
          return false;
        }
        if (frm.user_email.value == "") {
          alert("이메일 을 입력해주세요")
          frm.user_email.focus();
          return false;
        }
    
        if (pw == pwr) {
        	frm.submit();
        } else {
          alert("비밀번호가 다릅니다.");
          frm.user_password.value = "";
          frm.user_passwordRE.value = "";
          frm.user_password.focus();
          return false;
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
                <h2>개인 회원가입</h2>
              </div>
            </div>
          </div>
        </div>
        <div class="row mb-5">
          <div class="col-lg-12">
            <form id="frm" class="p-4 p-md-5 border rounded" action="UsersJoin.do">
              
              <br>
              <h6 class="text-black mb-5 border-bottom pb-2">*표시는 필수입력사항입니다</h6>
              
              <div class="form-group">
                <label for="email">* 아이디</label>
                <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디를 입력해주세요">
              </div>
              
              <div class="form-group">
                <label for="job-title">* 비밀번호</label>
                <input type="text" class="form-control" id="user_password" name="user_password" placeholder="비밀번호를 입력해주세요">
              </div>

              <div class="form-group">
                <label for="job-title">* 비밀번호 재입력</label>
                <input type="text" class="form-control" id="user_passwordRE" name="user_passwordRE" placeholder="똑같이 입력해주세요">
              </div>
              
              <div class="form-group">
                <label for="job-title">* 이름</label>
                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="본인 이름을 입력주세요">
              </div>

              <div class="form-group">
                <label for="email">* 연락처</label>
                <input type="text" class="form-control" id="user_phone" name="user_phone" placeholder=" - 없이 입력해주세요">
              </div>
              
               <div class="form-group">
                <label for="job-title">Email</label>
                <input type="text" class="form-control" id="user_email" name="user_email" placeholder="이메일을 입력주세요">
              </div>
              <div>
              	<input type="hidden" id="user_auth" name="user_auth" value="USER">
              </div>
              <div>
              	<input type="checkbox"> <a>4ramin 에서 호객님의 정보를 기업에게 공개할수도있습니다.</a>
              </div>
              <br>
              <h3 class="text-black mb-5 border-bottom pb-2">4ramin 에 오신것을 환영합니다</h3>
              
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
                <button onclick="userJoin()" class="btn btn-block btn-primary btn-md">가입하기</button>
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