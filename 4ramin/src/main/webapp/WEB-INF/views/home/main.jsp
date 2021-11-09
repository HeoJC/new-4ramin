<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
	<title>4RAMIN</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="Free-Template.co" />
	<link rel="shortcut icon" href="ftco-32x32.png">

	<link rel="stylesheet" href="css/custom-bs.css">
	<link rel="stylesheet" href="css/jquery.fancybox.min.css">
	<link rel="stylesheet" href="css/bootstrap-select.min.css">
	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="fonts/line-icons/style.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/animate.min.css">

	<!-- MAIN CSS -->
	<link rel="stylesheet" href="css/style.css">
	
	<script type="text/javascript">
		function move(m) {
			location.href = m ;
		}
	</script>
	
</head>

<body id="top">

	<!-- <div id="overlayer"></div> -->
	<div class="loader">
		<div class="spinner-border text-primary" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>


	<div class="site-wrap">

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div> <!-- .site-mobile-menu -->


		<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<div class="site-logo col-6"><a href="main.do">4RAMIN</a></div>

					<nav class="mx-auto site-navigation">
						<ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
						
							<li><a href="main.do" class="nav-link active">홈</a></li>
						<!-- 최창인 -->
						<li class="has-children">
								<a href="javascript:void(0)">유저관련</a>
								<ul class="dropdown">

									<li><a href="UsersJoinForm.do">회원가입</a></li>
									<li><a href="UserList.do">회원목록</a></li>
								</ul>
							</li>
							<!-- 최창인 End -->
							

							<li class="has-children">
								<a href="javascript:void(0)">채용</a>
								<ul class="dropdown">

									<li><a href="searchInfo.do">전체 채용공고</a></li>
									<li><a href="adtInsertForm.do">채용공고 등록</a></li>
								</ul>
							</li>

							<li class="has-children">
								<a href="javascript:void(0)">이력서</a>
								<ul class="dropdown">

									<li><a href="resumeForm.do">내 이력서</a></li>
									<li><a href="#">이력서 관리</a></li>
								</ul>
							</li>
							
							<li class="has-children">
								<a href="javascript:void(0)">기업</a>
								<ul class="dropdown">
									<li><a href="companySelectList.do">기업 목록</a></li>
									<c:if test="${not empty com_reg}">
									<li><a href="companyMyInfo.do">기업 나의 정보</a></li>
									<li><a href="companyUpdateForm.do">기업 정보 수정 / 탈퇴</a></li>
									</c:if>
								</ul>
							</li>
						</ul>
					</nav>

					<div class="right-cta-menu text-right d-flex aligin-items-center col-6">
						<div class="ml-auto">
							<c:if test="${empty id}">
								<select name="comBranch" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block has-children" data-style="btn-white btn-lg" data-width="100%"
								data-live-search="false" onchange="move(value)">
									<option>회원가입 선택</option>
									<option value="UsersJoinForm.do">개인 회원가입</option>
									<option value="companyJoinForm.do">기업 회원가입</option>
								</select>
								<a href="loginForm.do" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
									<span class="mr-2 icon-lock_outline"></span>로그인
								</a>
							</c:if>
							<c:if test="${not empty id}">
								<c:if test="${empty com_reg }">
									<c:if test="${id != 'admin' }">
										<a href="bookMarkForm.do" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
											<span class="mr-2 icon-add"></span>즐겨찾기
										</a>
									</c:if>
									<c:if test="${id == 'admin' }">
										<a href="adminPage.do" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block">
											<span class="mr-2 icon-add"></span>관리자페이지
										</a>
									</c:if>
								</c:if>
								<a href="logout.do" class="btn btn-primary border-width-2 d-none d-lg-inline-block">
								<span class="mr-2 icon-lock_outline"></span>로그아웃</a>
							</c:if>
						</div>
					</div>

				</div>
			</div>
		</header>
		<!-- END OF NAVBAR -->

		<!-- HOME -->
		<section class="home-section section-hero overlay bg-image" style="background-image: url('images/hero_1.jpg');"
			id="home-section">

			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-12">
						<div class="mb-5 text-center">
							<h1 class="text-white font-weight-bold">채용공고 찾아보기</h1>
							<p>당신의 가족이 되어줄 기업을 찾아보세요</p>
						</div>
						<form name="searchInfo" method="post" class="search-jobs-form" action="searchInfo.do">

							<div class="row mb-5">
								<%-- 텍스트 기업이름 comName --%>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<input name="comName" type="text" class="form-control form-control-lg"
										placeholder="기업 이름">
								</div>

								<%-- 셀렉트 지역선택 comLocation --%>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<input name="adtAddress" type="text" class="form-control form-control-lg"
										placeholder="지역">
								</div>

								<!--  셀렉트 업무선택 comBranch-->
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<select name="comBranch" class="selectpicker" data-style="btn-white btn-lg" data-width="100%"
										data-live-search="false" title="업무 분야">
										<c:forEach items="${result }" var="item">
										<option>${item.com_branch }</option>
										</c:forEach>
									</select>
								</div>

								<%-- 검색버튼 --%>
								<div class="col-12 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
									<button type="submit"
										class="btn btn-primary btn-lg btn-block text-white btn-search"><span
											class="icon-search icon mr-2"></span>검색</button>
								</div>
							</div>

							<%-- 해시태그 --%>
							<div class="row">
								<div class="col-md-12 popular-keywords">
									<h3>트렌드: </h3>
									<ul class="keywords list-unstyled m-0 p-0">
										<%-- <c:forEach items="${ }" var="">
										</c:forEach> --%>
										<li><a href="#" class="">#웹개발</a></li> <!--여기는 하드코딩하겠습니다-->
										<li><a href="#" class="">#Java</a></li>
										<li><a href="#" class="">#Yedam</a></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<a href="#next" class="scroll-button smoothscroll">
				<span class=" icon-keyboard_arrow_down"></span>
			</a>

		</section>

		<section class="py-5 bg-image overlay-primary fixed overlay" id="next"
			style="background-image: url('images/hero_1.jpg');">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2 text-white"></h2>
						<p class="lead text-white">지금<br>4RAMIN에는</p>
					</div>
				</div>
				<div class="row pb-0 block__19738 section-counter">


					<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
						<div class="d-flex align-items-center justify-content-center mb-2">
							<strong class="number" data-number="<%-- 여기에 행 개수 --%>123456">0</strong>
						</div>
						<span class="caption">기업 제휴</span>
					</div>

					<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
						<div class="d-flex align-items-center justify-content-center mb-2">
							<strong class="number" data-number="<%-- 여기에 행 개수 --%>1126">0</strong>
						</div>
						<span class="caption">채용공고</span>
					</div>

					<div class="col-6 col-md-6 col-lg-3 mb-5 mb-lg-0">
						<div class="d-flex align-items-center justify-content-center mb-2">
							<strong class="number" data-number="<%-- 여기에 행 개수 --%>16">0</strong>
						</div>
						<span class="caption">유저수?</span>
					</div>


				</div>
			</div>
		</section>

		<footer class="site-footer">

			<a href="#top" class="smoothscroll scroll-top">
				<span class="icon-keyboard_arrow_up"></span>
			</a>

			<div class="container">
				<div class="row mb-5">
					<div class="col-6 col-md-3 mb-4 mb-md-0">
						<h3>h3태그</h3>
						<ul class="list-unstyled">
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
						</ul>
					</div>
					<div class="col-6 col-md-3 mb-4 mb-md-0">
						<h3>h3태그</h3>
						<ul class="list-unstyled">
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
						</ul>
					</div>
					<div class="col-6 col-md-3 mb-4 mb-md-0">
						<h3>h3태그</h3>
						<ul class="list-unstyled">
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
							<li><a href="#">li태그</a></li>
						</ul>
					</div>
					<div class="col-6 col-md-3 mb-4 mb-md-0">
						<h3>h3태그</h3>
						<div class="footer-social">
							<a href="#"><span class="icon-facebook"></span></a>
							<a href="#"><span class="icon-twitter"></span></a>
							<a href="#"><span class="icon-instagram"></span></a>
							<a href="#"><span class="icon-linkedin"></span></a>
						</div>
					</div>
				</div>

				<div class="row text-center">
					<div class="col-12">
						<p class="copyright"><small>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>
									document.write(new Date().getFullYear());
								</script> All rights reserved | <i class="icon-heart text-danger"
									aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">4RAMIN</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small>
						</p>
					</div>
				</div>
			</div>
		</footer>

	</div>

	<!-- SCRIPTS -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/stickyfill.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>

	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>

	<script src="js/bootstrap-select.min.js"></script>

	<script src="js/custom.js"></script>

</body>
</html>